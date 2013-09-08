﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Transactions;
using MetraTech.ActivityServices.Common;
using MetraTech.Basic.Config;
using MetraTech.Basic.Exception;
using MetraTech.DataAccess;
using MetraTech.Domain.Quoting;
// TODO: Add auditor to Quote
// using MetraTech.Interop.MTAuditEvents;
using MetraTech.Interop.MTBillingReRun;
using MetraTech.Interop.QueryAdapter;
using MetraTech.Pipeline;
using MetraTech.Quoting.Charge;
using MetraTech.UsageServer;
using Auth = MetraTech.Interop.MTAuth;
using MetraTech.Interop.MTProductCatalog;
using BillingReRunClient = MetraTech.Pipeline.ReRun;

namespace MetraTech.Quoting
{
  public class QuotingImplementation : IQuotingImplementation
  {
    protected QuotingConfiguration Configuration { get; set; }
    // TODO: Add auditor to Quote
    //private Auditor quotingAuditor = new Auditor();
    private static ILogger _log;
    private IList<ICharge> _charges;

    private int UsageIntervalForQuote { get; set; }

    private readonly List<MTSubscription> createdSubsciptions = new List<MTSubscription>();
    private readonly List<IMTGroupSubscription> createdGroupSubsciptions = new List<IMTGroupSubscription>();

    #region Constructors

    public QuotingImplementation(QuotingConfiguration configuration, Auth.IMTSessionContext sessionContext,
                                    IQuotingRepository quotingRepository, IList<ICharge> charges, ILogger log)
    {
        Init(configuration, sessionContext, quotingRepository, charges, log);
    }

    private void Init(QuotingConfiguration configuration, Auth.IMTSessionContext sessionContext,
                      IQuotingRepository quotingRepository, IList<ICharge> charges, ILogger log)
    {
        Configuration = configuration;
        SessionContext = sessionContext;
        QuotingRepository = quotingRepository;
        _charges = charges;
        _log = log;
    }

    public QuotingImplementation(QuotingConfiguration configuration, Auth.IMTSessionContext sessionContext,
                                    IQuotingRepository quotingRepository, IList<ICharge> charges)
        : this(
            configuration, sessionContext, quotingRepository, charges,
            new Logger(String.Format("[{0}]", typeof(QuotingImplementation))))
    {
    }

    private IList<ICharge> InitDefaultChrages()
    {
        return new List<ICharge>
        { 
            new ReccurringCharge(Configuration, new ChargeMetering(Configuration, _log), _log),
            new NonReccuringCharge(Configuration, new ChargeMetering(Configuration, _log), _log)
        };
    }

      public QuotingImplementation(QuotingConfiguration configuration, Auth.IMTSessionContext sessionContext,
                                    IQuotingRepository quotingRepository)
    {
        Init(configuration, sessionContext, quotingRepository, null ,
            new Logger(String.Format("[{0}]", typeof(QuotingImplementation))));

        _charges = InitDefaultChrages();
    }

    public QuotingImplementation(QuotingConfiguration configuration, Auth.IMTSessionContext sessionContext) :
        this(configuration, sessionContext, new QuotingRepository())
    {
    }

    public QuotingImplementation(QuotingConfiguration configuration) :
        this(configuration, null)
    {
    }

    public QuotingImplementation() :
        this(QuotingConfigurationManager.LoadConfigurationFromFile(
            Path.Combine(SystemConfig.GetRmpDir(), "config", "Quoting", "QuotingConfiguration.xml")), null)
    {
    }

    #endregion Constructors

    #region Public

    public IQuotingRepository QuotingRepository { get; private set; }

    public QuoteRequest CurrentRequest { get; private set; }
    
    public QuoteResponse CurrentResponse { get; private set; } 


    /// <summary>
    /// Validate request, prepare data for metering and finaly creats quote
    /// </summary>
    /// <param name="quoteRequest"></param>
    /// <returns>QuoteResponse</returns>
    public QuoteResponse CreateQuote(QuoteRequest quoteRequest)
    {
      //TODO: Should we add check that pipeline/inetinfo/activityservices are running before starting quote. We think nice to have and maybe configurable
        using (new MetraTech.Debug.Diagnostics.HighResolutionTimer(MethodInfo.GetCurrentMethod().Name))
      {
        CurrentResponse = new QuoteResponse();

        SetNewQuoteLogFormater(quoteRequest, CurrentResponse);

        CurrentResponse.MessageLog = new List<QuoteLogRecord>();

        createdSubsciptions.Clear();
        createdGroupSubsciptions.Clear();

        ValidateRequest(quoteRequest);

        CurrentRequest = quoteRequest;

        try
        {
            //Add this quote into repository and get a new quote id
            CurrentResponse.idQuote = QuotingRepository.CreateQuote(quoteRequest, SessionContext);

            StartQuoteInternal();

            //If we need here, here is the place for things that need to be generated, totaled, etc. before we
            //generate PDF and return results
            CalculateQuoteTotal(CurrentResponse);

            if (CurrentRequest.ReportParameters.PDFReport)
            {
                GeneratePDFForCurrentQuote();
            }

            //todo: Save or update data about quote in DB
            CurrentResponse = QuotingRepository.UpdateQuoteWithResponse(CurrentResponse);
            QuotingRepository.SaveQuoteLog(CurrentResponse.MessageLog);
            
        }
        catch (Exception ex)
        {
            _log.LogError("Current quote failed and being cleaned up: {0}", ex);

            CurrentResponse.Status = QuoteStatus.Failed;
            CurrentResponse.FailedMessage = ex.GetaAllMessages();

            CurrentResponse = QuotingRepository.UpdateQuoteWithErrorResponse(CurrentResponse.idQuote, CurrentResponse,
                                                                             ex.Message);
            throw;
        }
        finally
        {
            Cleanup(CurrentResponse.ChargesCollection);
        }

        return CurrentResponse;
      }
    }

    private void SetNewQuoteLogFormater(QuoteRequest quoteRequest, QuoteResponse currentResponse)
    {
        _log.SetFormatter((message, args) =>
        {
            string newFormater
                = String.Format("Quote[{0}]: [{1}]", currentResponse.idQuote, String.Format(message, args));

            CurrentResponse.MessageLog.Add(new QuoteLogRecord
            {
                QuoteIdentifier = quoteRequest.QuoteIdentifier,
                DateAdded = MetraTime.Now,
                Message = message
            });

            return newFormater;
        });
    }

    #endregion

    #region Internal

    /// <summary>
    /// Method that validates/sanity checks the request and throws exceptions if there are errors
    /// </summary>
    /// <param name="request">QuoteRequest to be checked</param>
    /// <exception cref="ArgumentException"></exception>
    protected void ValidateRequest(QuoteRequest request)
    {

      if (request.IcbPrices == null)
            request.IcbPrices = new List<QuoteIndividualPrice>();

      if (request.SubscriptionParameters.IsGroupSubscription && request.IcbPrices.Count > 0)
      {
        throw new Exception("Current limitation of quoting: ICBs are applied only for individual subscriptions");
      }


      DateTime currentDate = MetraTime.Now.Date;
      if (request.EffectiveDate.Date < currentDate)
      {
        string propertyName = PropertyName<QuoteRequest>.GetPropertyName(p => p.EffectiveDate);
        throw new ArgumentException(
          String.Format("'{0}'='{1}' can't be less than current time '{2}'", propertyName,
                        request.EffectiveDate.Date, currentDate), propertyName);
      }



      //EffectiveDate must be set
      if (request.EffectiveDate == null || request.EffectiveDate == DateTime.MinValue)
      {
        string propertyName = PropertyName<QuoteRequest>.GetPropertyName(p => p.EffectiveDate);
        throw new ArgumentException(String.Format("'{0}' must be specified", propertyName), propertyName);
      }

      if (request.EffectiveEndDate < request.EffectiveDate)
      {
        string propertyStartDate = PropertyName<QuoteRequest>.GetPropertyName(p => p.EffectiveDate);
        string propertyEndDate = PropertyName<QuoteRequest>.GetPropertyName(p => p.EffectiveEndDate);
        throw new ArgumentException(
          String.Format("The Start date can not be greater than End date. Start date '{0}'='{1}' > End date '{2}'='{3}'"
                        , propertyStartDate, request.EffectiveDate
                        , propertyEndDate, request.EffectiveEndDate)
          , propertyEndDate);
      }

      //At least one account must be specified
      if (!(request.Accounts.Count > 0))
      {
        throw new ArgumentException("At least one account must be specified for the quote"
                                    , PropertyName<QuoteRequest>.GetPropertyName(p => p.Accounts));
      }

      //todo check for the same usage cycle for all accounts
      //if (!(request.Accounts.Count > 0)) { throw new ArgumentException("At least one account must be specified for the quote", "Accounts"); }

      //At least one po must be specified since we only do RCs and NRCs currently; in the future this won't be a restriction
      if (!(request.ProductOfferings.Count > 0))
      {
        throw new ArgumentException(
          "At least one product offering must be specified for the quote as quoting currently only quotes for RCs and NRC"
          , PropertyName<QuoteRequest>.GetPropertyName(p => p.ProductOfferings));
      }

      // Ensure that all accounts are in the same billing cycle
      var first = GetAccountBillingCycle(request.Accounts.First());
      if (!(request.Accounts.All(e => GetAccountBillingCycle(e) == first)))
      {
        throw new ArgumentException("All accounts must be in the same billing cycle"
                                    , PropertyName<QuoteRequest>.GetPropertyName(p => p.Accounts));
      }

      // Ensure that all payers are in the quote request
      var idPayers = request.Accounts.Select(e => GetAccountPayer(e));
      if (!idPayers.All(e => request.Accounts.Contains(e)))
      {
        throw new ArgumentException("All account payers must be included in the quote request"
                                    , PropertyName<QuoteRequest>.GetPropertyName(p => p.Accounts));
      }     
    }

    protected int GetAccountBillingCycle(int idAccount)
    {
      using (var conn = ConnectionManager.CreateNonServicedConnection())
      {
        using (
          var stmt = conn.CreateAdapterStatement(Configuration.QuotingQueryFolder, Configuration.GetAccountBillingCycleQueryTag))
        {
          stmt.AddParam("%%ACCOUNT_ID%%", idAccount);
          using (var rowset = stmt.ExecuteReader())
          {
            if (!rowset.Read())
              throw new ApplicationException(string.Format("The account {0} has no billing cycle", idAccount));

            return rowset.GetInt32("AccountCycleType");
          }
        }
      }
    }

    protected int GetAccountPayer(int idAccount)
    {
      int payer;

      using (IMTNonServicedConnection conn = ConnectionManager.CreateNonServicedConnection())
      {
        using (
          IMTAdapterStatement stmt = conn.CreateAdapterStatement(Configuration.QuotingQueryFolder,
                                                                 Configuration.GetAccountPayerQueryTag))
        {
          stmt.AddParam("%%ACCOUNT_ID%%", idAccount);
          using (IMTDataReader rowset = stmt.ExecuteReader())
          {
            rowset.Read();
            payer = rowset.GetInt32("AccountPayer");
          }
        }
      }

      return payer;
    }

    protected void StartQuoteInternal()
    {
      //Create the needed subscriptions for this quote
      CreateNeededSubscriptions();

        using (var conn = ConnectionManager.CreateConnection())
        {
            foreach (ICharge charge in _charges)
            {
                CurrentResponse.ChargesCollection.Add(charge.Add(conn, CurrentRequest));
            }
        }

      //Determine Usage Interval to use when quoting
      UsageIntervalForQuote = ChargeMetering.GetUsageInterval(Configuration, CurrentRequest);
    }

    protected void GeneratePDFForCurrentQuote()
    {
      using (new Debug.Diagnostics.HighResolutionTimer("GeneratePDFForCurrentQuote"))
      {
         //TODO: Eventually cache/only load configuration as needed
          var quoteReportingConfiguration = QuoteReportingConfigurationManager.LoadConfiguration(this.Configuration);
          var quotePDFReport = new QuotePDFReport(quoteReportingConfiguration);

          //If request does not specify a template to use, then use the configured default
          if (string.IsNullOrEmpty(CurrentRequest.ReportParameters.ReportTemplateName))
          {
            CurrentRequest.ReportParameters.ReportTemplateName = this.Configuration.ReportDefaultTemplateName;
          }

          CurrentResponse.ReportLink = quotePDFReport.CreatePDFReport(CurrentResponse.idQuote,
                                                                      CurrentRequest.Accounts[0],
                                                                      CurrentRequest.ReportParameters.ReportTemplateName,
                                                                      GetLanguageCodeIdForCurrentRequest());
      }
    }

    protected int GetLanguageCodeIdForCurrentRequest()
    {
      //TODO: Sort out using cultures for real and match them against either enum or database

      string temp = CurrentRequest.Localization;
      if (string.IsNullOrEmpty(temp))
      {
        //Not specified, default to "en-US"
        //temp = "en-US";
        return 840;
      }

      //Step 1: Try if this is int, then must have passed language id itself
      int possibleLanguageCodeId;
      if (int.TryParse(temp, out possibleLanguageCodeId))
      {
        return possibleLanguageCodeId;
      }

      //Step 2: Convert/lookup culture to database id (i.e. "en-US" = 840)
      //For now, until we have time, hard code the existing list but won't be extensible
      //Can't believe I've been reduced to this kind of code; feel dirty with the only solice that a 
      //story is in the backlog to be prioritized
      switch (temp.ToLower())
      {
        case "en-us":
          return 840;
        case "de-de":
          return 276;
        case "fr":
          return 250;
        case "it":
          return 380;
        case "ja":
          return 392;
        case "es":
          return 724;
        case "en-gb":
          return 826;
        case "ex-mx":
          return 2058;
        case "pt-br":
          return 1046;
        case "da":
          return 2059;
      }

      _log.LogWarning(
        "Unable to convert culture of {0} to MetraTech language code database id; using 840 for 'en-US'", temp);

      return 840;

    }

    protected int GetPrimaryAccountId()
    {
      //For now, assume that the first account specified for the quote is the 'primary'
      //In the future, may pass a specific parameter
      if (CurrentRequest == null || CurrentRequest.Accounts.Count == 0)
        throw new ArgumentException("Must specify accounts");

      return CurrentRequest.Accounts[0];
    }

    public string GetQueryToUpdateInstantRCConfigurationValue(bool value)
    {
      IMTQueryAdapter qa = new MTQueryAdapterClass();
      qa.Init(@"Queries\ProductCatalog");

      qa.SetQueryTag("__SET_INSTANTRC_VALUE__");
      qa.AddParam("%%INSTANT_RC_ENABLED%%", value.ToString().ToLower());

      return qa.GetQuery().Trim();
    }

    private static readonly object _obj = new object();

      //TODO: Should be refacored. It should be in seperate class
    protected void CreateNeededSubscriptions()
    {
      //TODO: Determine if this lock is necessary and if so, give it a better/more descriptive name and comment
      lock (_obj)
      {
        #region Check and turn off InstantRCs if needed

        bool instantRCsEnabled = true;
        //Check and turn off InstantRCs
        using (IMTConnection conn = ConnectionManager.CreateConnection())
        {
          using (var stmt = conn.CreateAdapterStatement(@"Queries\ProductCatalog", "__GET_INSTANTRC_VALUE__"))
          {
            using (IMTDataReader reader = stmt.ExecuteReader())
            {
              if (reader.Read())
              {
                instantRCsEnabled = reader.GetBoolean("InstantRCValue");
              }
              else
              {
                string errorMessage = "Unable to retrieve InstantRC setting";
                throw new ApplicationException(errorMessage);
              }
            }
          }

          if (instantRCsEnabled)
          {
            using (IMTStatement stmt = conn.CreateStatement(GetQueryToUpdateInstantRCConfigurationValue(false)))
            {
              stmt.ExecuteNonQuery();
            }
          }
        }

        #endregion

        var transactionOption = new TransactionOptions();
        transactionOption.IsolationLevel = IsolationLevel.ReadUncommitted;
        using (var scope = new TransactionScope(TransactionScopeOption.RequiresNew,
                                                transactionOption,
                                                EnterpriseServicesInteropOption.Full))
        {
          if (!CurrentRequest.SubscriptionParameters.IsGroupSubscription)
            foreach (var idAccount in CurrentRequest.Accounts)
            {
              var acc = CurrentProductCatalog.GetAccount(idAccount);
              foreach (int po in CurrentRequest.ProductOfferings)
              {
                CreateIndividualSubscriptionForQuote(acc, po, idAccount);
              }
            }
          else
            foreach (var offerId in CurrentRequest.ProductOfferings)
            {
              CreateGroupSubscriptionForQuote(offerId,
                                              CurrentRequest.SubscriptionParameters.CorporateAccountId,
                                              CurrentRequest.Accounts);
            }
          scope.Complete();
        }


        #region Turn InstantRCs back on

        if (instantRCsEnabled)
        {
          using (IMTConnection conn = ConnectionManager.CreateConnection())
          {
            using (
              IMTStatement stmt = conn.CreateStatement(GetQueryToUpdateInstantRCConfigurationValue(instantRCsEnabled)))
            {
              stmt.ExecuteNonQuery();
            }
          }
        }

        #endregion
      }
    }

    /// <summary>
    /// Create Group Subscription and add its ID into createdGroupSubsciptions
    /// </summary>
    /// <param name="offerId"></param>
    /// <param name="corporateAccountId"></param>
    /// <param name="accountList"></param>
    /// /// <remarks>Should be run in one transaction with the same call for all POs in QuoteRequest</remarks>
    private void CreateGroupSubscriptionForQuote(int offerId, int corporateAccountId, IEnumerable<int> accountList)
    {
      var effectiveDate = new MTPCTimeSpanClass
        {
          StartDate = CurrentRequest.EffectiveDate,
          StartDateType = MTPCDateType.PCDATE_TYPE_ABSOLUTE,
          EndDate = CurrentRequest.EffectiveEndDate,
          EndDateType = MTPCDateType.PCDATE_TYPE_ABSOLUTE
        };

      //TODO: Figure out correct cycle for group sub or if it should be passed
      var groupSubscriptionCycle = new MTPCCycle
        {
          CycleTypeID = 1,
          EndDayOfMonth = 31
        };

      IMTGroupSubscription mtGroupSubscription = CurrentProductCatalog.CreateGroupSubscription();
      mtGroupSubscription.EffectiveDate = effectiveDate;
      mtGroupSubscription.ProductOfferingID = offerId;
      mtGroupSubscription.ProportionalDistribution = true; //Part of request?
      //if (!groupSubscription.ProportionalDistribution)
      //{
      //  mtGroupSubscription.DistributionAccount = groupSubscription.DiscountAccountId.Value;
      //}
      mtGroupSubscription.Name = string.Format("TempQuoteGSForPO_{0}Quote_{1}", offerId,
                                               CurrentResponse.idQuote);
      mtGroupSubscription.Description = "Group subscription for Quoting. ProductOffering: " + offerId;
      mtGroupSubscription.SupportGroupOps = true; // Part of request?
      mtGroupSubscription.CorporateAccount = corporateAccountId;
      mtGroupSubscription.Cycle = groupSubscriptionCycle;

      foreach (MTPriceableItem pi in CurrentProductCatalog.GetProductOffering(offerId).GetPriceableItems())
      {
        switch (pi.Kind)
        {
          case MTPCEntityType.PCENTITY_TYPE_RECURRING:
            mtGroupSubscription.SetChargeAccount(pi.ID, corporateAccountId,
                                                 CurrentRequest.EffectiveDate, CurrentRequest.EffectiveEndDate);
            break;
          case MTPCEntityType.PCENTITY_TYPE_RECURRING_UNIT_DEPENDENT:
            mtGroupSubscription.SetChargeAccount(pi.ID, corporateAccountId,
                                                 CurrentRequest.EffectiveDate, CurrentRequest.EffectiveEndDate);
            try
            {
              if (CurrentRequest.SubscriptionParameters.UDRCValues.ContainsKey(offerId.ToString()))
              {
                foreach (var udrcInstanceValue in CurrentRequest.SubscriptionParameters.UDRCValues[offerId.ToString()])
                {
                  mtGroupSubscription.SetRecurringChargeUnitValue(udrcInstanceValue.UDRC_Id,
                                                                  udrcInstanceValue.Value,
                                                                  udrcInstanceValue.StartDate,
                                                                  udrcInstanceValue.EndDate);
                }
              }
            }
            catch (COMException come)
            {
              if (come.Message.Contains("not found in database"))
              {
                _log.LogError(come.Message);
                throw new ArgumentException("Subscription failed with message: " + come.Message +
                                            "\nUDRC ID added to SubscriptionParameters does not exist");
              }
              throw;
            }
            break;
        }
      }

      mtGroupSubscription.Save();
      createdGroupSubsciptions.Add(mtGroupSubscription);
      foreach (var mtGsubMember in accountList.Select(id => GetSubMember(id, CurrentRequest)))
      {
        mtGroupSubscription.AddAccount(mtGsubMember);
      }
      mtGroupSubscription.Save();
      createdGroupSubsciptions.Add(mtGroupSubscription);
    }

    private static MTGSubMember GetSubMember(int accountId, QuoteRequest quoteRequest)
    {
      return new MTGSubMember
        {
          AccountID = accountId,
          StartDate = quoteRequest.EffectiveDate,
          EndDate = quoteRequest.EffectiveEndDate
        };
    }

    /// <summary>
    /// Create Individual Subscription, apply ICBs and add its ID into CreatedSubscription
    /// </summary>
    /// <param name="acc"></param>
    /// <param name="po"></param>
    /// <param name="idAccount"></param>
    /// <remarks>Should be run in one transaction with the same call for all accounts and POs in QuoteRequest</remarks>
    private void CreateIndividualSubscriptionForQuote(MTPCAccount acc, int po, int idAccount)
    {
      var effDate = new MTPCTimeSpanClass
        {
          StartDate = CurrentRequest.EffectiveDate,
          StartDateType = MTPCDateType.PCDATE_TYPE_ABSOLUTE
        };

      object modifiedDate = MetraTime.Now;
      var subscription = acc.Subscribe(po, effDate, out modifiedDate);

      try
      {
        if (CurrentRequest.SubscriptionParameters.UDRCValues.ContainsKey(po.ToString()))
        {
          foreach (
            var udrcInstanceValue in
              CurrentRequest.SubscriptionParameters.UDRCValues[po.ToString()])
          {
            subscription.SetRecurringChargeUnitValue(udrcInstanceValue.UDRC_Id,
                                                     udrcInstanceValue.Value,
                                                     udrcInstanceValue.StartDate,
                                                     udrcInstanceValue.EndDate);
          }
        }
      }
      catch (COMException come)
      {
        if (come.Message.Contains("not found in database"))
        {
          _log.LogError(come.Message);
          throw new ArgumentException("Subscription failed with message: " + come.Message +
                                      "\nUDRC ID added to SubscriptionParameters does not exist");
        }

        throw;
      }

      subscription.Save();

      ApplyIcbPricesToSubscription(subscription.ProductOfferingID, subscription.ID);

      createdSubsciptions.Add(subscription);
    }

    private void ApplyIcbPricesToSubscription(int productOfferingId, int subscriptionId)
    {
      if (CurrentRequest.IcbPrices == null) return;

      var icbPrices = CurrentRequest.IcbPrices.Where(ip => ip.ProductOfferingId == productOfferingId);
      foreach (var price in icbPrices)
        Application.ProductManagement.PriceListService.SaveRateSchedulesForSubscription(
          subscriptionId,
          new PCIdentifier(price.PriceableItemInstanceId),
          new PCIdentifier(price.ParameterTableId),
          price.RateSchedules,
          _log,
          SessionContext);
    }

    private string GetBatchIdsForQuery(IEnumerable<ChargeData> charges)
    {
      string sqlTemplate = "cast(N'' as xml).value('xs:base64Binary(\"{0}\")', 'binary(16)' ),";

      var res = charges.Aggregate("", (current, charge) => current + String.Format(sqlTemplate, charge.IdBatch));

      return res.Substring(0, res.Length - 1);
    }

    private decimal GetDecimalProperty(IMTDataReader rowset, string property)
    {
      try
      {
        return rowset.GetDecimal(property);
      }
      catch (InvalidOperationException)
      {
        return 0M;
      }
      catch (SqlNullValueException)
      {
        return 0M;
      }
    }

    private string GetStringProperty(IMTDataReader rowset, string property)
    {
      try
      {
        return rowset.GetString(property);
      }
      catch (InvalidOperationException)
      {
        return "";
      }
      catch (SqlNullValueException)
      {
        return "";
      }
    }

    protected void CalculateQuoteTotal(QuoteResponse quoteResponse)
    {
      using (var conn = ConnectionManager.CreateConnection())
      {
          using (IMTAdapterStatement stmt = conn.CreateAdapterStatement(Configuration.QuotingQueryFolder,
                                                                      Configuration.CalculateQuoteTotalAmountQueryTag))
        {
          stmt.AddParam("%%USAGE_INTERVAL%%", UsageIntervalForQuote);
          stmt.AddParam("%%ACCOUNTS%%", string.Join(",", CurrentRequest.Accounts));
          stmt.AddParam("%%BATCHIDS%%", GetBatchIdsForQuery(quoteResponse.ChargesCollection), true);
          using (IMTDataReader rowset = stmt.ExecuteReader())
          {
            rowset.Read();

            CurrentResponse.TotalAmount = GetDecimalProperty(rowset, "Amount");
            CurrentResponse.TotalTax = GetDecimalProperty(rowset, "TaxTotal");
            CurrentResponse.Currency = GetStringProperty(rowset, "Currency");

            var totalMessage = string.Format("Total amount: {0} {1}, Total Tax: {2}",
                                             CurrentResponse.TotalAmount.ToString("N2"), CurrentResponse.Currency,
                                             CurrentResponse.TotalTax);

            _log.LogDebug("CalculateQuoteTotal: {0}", totalMessage);

            //TODO: Error check if we didn't find anything but we expected something (i.e. rowset.Read failed but we expected results
            //TODO: Nice to have to add the count(*) of records which could be useful for error checking; adding to query doesn't cost anything
          }
        }
      }
    }

    protected void Cleanup(IEnumerable<ChargeData> charges)
    {
      //If needed, cleanup should be completed here.
      //Happens when quote is finalized, pdf generated and returned
      //or if an error happens during processing

      CleanupSubscriptionsCreated();

      //Cleanup the usage data and an failed transactions
      if (CurrentRequest.DebugDoNotCleanupUsage && !Configuration.CurrentSystemIsProductionSystem)
      {
          //For debugging purposes, leave the usage data
          _log.LogWarning("Not cleaning up usage data for quote run");
      }
      else
      {
         CleanupBackoutUsageData(charges);
      }
    }

    protected void CleanupSubscriptionsCreated()
    {
      // Remove individual subscriptions
      foreach (var subscription in createdSubsciptions)
      {
        try
        {
          var account = CurrentProductCatalog.GetAccount(subscription.AccountID);
          CleanupUDRCMetricValues(subscription.ID);
          account.RemoveSubscription(subscription.ID);
        }
        catch (Exception ex)
        {
          _log.LogException(String.Format("Problem with clean up subscription {0}.", subscription.ID), ex);
        }
      }

      // Remove group subscriptions
      foreach (var subscription in createdGroupSubsciptions)
      {
          try
          {
              // Unsubscribe members
              foreach (var idAccount in CurrentRequest.Accounts)
              {
                  IMTGSubMember gsmember = new MTGSubMemberClass();
                  gsmember.AccountID = idAccount;

                  if (subscription.FindMember(idAccount, CurrentRequest.EffectiveDate) != null)
                  {
                      subscription.UnsubscribeMember((MTGSubMember) gsmember);
                  }
              }

              using (IMTNonServicedConnection conn = ConnectionManager.CreateNonServicedConnection())
              {
                  using (IMTCallableStatement stmt = conn.CreateCallableStatement("RemoveGroupSubscription_Quoting"))
                  {
                      int status = 0;
                      stmt.AddParam("p_id_sub", MTParameterType.Integer, subscription.ID);
                      stmt.AddParam("p_systemdate", MTParameterType.DateTime, CurrentRequest.EffectiveDate);
                      stmt.AddParam("p_status", MTParameterType.Integer, status);
                      stmt.ExecuteNonQuery();
                  }
              }

              CleanupUDRCMetricValues(subscription.ID);
          }
          catch (Exception ex)
          {
              _log.LogException(String.Format("Problem with clean up subscription {0}.", subscription.ID), ex);
          }

      }
    }

    protected void CleanupUDRCMetricValues(int idSubscription)
    {
      using (IMTNonServicedConnection conn = ConnectionManager.CreateNonServicedConnection())
      {
        using (
          IMTAdapterStatement stmt = conn.CreateAdapterStatement(Configuration.QuotingQueryFolder,
                                                                 Configuration.RemoveRCMetricValuesQueryTag))
        {
          stmt.AddParam("%%ID_SUB%%", idSubscription);
          stmt.ExecuteNonQuery();
        }
      }
    }

    protected void CleanupBackoutUsageData(IEnumerable<ChargeData> charges)
    {
        _log.LogInfo("Reversing {0} batch(es) associated with this quote", charges.Count());

      IMTBillingReRun rerun = new BillingReRunClient.Client();
      var sessionContext = AdapterManager.GetSuperUserContext(); // log in as super user
      rerun.Login((Interop.MTBillingReRun.IMTSessionContext) sessionContext);
      var comment = String.Format("Quoting functionality; Reversing work associated with QuoteId {0}",
                                  CurrentResponse.idQuote);
      rerun.Setup(comment);

      var pipeline = new PipelineManager();
      try
      {
        // pauses all pipelines so identify isn't chasing a moving target
        pipeline.PauseAllProcessing();

        // identify all batches (ideally we could do this in one call to Identify)
        // instead of doing individual billing reruns per batch (CR12581)
        foreach (ChargeData charge in charges)
        {
          _log.LogDebug("Backingout batch with id {0} associated with this quote", charge.IdBatch);

          IMTIdentificationFilter filter = rerun.CreateFilter();
          filter.BatchID = charge.IdBatch;

          // filters on the billing group ID if the billing group ID is set on the context
          // NOTE: it won't be set for scheduled or EOP interval-only adapters)

          // filters on the interval ID if the interval ID is set on the context
          // NOTE: it won't be set for scheduled adapters).  This is important for
          // performance when partitioning is enabled.

          filter.IsIdentifySuspendedTransactions = true;
          filter.IsIdentifyPendingTransactions = true;
          filter.SuspendedInterval = 0;

          rerun.Identify(filter, comment);
        }

        rerun.Analyze(comment);
        rerun.BackoutDelete(comment);
        rerun.Abandon(comment);
      }
      finally
      {
        // always resume processing no matter what!
        pipeline.ResumeAllProcessing();
      }

      _log.LogDebug("Completed backing out batches associated with this quote");

    }

    #endregion

    #region ProductCatalogHelpers

    private IMTProductCatalog mProductCatalog;

    protected IMTProductCatalog CurrentProductCatalog
    {
      get
      {
        //TODO: Cache this and return pre-initialized one
        Interop.MTProductCatalog.IMTSessionContext sessionContext = GetSessionContextForProductCatalog();

        mProductCatalog = new MTProductCatalogClass();
        mProductCatalog.SetSessionContext(sessionContext);

        return mProductCatalog;
      }
    }

    protected Interop.MTProductCatalog.IMTSessionContext GetSessionContextForProductCatalog()
    {
      //Todo: Fix to read from server access file if we decide to use SuperUser as opposed to user generating quote
      Auth.IMTLoginContext loginContext = new Auth.MTLoginContextClass();
      //ServerAccess.IMTServerAccessDataSet sa = new MetraTech.Interop.MTServerAccess.MTServerAccessDataSet();
      //sa.Initialize();
      //ServerAccess.IMTServerAccessData accessData = sa.FindAndReturnObject("SuperUser");
      const string suName = "su";
      const string suPassword = "su123";
      try
      {
        return (Interop.MTProductCatalog.IMTSessionContext) loginContext.Login(suName, "system_user", suPassword);
      }
      catch (Exception ex)
      {
        throw new Exception("GetSessionContextForProductCatalog: Login failed:" + ex.Message, ex);
      }

    }

    #endregion
    
    public Auth.IMTSessionContext SessionContext { get; private set; }
  }
}