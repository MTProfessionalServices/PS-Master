using System;
using System.Collections.Generic;
using System.Text;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
using System.ServiceModel.Channels;

using MetraTech.ActivityServices.Common;
using MetraTech.DomainModel.Enums.PaymentSvrClient.Metratech_com_paymentserver;
using MetraTech.DomainModel.MetraPay;
using MetraTech.DataAccess;
using MetraTech.DomainModel.Enums;

using MetraTech.Security.Crypto;
using System.Transactions;
using MetraTech.Interop.MTEnumConfig;
using MetraTech.MetraPay.PaymentGateway;
using System.Runtime.InteropServices;
using MetraTech.Interop.RCD;
using System.IO;
using System.Reflection;
using System.Linq;
using System.Linq.Expressions;
using MetraTech.Interop.QueryAdapter;

namespace MetraTech.MetraPay
{
  [ServiceContract]
  public interface IPaymentInstrumentMgmtSvc
  {
    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void AddPaymentMethod(MetraPaymentMethod paymentMethod, string currency, out Guid token);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void UpdatePaymentMethod(Guid token, MetraPaymentMethod paymentMethod, string currency);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void DeletePaymentMethod(Guid token);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void AddCreditCardAndPreAuth(CreditCardPaymentMethod ccPaymentInstrument, ref MetraPaymentInfo paymentInfo, out Guid instrumentToken, out Guid authToken, string arRequestId);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void UpdatePaymentMethodNoCheck(Guid token, MetraPaymentMethod paymentMethod);

  }

  [ServiceContract]
  public interface ITransactionProcessingService
  {
    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitDebit(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitOneTimeDebit(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitPreAuth(Guid token, ref MetraPaymentInfo paymentInfo, out Guid authToken, string arRequestId, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitCapture(Guid authorizationToken, ref MetraPaymentInfo actualPaymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitVoid(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitCredit(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void SubmitOneTimeCredit(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo, double timeout, string cos);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void ValidatePaymentMethod(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void GetACHTransactionStatus(string transactionId, out bool bProcessed);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    [TransactionFlow(TransactionFlowOption.Allowed)]
    void DownloadACHTransactionsReport(string url);

    [OperationContract]
    [FaultContract(typeof(MASBasicFaultDetail))]
    [FaultContract(typeof(PaymentProcessorFaultDetail))]
    void SubmitAuthReversal(Guid authToken, ref MetraPaymentInfo paymentInfo, double timeout, string cos);
  }

  [ServiceContract]
  public interface IBatchUpdateServiceCallback
  {
    [OperationContract(IsOneWay = true)]
    void CreditCardsUpdated(string transactionId, List<CreditCardPaymentMethod> updatedCards);
  }

  [ServiceContract(CallbackContract = typeof(IBatchUpdateServiceCallback))]
  public interface IBatchUpdateService
  {
    [OperationContract(IsOneWay = true)]
    void UpdateCreditCards(string transactionId, List<Guid> cardsToUpdate);
  }

 
  [ComVisible(false)]
  class PaymentInstrumentMgmtSvc : 
    IServiceBehavior, IErrorHandler, IPaymentInstrumentMgmtSvc, ITransactionProcessingService, IBatchUpdateService
  {
    Logger m_Logger = new Logger("[PaymentInstrumentMgmtSvc]");
    IPaymentGateway m_Gateway;
    double m_DefaultTimeout;

    public PaymentInstrumentMgmtSvc()
    {
      if (OperationContext.Current != null)
      {
        OperationContext oc = OperationContext.Current;
        InstanceContext ic = oc.InstanceContext;
        MPServiceHost<PaymentInstrumentMgmtSvc> host = ic.Host as MPServiceHost<PaymentInstrumentMgmtSvc>;

        m_Gateway = Activator.CreateInstance(Type.GetType(host.ProcessorType)) as IPaymentGateway;
        m_DefaultTimeout = host.Timeout;

        IMTRcd rcd = new MTRcdClass();
        string fullPath = Path.Combine(rcd.ExtensionDir, host.ConfigFile);
        m_Gateway.Init(fullPath);

        m_Logger = new Logger(string.Format("[PaymentInstrumentMgmtSvc_{0}]", host.ServiceName));
      }
    }

    #region IPaymentInstrumentMgmtSvc Members

      /// <summary>
      /// Adds payment instrument, e.g. Credit Card or ACH Payment
      /// </summary>
      /// <param name="paymentInstrument">Contains payment instrument properties to add</param>
      /// <param name="accID">Account Identifier that identifies the user to whose account the payment instrument is being added to</param>
      /// <param name="currency">The currency for this CC</param>
      /// <param name="paymentInstrumentId">Returns the payment instrument id of the newly added record</param>
      [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void AddPaymentMethod(MetraPaymentMethod paymentInstrument, string currency, out Guid paymentInstrumentId)
    {
      paymentInstrumentId = Guid.NewGuid();
      bool bValidated = false;

      //validate credit card through payment gateway
      try
      {
        bValidated = m_Gateway.ValidatePaymentMethod(paymentInstrument, currency);

        if (bValidated)
        {
          m_Logger.LogInfo("Validated payment method " + paymentInstrument.AccountNumber);
        }
      }
      catch (PaymentProcessorException ppe)
      {
        m_Logger.LogException("Error from payment processor validating payment method " + paymentInstrument.AccountNumber, ppe);
        throw ppe;
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error validating payment method " + paymentInstrument.AccountNumber, e);
        throw new MASBasicException("Payment method information is invalid");
      }

      //check if valid credit  card
      if (!bValidated)
      {
        throw new MASBasicException("Payment method information is invalid");
      }

      //persist credit card information
      try
      {
        if (paymentInstrument.GetType() == typeof(CreditCardPaymentMethod) ||
            paymentInstrument.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
        {
          AddCreditCard((CreditCardPaymentMethod)paymentInstrument, paymentInstrumentId);
          StorePaymentInstrument(paymentInstrumentId, (CreditCardPaymentMethod)paymentInstrument);
        }
        else
        {
          AddACHDetails((ACHPaymentMethod)paymentInstrument, paymentInstrumentId);
          StorePaymentInstrument(paymentInstrumentId, (ACHPaymentMethod)paymentInstrument);
        }
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error saving payment method information;piid=" + paymentInstrumentId.ToString()
          + ";last 4 digits=" + paymentInstrument.AccountNumber, e);
        throw new MASBasicException("Unable to save payment method information");
      }

      if (paymentInstrument.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentInstrument.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
        WriteToPaymentAudit(paymentInstrument, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Add));
      else
        WriteToPaymentAudit(paymentInstrument, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.ACH_Account_Add));
    }

    /// <summary>
    /// Updates Payment Instrument information
    /// </summary>
    /// <param name="paymentInstrumentId"></param>
    /// <param name="paymentInstrument"></param>
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void UpdatePaymentMethod(Guid paymentInstrumentId, MetraPaymentMethod paymentInstrument, string currency)
    {
      MetraPaymentMethod pm;

      //attempt to verify owner
      try
      {
        pm = GetPaymentInstrument(paymentInstrumentId);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error updating payment method;piid=" + paymentInstrumentId.ToString()
          + "last 4 digits=" + paymentInstrument.AccountNumber, e);
        throw new MASBasicException("Unable to update payment method");
      }

      //failed to verify owner
      if (pm == null)
      {
        string sMsg = "Invalid owner for credit card " + paymentInstrumentId.ToString();
        m_Logger.LogError(sMsg);
        throw new MASBasicException("Unable to update payment method");
      }

      MetraPaymentMethod updatedMethod = null;
      try
      {
        //pm.ApplyDirtyProperties(paymentInstrument);

        updatedMethod = CloneAndApplyProperties(paymentInstrument, pm);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Unable to load credit card info for piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to save credit card information");
      }

      //validate
      bool bIsValidAccountNumber = false;
      try
      {
        bIsValidAccountNumber = m_Gateway.ValidatePaymentMethod(updatedMethod, currency);
      }
      catch (PaymentProcessorException ppe)
      {
        m_Logger.LogException("Error from payment processor validating credit card for piid=" + paymentInstrumentId.ToString(), ppe);
        throw ppe;
      }
      catch (Exception e)
      {
        m_Logger.LogException("Unable to validate credit card info for piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to validate credit card information");
      }

      //check if valid account number
      if (!bIsValidAccountNumber)
      {
        throw new MASBasicException("Credit card information is invalid");
      }

      //save
      try
      {
        UpdatePaymentInstrument(updatedMethod, paymentInstrumentId);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Unable to save credit card info for piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to save credit card information");
      }

      WriteToPaymentAudit(paymentInstrument, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Update));
    }

    /// <summary>
    /// Updates payment Instrument Information without account number validation.
    /// </summary>
    /// <param name="paymentInstrumentId"></param>
    /// <param name="paymentInstrument"></param>
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void UpdatePaymentMethodNoCheck(Guid paymentInstrumentId, MetraPaymentMethod paymentInstrument)
    {
      MetraPaymentMethod pm;

      //attempt to verify owner
      try
      {
        pm = GetPaymentInstrument(paymentInstrumentId);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error updating payment method;piid=" + paymentInstrumentId.ToString()
          + "last 4 digits=" + paymentInstrument.AccountNumber, e);
        throw new MASBasicException("Unable to update payment method");
      }

      //failed to verify owner
      if (pm == null)
      {
        string sMsg = "Invalid owner for credit card " + paymentInstrumentId.ToString();
        m_Logger.LogError(sMsg);
        throw new MASBasicException("Unable to update payment method");
      }

      MetraPaymentMethod updatedMethod = null;
      try
      {
        //pm.ApplyDirtyProperties(paymentInstrument);

        updatedMethod = CloneAndApplyProperties(paymentInstrument, pm);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Unable to load credit card info for piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to save credit card information");
      }


      //save
      try
      {
        UpdatePaymentInstrument(updatedMethod, paymentInstrumentId);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Unable to save credit card info for piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to save credit card information");
      }

      WriteToPaymentAudit(paymentInstrument, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Update));
    }

    /// <summary>
    /// Deletes a payment instrument by Payment Instrument ID
    /// </summary>
    /// <param name="paymentInstrumentId">Identifies instrument to delete</param>
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void DeletePaymentMethod(Guid paymentInstrumentId)
    {
      MetraPaymentMethod pm;

      //attempt to verify owner
      try
      {
        pm = GetPaymentInstrument(paymentInstrumentId);
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error deleting payment method; piid=" + paymentInstrumentId.ToString(), e);
        throw new MASBasicException("Unable to delete credit card");
      }

      //failed to verify owner
      if (pm == null)
      {
        string sMsg = "Invalid payment instrument " + paymentInstrumentId.ToString();
        m_Logger.LogError(sMsg);
        throw new MASBasicException("Unable to delete payment instrument");
      }

      if (pm.GetType() == typeof(CreditCardPaymentMethod) ||
          pm.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        try
        {
          DeleteCreditCardByPaymentInstrumentID(paymentInstrumentId);
        }
        catch (Exception e)
        {
          m_Logger.LogException("Error deleting payment method; piid=" + paymentInstrumentId.ToString(), e);
          throw new MASBasicException("Unable to delete credit card");
        }

        WriteToPaymentAudit(pm, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Delete));
      }
      else
      {
        try
        {
          DeleteACHByPaymentInstrumentID(paymentInstrumentId);
        }
        catch (Exception e)
        {
          m_Logger.LogException("Error deleting payment method; piid=" + paymentInstrumentId.ToString(), e);
          throw new MASBasicException("Unable to delete ach");
        }

        WriteToPaymentAudit(pm, null, EnumHelper.GetDbValueByEnum(PaymentRequestType.ACH_Account_Delete));
      }
    }

    /// <summary>
    /// Makes Preauth and Adds Credit card.
    /// </summary>
    /// <param name="ccPaymentInstrument"></param>
    /// <param name="paymentInfo"></param>
    /// <param name="instrumentToken"></param>
    /// <param name="authToken"></param>
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void AddCreditCardAndPreAuth(CreditCardPaymentMethod ccPaymentInstrument, ref MetraPaymentInfo paymentInfo, out Guid instrumentToken, out Guid authToken, string arRequestId)
    {
      instrumentToken = Guid.NewGuid();
      authToken = Guid.NewGuid();

      string requestParams;
      string result;


      try
      {
        m_Gateway.AuthorizeCharge(ccPaymentInstrument, ref paymentInfo, out requestParams, out result);
        m_Logger.LogDebug(String.Format("Preauth request successful.  Recording Transaction Information for Request: {0}", result));
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error deleting payment method; piid=" + instrumentToken.ToString(), e);
        throw new MASBasicException("Unable to make preauth request"); ;
      }

      try
      {
        AddCreditCard(ccPaymentInstrument, instrumentToken);
        StorePaymentInstrument(instrumentToken, ccPaymentInstrument);
        WriteToPaymentAudit(ccPaymentInstrument, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Add));
        m_Logger.LogDebug(String.Format("Credit card Added Successfully : {0}", instrumentToken));
      }
      catch (Exception e)
      {
        m_Logger.LogException(string.Format("Unable to add credit card, instrument token : {0}", instrumentToken), e);
        throw new MASBasicException("Unable to add credit card."); ;
      }

      try
      {
        StorePreAuthRequest(authToken, instrumentToken, paymentInfo, requestParams, arRequestId);
        WriteToPaymentAudit(ccPaymentInstrument, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_PreAuth));
        m_Logger.LogDebug(string.Format("Stored preauth request for instrument token : {0}, auth token {1}", instrumentToken, authToken));
      }
      catch (Exception e)
      {
        m_Logger.LogException(string.Format("Unable to store preauth request, instrument token : {0}, aut token {1}", instrumentToken, authToken), e);
        throw new MASBasicException("Unable to store preauth request."); ;
      }

    }

    #endregion

    #region ITransactionProcessingService Members
    /// <summary>
    /// The SubmitDebit method is used to submit a payment to the payment processor gateway.  It resolves the payment instrument
    /// using the token provided and payment info
    /// </summary>
    /// <param name="token"></param>
    /// <param name="paymentInfo"></param>
    //[OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitDebit(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);

      // need set this based on PaymentMethodType
      MetraPaymentMethod paymentMethod = GetPaymentInstrument(token);
      MetraPaymentMethod processPaymentMethod = null;
      PaymentType paymentMethodType = paymentMethod.PaymentMethodType;

      if (paymentMethodType == PaymentType.Credit_Card)
      {
        processPaymentMethod = GetCCPaymentMethod(token, paymentMethod);
      }
      else if (paymentMethodType == PaymentType.ACH)
      {
        processPaymentMethod = GetACHPaymentMethod(token, paymentMethod);
      }
      else
      {
        throw new MASBasicException("Only Credit Cards and ACH are currently supported");
      }

      m_Logger.LogDebug("About to submit debit to payment processor");
      SubmitOneTimeDebit(processPaymentMethod, ref paymentInfo, timeout, cos);
      if (endTime < DateTime.Now)
      {
        UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
        throw new TimeoutException();
      }
      m_Logger.LogDebug("Successfully submitted debit to payment processor.");
    }

    /// <summary>
    /// SubmitDebit actually submits the payment processor
    /// </summary>
    /// <param name="paymentMethod"></param>
    /// <param name="paymentInfo"></param>    
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitOneTimeDebit(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      m_Logger.LogDebug("Submitting Debit Request.");
      if (DoesTransactionExist(paymentInfo))
      {
        return;
      }

      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);

      string result;
      // Submit Credit Card to Cybersource
      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        CreditCardPaymentMethod process = (CreditCardPaymentMethod)paymentMethod;
        try
        {
          WriteToPaymentAudit(process, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Debit));
          m_Gateway.Debit(process, ref paymentInfo, out result, timeout, cos);
          if (endTime < DateTime.Now)
          {
            UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
            throw new TimeoutException();
          }
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.SUCCESS);
          m_Logger.LogDebug(String.Format("Credit Card Debit request successful.  Recording Transaction Information for Request: {0}", result));

        }
        catch (TimeoutException e)
        {
          var resourceManager = new ResourcesManager();
          m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw e;
        }
        catch (PaymentProcessorException ppe)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REJECTED, ppe.Message);
          m_Logger.LogException("Error from payment processor debiting credit card.", ppe);
          throw ppe;
        }
        catch (Exception e)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          m_Logger.LogException("Credit Card Debit request failed.", e);
          throw new MASBasicException(String.Format("Credit Card Debit request failed. {0}", e.ToString()));
        }
      }
      else
      {
        ACHPaymentMethod process = (ACHPaymentMethod)paymentMethod;
        try
        {
          WriteToPaymentAudit(process, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.ACH_Debit));
          m_Gateway.Debit(process, ref paymentInfo, out result, timeout);
          if (endTime < DateTime.Now)
          {
            UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
            throw new TimeoutException();
          }
          m_Logger.LogDebug(String.Format("ACH Debit request successful.  Recording Transaction Information for Request: {0}", result));
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.SUCCESS);
        }
        catch (TimeoutException e)
        {
          var resourceManager = new ResourcesManager();
          m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw;
        }
        catch (PaymentProcessorException ppe)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REJECTED, ppe.Message);
          m_Logger.LogException("ACH Debit request failed.", ppe);
          throw ppe;
        }
        catch (Exception e)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          m_Logger.LogException("ACH Debit request failed.", e);
          throw new MASBasicException(String.Format("ACH Debit request failed. {0}", e.ToString()));
        }
      }
    }
    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitVoid(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }

      //Check that this transaction is in FAILURE mode.  We know that DoesTransactionExist() throws an exception if the transaction
      // failed, so use that.
      try
      {
        DoesTransactionExist(paymentInfo);
        //If we didn't get an exception, the transaction is not in FAILURE state.
        throw new MASBasicException(ErrorCodes.TRANSACTION_NOT_FAILED);
      }
      catch (MASBasicException e)
      {
        if (e.ErrorCode == ErrorCodes.TRANSACTION_ALREADY_FAILED)
        {
          //Do nothing; this is actually good/
        }
        else
        {
          throw new MASBasicException(ErrorCodes.TRANSACTION_NOT_FAILED);
        }
      }

      MetraPaymentMethod paymentMethod = GetPaymentInstrument(token);
      string warnings;
      try
      {
        m_Gateway.Void(paymentMethod, ref paymentInfo, out warnings, timeout, cos);
        UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REVERSED);
      }
      catch (MASBasicException e)
      {
        if (e.ErrorCode == ErrorCodes.TRANSACTION_ALREADY_SETTLED)
        {
          //Don't log this, let EPS handle it
          throw;
        }
        else
        {
          m_Logger.LogError(String.Format("Void failed.  An error occurred: {0}", e.ToString()));
          throw;
        }
      }
      catch (Exception e)
      {
        m_Logger.LogError(String.Format("Void failed.  An error occurred: {0}", e.ToString()));
        throw new MASBasicException(String.Format("Credit card preauth failed: {0}", e.ToString()));
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitPreAuth(Guid token, ref MetraPaymentInfo paymentInfo, out Guid authToken, string arRequestId, double timeout, string cos)
    {
      authToken = paymentInfo.TransactionSessionId;
      if (DoesTransactionExist(paymentInfo))
      {
        return;
      }

      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);


      m_Logger.LogDebug("Begin Pre Authorization request processing");

      MetraPaymentMethod paymentMethod = GetPaymentInstrument(token);
      string result;
      string requestParms;



      // Submit Credit Card to Cybersource
      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        CreditCardPaymentMethod ccMethod = (CreditCardPaymentMethod)paymentMethod;
        try
        {
          WriteToPaymentAudit(paymentMethod, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_PreAuth));
          m_Gateway.AuthorizeCharge(ccMethod, ref paymentInfo, out requestParms, out result, timeout, cos);
          if (endTime < DateTime.Now)
          {
            UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
            throw new TimeoutException();
          }
          m_Logger.LogDebug(String.Format("Preauth request successful.  Recording Transaction Information for Request: {0}", result));
          StorePreAuthRequest(authToken, paymentMethod.PaymentInstrumentID, paymentInfo, requestParms, arRequestId);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.SUCCESS);
        }
        catch (TimeoutException e)
        {
          var resourceManager = new ResourcesManager();
          m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw;
        }
  
        catch (PaymentProcessorException ppe)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REJECTED, ppe.Message);
          m_Logger.LogException("Error from payment processor authorizing charge.", ppe);
          throw ppe;
        }
        catch (Exception e)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          m_Logger.LogError(String.Format("Credit card preauth failed.  An error occurred: {0}", e.ToString()));
          throw new MASBasicException(String.Format("Credit card preauth failed: {0}", e.ToString()));
        }
      }
      else
      {
        throw new MASBasicException("PreAuth currently only supported for Credit Cards.");
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitCapture(Guid authorizationToken, ref MetraPaymentInfo actualPaymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);

      m_Logger.LogDebug("Begin Capture request processing");

      string result, requestPrams, arRequestId;

      Guid paymentInstrumentId = LoadPreauthRecord(authorizationToken, actualPaymentInfo, out requestPrams, out arRequestId);

      MetraPaymentMethod paymentMethod = GetPaymentInstrument(paymentInstrumentId);
      CreditCardPaymentMethod cc = (CreditCardPaymentMethod)paymentMethod;

      try
      {
        WriteToPaymentAudit(paymentMethod, actualPaymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Capture));
        m_Gateway.CaptureCharge(cc, ref actualPaymentInfo, requestPrams, out result, timeout, cos);
        DeletePreAuthRecord(authorizationToken);
        if (endTime < DateTime.Now)
        {
          UpdateTransactionStatus(actualPaymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw new TimeoutException();
        }
        UpdateTransactionStatus(actualPaymentInfo.TransactionSessionId, TransactionState.SUCCESS);
        m_Logger.LogDebug(String.Format("Credit Card Capture request success.  Recording Transaction Information for Request: {0}", result));
      }
      catch (TimeoutException e)
      {
        var resourceManager = new ResourcesManager();
        m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
        UpdateTransactionStatus(actualPaymentInfo.TransactionSessionId, TransactionState.FAILURE);
        throw;
      }
  
      catch (PaymentProcessorException ppe)
      {
        m_Logger.LogException("Error from payment processor capturing charge.", ppe);
        throw ppe;
      }
      catch (Exception e)
      {
        m_Logger.LogError(String.Format("An error occurred: {0}", e.ToString()));
        throw new MASBasicException(String.Format("Credit card capture failed: {0}", e.ToString()));
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitCredit(Guid token, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);

      // need set this based on PaymentMethodType
      MetraPaymentMethod paymentMethod = GetPaymentInstrument(token);
      MetraPaymentMethod processPaymentMethod = null;
      PaymentType paymentMethodType = paymentMethod.PaymentMethodType;

      m_Logger.LogDebug("About to submit credit to payment processor");
      if (paymentMethodType == PaymentType.Credit_Card)
      {
        processPaymentMethod = GetCCPaymentMethod(token, paymentMethod);
      }
      else if (paymentMethodType == PaymentType.ACH)
      {
        processPaymentMethod = GetACHPaymentMethod(token, paymentMethod);
      }
      else
      {
        throw new MASBasicException("Only Credit Cards and ACH are currently supported");
      }

      SubmitOneTimeCredit(processPaymentMethod, ref paymentInfo, timeout, cos);
      if (endTime < DateTime.Now)
      {
        UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
        throw new TimeoutException();
      }
      m_Logger.LogDebug("Successfully submitted credit to payment processor.");
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitOneTimeCredit(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);

      m_Logger.LogDebug("Credit being submitted to payment processor");

      string result;

      // Submit Credit Card to Cybersource
      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        CreditCardPaymentMethod process = (CreditCardPaymentMethod)paymentMethod;
        try
        {
          WriteToPaymentAudit(process, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Credit));
          m_Gateway.Credit(process, ref paymentInfo, out result, timeout, cos);
          if (endTime < DateTime.Now)
          {
            UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
            throw new TimeoutException();
          }
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.SUCCESS);
          m_Logger.LogDebug(String.Format("Credit Card Credit Processing successful.  Recording Transaction Information for Request: {0}", result));
        }
        catch (TimeoutException e)
        {
          var resourceManager = new ResourcesManager();
          m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw;
        }
  
        catch (PaymentProcessorException ppe)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REJECTED, ppe.Message);
          m_Logger.LogException("Error from payment processor crediting credit card.", ppe);
          throw ppe;
        }
        catch (Exception e)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          m_Logger.LogError(String.Format("Credit Card Credit Processing failed.  An error occurred: {0}", e.ToString()));
          throw new MASBasicException(String.Format("Credit Card Credit Processing failed.  An error occurred: {0}", e.ToString()));
        }
      }
      else
      {
        ACHPaymentMethod process = (ACHPaymentMethod)paymentMethod;
        try
        {
          WriteToPaymentAudit(process, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.ACH_Credit));
          m_Gateway.Credit(process, ref paymentInfo, out result);
          if (endTime < DateTime.Now)
          {
            UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
            throw new TimeoutException();
          }
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.SUCCESS);
          m_Logger.LogDebug(String.Format("ACH Credit Processing successful.  Recording Transaction Information for Request: {0}", result));
        }
        catch (TimeoutException e)
        {
          var resourceManager = new ResourcesManager();
          m_Logger.LogException(resourceManager.GetLocalizedResource("TIMEOUT_EXCEPTION"), e);
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          throw;
        }
  
        catch (PaymentProcessorException ppe)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.REJECTED, ppe.Message);
          m_Logger.LogException("Error from payment processor crediting ach.", ppe);
          throw ppe;
        }
        catch (Exception e)
        {
          UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
          m_Logger.LogError(String.Format("ACH Credit Processing failed.  An error occurred: {0}", e.ToString()));
          throw new MASBasicException(String.Format("ACH Credit Processing failed.  An error occurred: {0}", e.ToString()));
        }
      }

    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void ValidatePaymentMethod(MetraPaymentMethod paymentMethod, ref MetraPaymentInfo paymentInfo)
    {
      if (!m_Gateway.ValidatePaymentMethod(paymentMethod, paymentInfo.Currency))
      {
        m_Logger.LogError(String.Format("Invalid Payment Instrument id: {0} has been provided", paymentMethod.PaymentInstrumentID.ToString()));
        throw new MASBasicException("Invalid Payment Intrument id.");
      }

      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        m_Logger.LogDebug("Credit Card Validation successful.");
        WriteToPaymentAudit(paymentMethod, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Update));
      }
      else
      {
        m_Logger.LogDebug("ACH Validation successful.");
        WriteToPaymentAudit(paymentMethod, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.ACH_Account_Update));
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void GetACHTransactionStatus(string transactionId, out bool bProcessed)
    {
      bProcessed = false;
      string warnings = "";
      try
      {
        bProcessed = m_Gateway.GetACHTransactionStatus(transactionId, out warnings);

        if (bProcessed)
        {
          m_Logger.LogInfo("Transaction: {0} has been processed.", transactionId);
        }
      }
      catch (PaymentProcessorException ppe)
      {
        m_Logger.LogException("Error validating transaction status.", ppe);
        throw ppe;
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error validating transaction status.", e);
        throw new MASBasicException("Error validating transaction status.");
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void DownloadACHTransactionsReport(string url)
    {
      string warnings = "";
      try
      {
        m_Gateway.DownloadACHTransactionsReport(url, out warnings);
      }
      catch (PaymentProcessorException ppe)
      {
        m_Logger.LogException("Error downloading Transaction report.", ppe);
        throw ppe;
      }
      catch (Exception e)
      {
        m_Logger.LogException("Error downloading Transaction report.", e);
        throw new MASBasicException("Error downloading Transaction report.");
      }
    }

    [OperationBehavior(TransactionAutoComplete = true, TransactionScopeRequired = true)]
    public void SubmitAuthReversal(Guid authToken, ref MetraPaymentInfo paymentInfo, double timeout, string cos)
    {
      if (timeout == 0)
      {
        timeout = m_DefaultTimeout;
      }
      DateTime endTime = DateTime.Now.AddMilliseconds(timeout);
      try
      {
        string requestPrams, warnings, arRequestId = string.Empty;
        Guid paymentInstrumentId = LoadPreauthRecord(authToken, paymentInfo, out requestPrams, out arRequestId);

        MetraPaymentMethod paymentMethod = GetPaymentInstrument(paymentInstrumentId);
        m_Gateway.ReverseAuthorizedCharge((CreditCardPaymentMethod)paymentMethod, ref paymentInfo, requestPrams, out warnings, timeout, cos);

        DeletePreAuthRecord(authToken);

        WriteToPaymentAudit(paymentMethod, paymentInfo, EnumHelper.GetDbValueByEnum(PaymentRequestType.Credit_Card_Auth_Reversal));

      }
      catch (Exception e)
      {
        UpdateTransactionStatus(paymentInfo.TransactionSessionId, TransactionState.FAILURE);
        m_Logger.LogError(string.Format("Error while Auth Reversal Submit, Auth Token {0}", authToken), e);
        throw new MASBasicException("Error while auth reversal submit");
      }
    }

    #endregion

    #region IErrorHandler Members

    public bool HandleError(Exception error)
    {
      return false;
    }

    public void ProvideFault(Exception error, System.ServiceModel.Channels.MessageVersion version, ref System.ServiceModel.Channels.Message fault)
    {
      if (error is TimeoutException)
      {
        MASBasicException timeoutError = new MASBasicException(ErrorCodes.TRANSACTION_TIMED_OUT);
        FaultException fe = ((MASBaseException)timeoutError).CreateFaultDetail();
        MessageFault messageFault = fe.CreateMessageFault();
        fault = Message.CreateMessage(version, messageFault, fe.Action);
      }
      else
      if (error is MASBaseException)
      {
        FaultException fe = ((MASBaseException)error).CreateFaultDetail();
        MessageFault messageFault = fe.CreateMessageFault();
        fault = Message.CreateMessage(version, messageFault, fe.Action);
      }
      else
      {
        m_Logger.LogException("Unhandled exception in ActivityServices service", error);

        MASBasicFaultDetail faultDetail = new MASBasicFaultDetail("An unexpected error occurred in MetraNet Activity Services.");

        FaultException<MASBasicFaultDetail> fe = new FaultException<MASBasicFaultDetail>(faultDetail, "Unhandled Exception in MetraNet Activity Services");
        MessageFault messageFault = fe.CreateMessageFault();
        fault = Message.CreateMessage(version, messageFault, fe.Action);
      }
    }

    #endregion

    #region IServiceBehavior Members

    public void AddBindingParameters(ServiceDescription serviceDescription, ServiceHostBase serviceHostBase, System.Collections.ObjectModel.Collection<ServiceEndpoint> endpoints, BindingParameterCollection bindingParameters)
    {
    }

    public void ApplyDispatchBehavior(ServiceDescription serviceDescription, ServiceHostBase serviceHostBase)
    {
      foreach (ChannelDispatcher disp in serviceHostBase.ChannelDispatchers)
      {
        disp.ErrorHandlers.Add(this);
      }
    }

    public void Validate(ServiceDescription serviceDescription, ServiceHostBase serviceHostBase)
    {
    }

    #endregion

    #region IBatchUpdateService Members

    public void UpdateCreditCards(string transactionId, List<Guid> cardsToUpdate)
    {
      List<CreditCardPaymentMethod> updatedCards = new List<CreditCardPaymentMethod>();

      try
      {
        m_Logger.LogInfo("Updating credit cards for transaction {0}.  {1} cards to be updated", transactionId, cardsToUpdate.Count);

        if (cardsToUpdate.Count > 0)
        {
          List<CreditCardPaymentMethod> creditCards = new List<CreditCardPaymentMethod>();

          foreach (Guid token in cardsToUpdate)
          {
            try
            {
              MetraPaymentMethod method = GetPaymentInstrument(token);
              CreditCardPaymentMethod creditCard = method as CreditCardPaymentMethod;

              if (creditCard != null)
              {
                creditCards.Add(creditCard);
              }
            }
            catch (Exception e)
            {
              m_Logger.LogException(string.Format("Error loading credit card for {0}, skipping", token), e);
            }
          }

          m_Logger.LogDebug("Loaded {1} credit cards for transaction {0}.", transactionId, creditCards.Count);
          m_Gateway.GetCreditCardUpdates(transactionId, creditCards, ref updatedCards);

          m_Logger.LogInfo("Cards updated");

        }
      }
      catch (Exception e)
      {
        m_Logger.LogException(string.Format("Exception of type {0} caught in UpdateCreditCards", e.GetType().Name), e);
      }
      finally
      {
        m_Logger.LogInfo("{0} cards need to be sent back to EPS for persistence", updatedCards.Count);
        IBatchUpdateServiceCallback callback = OperationContext.Current.GetCallbackChannel<IBatchUpdateServiceCallback>();
        callback.CreditCardsUpdated(transactionId, updatedCards);
      }
    }

    #endregion

    #region private members
    /*
    private void LogTransaction()
    {
        TxnLogger txLog = new TxnLogger();
*/



    private Guid LoadPreauthRecord(Guid authToken, MetraPaymentInfo paymentInfo, out string requestPrams, out string arRequestId)
    {
      try
      {

        string piId = string.Empty;
        requestPrams = string.Empty;
        arRequestId = string.Empty;

        using (IMTConnection conn = ConnectionManager.CreateConnection())
        {
          using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__LOAD_PREAUTH_RECORD__"))
          {

            // This only handles the credit card case
            stmt.AddParam("%%AUTH_TOKEN%%", authToken.ToString());

            using (IMTDataReader dataReader = stmt.ExecuteReader())
            {
              // Read the payment security token details
              if (dataReader.Read())
              {
                piId = dataReader.GetString("id_pymt_instrument");
                requestPrams = dataReader.GetString("n_request_params");
                arRequestId = dataReader.GetString("nm_ar_request_id");
              }
              else
              {
                m_Logger.LogError(string.Format("Preauth Record not found. AuthToken : {0}", authToken));
                throw new MASBasicException(string.Format("Preauth Record not found. AuthToken : {0}", authToken));
              }
            }
          }
        }

        return new Guid(piId);
      }
      catch (MASBasicException)
      {
        throw;
      }
      catch (Exception ex)
      {
        m_Logger.LogException("Error at LoadPreauthRecord", ex);
        throw new MASBasicException("Error while processing LoadPreauthRecord...");
      }
    }

    private void StorePaymentInstrument(Guid paymentInstrumentId, MetraPaymentMethod paymentMethod)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__STORE_PAYMENT_INSTRUMENT__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentId.ToString());
          stmt.AddParam("%%N_PAYMENT_METHOD_TYPE%%", BlankIfNull(EnumHelper.GetDbValueByEnum(paymentMethod.PaymentMethodType)));
          stmt.AddParam("%%NM_ACCOUNT_NUMBER%%", EncryptString(paymentMethod.RawAccountNumber));
          stmt.AddParam("%%NM_FIRST_NAME%%", paymentMethod.FirstName);
          stmt.AddParam("%%NM_MIDDLE_NAME%%", paymentMethod.MiddleName);
          stmt.AddParam("%%NM_LAST_NAME%%", paymentMethod.LastName);
          stmt.AddParam("%%NM_ADDRESS1%%", BlankIfNull(paymentMethod.Street));
          stmt.AddParam("%%NM_ADDRESS2%%", BlankIfNull(paymentMethod.Street2));
          stmt.AddParam("%%NM_CITY%%", BlankIfNull(paymentMethod.City));
          stmt.AddParam("%%NM_STATE%%", BlankIfNull(paymentMethod.State));
          stmt.AddParam("%%NM_ZIP%%", BlankIfNull(paymentMethod.ZipCode));
          stmt.AddParam("%%NM_COUNTRY%%", EnumHelper.GetDbValueByEnum(paymentMethod.Country));

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    /// <summary>
    /// Deletes a payment instrument by Payment Instrument ID
    /// </summary>
    /// <param name="paymentInstrumentId">Identifies credit card to delete</param>
    private void DeleteCreditCardByPaymentInstrumentID(Guid paymentInstrumentID)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__DELETE_CREDIT_CARD_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentID.ToString());

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private void DeleteACHByPaymentInstrumentID(Guid paymentInstrumentID)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__DELETE_ACH_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentID.ToString());

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }
    /// <summary> 
    /// Persists temporary accountID/LIVE PUID Mapping
    /// </summary>
    /// <param name="accountID"></param>
    /// <param name="PUID"></param>
    private void SaveTempAccountID(int accountID, string PUID)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__INSERT_T_PS_TEMPACCID_PUID_XREF_TABLE__"))
        {

          stmt.AddParam("%%TEMP_ACCOUNT_ID%%", accountID);
          stmt.AddParam("%%PUID%%", PUID);
          stmt.AddParam("%%TIMESTAMP%%", MetraTime.Now);

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private bool AccountHasAnyPaymentMethods(int accountID)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__SELECT_ALL_T_PS_ACCOUNT_TABLE__"))
        {

          stmt.AddParam("%%ACCOUNT_ID%%", accountID);

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {

            //if there are records, return true
            if (dataReader.Read())
            {
              return true;
            }
          }
        }
      }

      return false;
    }

    /// <summary>
    /// Verifies if the accountID in accountIdentifier is the one that created the payment method
    /// associated with the token
    /// </summary>
    /// <param name="token"></param>
    /// <param name="accountIdentifier"></param>
    /// <returns></returns>
    /* private MetraPaymentMethod VerifyPaymentMethodOwner(Guid token)
     {
       MetraPaymentMethod pm;
       using (IMTConnection conn = ConnectionManager.CreateConnection())
       {
         using(IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
               "__GET_PAYMENT_METHOD_TYPE__"))
      {

         stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", token.ToString());

         using (IMTDataReader dataReader = stmt.ExecuteReader())
         {

           //if there are records, then this user is the owner of the record - ok
           if (dataReader.Read())
           {
             PaymentType paymentType = (PaymentType)EnumHelper.GetCSharpEnum(dataReader.GetInt32("n_payment_method_type"));
             if (paymentType == PaymentType.Credit_Card)
             {
               pm = GetCCPaymentMethod(token, paymentMethod);
             }
             else if (paymentType == PaymentType.ACH)
             {
               pm = GetACHPaymentMethod(token, paymentMethod);
             }
             return pm;
           }
         }
       }
      }
       return pm;
     }*/


    private int GetTempAccountID(string PUID)
    {
      int accountID = 0;

      GetTempAccountID(PUID, out accountID);
      return accountID;
    }

    private void GetTempAccountID(string PUID, out int accountID)
    {
      accountID = 0;

      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__SELECT_T_PS_TEMPACCID_PUID_XREF_BY_PUID__"))
        {

          stmt.AddParam("%%PUID%%", PUID);

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {

            //if there are records, then we do have this credit card on file
            if (dataReader.Read())
            {
              accountID = dataReader.GetInt32("temp_acc_id");
            }
          }
        }
      }
    }

    private object BlankIfNull(object input)
    {
      if ((input == null) || (input == DBNull.Value))
      {
        return string.Empty;
      }
      return input;
    }

    /// <summary>
    /// Preserve the credit card information
    /// </summary>
    /// <param name="paymentMethod">Credit card information</param>
    /// <param name="accountID">Account ID of the user who is adding this card to his profile</param>
    /// <param name="paymentInstrumentId">GUID identifying payment instrument id</param>
    private void AddCreditCard(CreditCardPaymentMethod paymentMethod, Guid paymentInstrumentId)
    {
      //tie a credit card to the account
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__INSERT_T_PS_CREDITCARD_TABLE__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", BlankIfNull(paymentInstrumentId.ToString()));
          stmt.AddParam("%%N_CREDIT_CARD_TYPE%%", EnumHelper.GetDbValueByEnum(paymentMethod.CreditCardType));
          stmt.AddParam("%%NM_EXPIRATIONDT%%", BlankIfNull(paymentMethod.ExpirationDate));
          stmt.AddParam("%%NM_EXPIRATIONDT_FORMAT%%", (int)paymentMethod.ExpirationDateFormat);
          stmt.AddParam("%%NM_START_DATE%%", BlankIfNull(paymentMethod.StartDate));
          stmt.AddParam("%%NM_ISSUER_NUMBER%%", BlankIfNull(paymentMethod.IssuerNumber));

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private void AddACHDetails(ACHPaymentMethod paymentMethod, Guid paymentInstrumentId)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__INSERT_T_PS_ACH__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", BlankIfNull(paymentInstrumentId.ToString()));
          stmt.AddParam("%%NM_ROUTING_NUMBER%%", BlankIfNull(paymentMethod.RoutingNumber));
          stmt.AddParam("%%NM_BANK_NAME%%", BlankIfNull(paymentMethod.BankName));
          stmt.AddParam("%%NM_BANK_ADDRESS%%", BlankIfNull(paymentMethod.BankAddress));
          stmt.AddParam("%%NM_BANK_CITY%%", BlankIfNull(paymentMethod.BankCity));
          stmt.AddParam("%%NM_BANK_STATE%%", BlankIfNull(paymentMethod.BankState));
          stmt.AddParam("%%NM_BANK_ZIP%%", BlankIfNull(paymentMethod.BankState));
          stmt.AddParam("%%NM_COUNTRY%%", EnumHelper.GetDbValueByEnum(paymentMethod.Country));
          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private void AssignPaymentInstrumentToAccountInternal(Guid token, AccountIdentifier acct)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__ASSIGN_PAYMENT_INSTRUMENT_TO_ACCOUNT__"))
        {

          stmt.AddParam("%%ACCOUNT_ID%%", acct.AccountID.Value);
          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", token.ToString());

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private void UpdatePaymentInstrument(MetraPaymentMethod paymentMethod, Guid paymentInstrumentId)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt2 = conn.CreateAdapterStatement("PaymentServer",
                "__UPDATE_PS_PAYMENT_INSTRUMENT__"))
        {

          if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
            paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
            stmt2.AddParam("%%N_PAYMENT_METHOD_TYPE%%", BlankIfNull(EnumHelper.GetDbValueByEnum(PaymentType.Credit_Card)));
          else
            stmt2.AddParam("%%N_PAYMENT_METHOD_TYPE%%", BlankIfNull(EnumHelper.GetDbValueByEnum(PaymentType.ACH)));

          stmt2.AddParam("%%NM_ACCOUNT_NUMBER%%", EncryptString(paymentMethod.RawAccountNumber));
          stmt2.AddParam("%%NM_FIRST_NAME%%", paymentMethod.FirstName);
          stmt2.AddParam("%%NM_MIDDLE_NAME%%", paymentMethod.MiddleName);
          stmt2.AddParam("%%NM_LAST_NAME%%", paymentMethod.LastName);
          stmt2.AddParam("%%NM_ADDRESS1%%", BlankIfNull(paymentMethod.Street));
          stmt2.AddParam("%%NM_ADDRESS2%%", BlankIfNull(paymentMethod.Street2));
          stmt2.AddParam("%%NM_CITY%%", BlankIfNull(paymentMethod.City));
          stmt2.AddParam("%%NM_STATE%%", BlankIfNull(paymentMethod.State));
          stmt2.AddParam("%%NM_ZIP%%", BlankIfNull(paymentMethod.ZipCode));
          stmt2.AddParam("%%NM_COUNTRY%%", EnumHelper.GetDbValueByEnum(paymentMethod.Country));
          stmt2.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentId.ToString());

          stmt2.ExecuteNonQuery();
          stmt2.ClearQuery();
        }
      }

      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        UpdateCCInstrument((CreditCardPaymentMethod)paymentMethod, paymentInstrumentId);
      }
      else
      {
        UpdateACHInstrument((ACHPaymentMethod)paymentMethod, paymentInstrumentId);
      }
    }

    private void UpdateCCInstrument(CreditCardPaymentMethod paymentMethod, Guid paymentInstrumentId)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                  "__UPDATE_CREDIT_CARD_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%N_CREDIT_CARD_TYPE%%", EnumHelper.GetDbValueByEnum(paymentMethod.CreditCardType));
          stmt.AddParam("%%EXP_DATE%%", BlankIfNull(paymentMethod.ExpirationDate));
          stmt.AddParam("%%EXP_DATE_FORMAT%%", BlankIfNull((int)paymentMethod.ExpirationDateFormat));
          stmt.AddParam("%%START_DATE%%", BlankIfNull(paymentMethod.StartDate));
          stmt.AddParam("%%ISSUER_NUMBER%%", BlankIfNull(paymentMethod.IssuerNumber));
          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentId.ToString());

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private void UpdateACHInstrument(ACHPaymentMethod paymentMethod, Guid paymentInstrumentId)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                  "__UPDATE_ACH_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%NM_ROUTING_NUMBER%%", BlankIfNull(paymentMethod.RoutingNumber));
          stmt.AddParam("%%NM_BANK_NAME%%", BlankIfNull(paymentMethod.BankName));
          stmt.AddParam("%%NM_BANK_ADDRESS%%", BlankIfNull(paymentMethod.BankAddress));
          stmt.AddParam("%%NM_BANK_CITY%%", BlankIfNull(paymentMethod.BankCity));
          stmt.AddParam("%%NM_BANK_STATE%%", BlankIfNull(paymentMethod.BankState));
          stmt.AddParam("%%NM_BANK_ZIP%%", BlankIfNull(paymentMethod.BankState));
          stmt.AddParam("%%NM_COUNTRY%%", EnumHelper.GetDbValueByEnum(paymentMethod.Country));
          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentId.ToString());

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    public ACHPaymentMethod GetACHPaymentMethod(Guid token, MetraPaymentMethod paymentMethod)
    {
      ACHPaymentMethod achPaymentMethod = (ACHPaymentMethod)paymentMethod;
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__SELECT_ACH_DETAILS_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", token.ToString());

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {
            // Read the ach info details
            while (dataReader.Read())
            {
              //EnumConfig enumCfg = new EnumConfig();
              achPaymentMethod.RoutingNumber = dataReader.GetString("nm_routing_number");
              achPaymentMethod.BankName = dataReader.GetString("nm_bank_name");
              achPaymentMethod.BankState = dataReader.GetString("nm_bank_state");
              achPaymentMethod.BankZipCode = dataReader.GetString("nm_bank_zip");
              achPaymentMethod.BankCountry = (PaymentMethodCountry)EnumHelper.GetCSharpEnum(dataReader.GetInt32("id_country"));
            }
          }
        }
      }
      return achPaymentMethod;
    }

    /// <summary>
    /// Retrieve credit card number and type by payment instrument ID
    /// </summary>
    /// <param name="paymentInstrumentID"></param>
    /// <param name="paymentMethod"></param>
    private void GetCCInfo(Guid paymentInstrumentID, CreditCardPaymentMethod paymentMethod)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__SELECT_CC_NUM_BY_PAYMENT_INSTRUMENT_ID__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", paymentInstrumentID.ToString());

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {

            //if there are records, then we do have this credit card on file
            if (dataReader.Read())
            {
              // TODO: this might not be a good idea storing the decrypted cc number, but folloiwng the old code,!!!!
              paymentMethod.AccountNumber = DecryptString(dataReader.GetString("nm_account_number"));

              EnumConfig enumCfg = new EnumConfig();
              string ccTypeEnumValue = enumCfg.GetEnumeratorByID((int)dataReader.GetInt32("n_credit_card_type"));

              paymentMethod.CreditCardType = (MetraTech.DomainModel.Enums.Core.Metratech_com.CreditCardType)EnumHelper.GetGeneratedEnumByEntry(
                  typeof(MetraTech.DomainModel.Enums.Core.Metratech_com.CreditCardType),
                  ccTypeEnumValue);
            }
          }
        }
      }
    }


    private MetraPaymentMethod GetPaymentInstrument(Guid token)
    {
      MetraPaymentMethod paymentMethod = null;
      PaymentType pt = PaymentType.Credit_Card;
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        m_Logger.LogDebug("Retrieving payment instrument info");
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__LOAD_PAYMENT_METHOD_TYPE__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", token.ToString());

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {
            // Read the payment instrument details
            while (dataReader.Read())
            {
              EnumConfig enumCfg = new EnumConfig();
              string paymentTypeEnumValue = enumCfg.GetEnumeratorByID((int)dataReader.GetInt32("n_payment_method_type"));
              pt = (PaymentType)EnumHelper.GetGeneratedEnumByEntry(typeof(PaymentType), paymentTypeEnumValue);

              if (pt == PaymentType.Credit_Card)
                paymentMethod = new CreditCardPaymentMethod();
              else
                paymentMethod = new ACHPaymentMethod();

              paymentMethod.PaymentInstrumentID = token;
              paymentMethod.AccountNumber = DecryptString(dataReader.GetString("nm_account_number"));
              paymentMethod.FirstName = dataReader.GetString("nm_first_name");
              paymentMethod.MiddleName = dataReader.GetString("nm_middle_name");
              paymentMethod.LastName = dataReader.GetString("nm_last_name");
              paymentMethod.Street = dataReader.GetString("nm_address1");
              paymentMethod.Street2 = dataReader.GetString("nm_address2");
              paymentMethod.City = dataReader.GetString("nm_city");
              paymentMethod.State = dataReader.GetString("nm_state");
              paymentMethod.ZipCode = dataReader.GetString("nm_zip");
              paymentMethod.Country = (PaymentMethodCountry)EnumHelper.GetCSharpEnum(dataReader.GetInt32("id_country"));
            }
          }
        }
      }

      if (pt == PaymentType.Credit_Card)
      {
        CreditCardPaymentMethod ccInfo = (CreditCardPaymentMethod)paymentMethod;
        GetCCPaymentMethod(token, ccInfo);
        return ccInfo;
      }
      else
      {
        ACHPaymentMethod achInfo = (ACHPaymentMethod)paymentMethod;
        GetACHPaymentMethod(token, achInfo);
        return achInfo;
      }

    }

    private void StorePreAuthRequest(Guid authToken, Guid piId, MetraPaymentInfo mpi, string requestParams, string arRequestId)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
              "__INSERT_INTO_T_PS_PREAUTH__"))
        {

          // This only handles the credit card case
          stmt.AddParam("%%ID_PREAUTH_TX_ID%%", authToken.ToString());
          stmt.AddParam("%%ID_PYMT_INTRUMENT%%", piId.ToString());
          stmt.AddParam("%%DT_TRANSACTION%%", BlankIfNull(MetraTime.Now));
          stmt.AddParam("%%NM_DESCRIPTION%%", BlankIfNull(mpi.Description));
          stmt.AddParam("%%N_CURRENCY%%", BlankIfNull(mpi.Currency));
          stmt.AddParam("%%N_AMOUNT%%", BlankIfNull(mpi.Amount));
          stmt.AddParam("%%N_REQUEST_PARAMS%%", requestParams);
          stmt.AddParam("%%NM_AR_REQUEST_ID%%", arRequestId);

          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }

        int i = 1;

        using (MTComSmartPtr<IMTQueryAdapter> queryAdapter = new MTComSmartPtr<IMTQueryAdapter>())
        {
          queryAdapter.Item = new MTQueryAdapter();
          queryAdapter.Item.Init("PaymentServer");
          queryAdapter.Item.SetQueryTag("__INSERT_INTO_T_PS_PREAUTH_DETAILS__");

          using (IMTPreparedStatement stmt = conn.CreatePreparedStatement(queryAdapter.Item.GetRawSQLQuery(true)))
          {
            if (mpi.MetraPaymentInvoices != null && mpi.MetraPaymentInvoices.Count > 0)
            {
              foreach (MetraPaymentInvoice invoice in mpi.MetraPaymentInvoices)
              {
                // This only handles the credit card case
                stmt.AddParam(MTParameterType.Integer, i);
                stmt.AddParam(MTParameterType.String, authToken.ToString());
                stmt.AddParam(MTParameterType.String, BlankIfNull(invoice.InvoiceNum));
                stmt.AddParam(MTParameterType.DateTime, invoice.InvoiceDate);
                stmt.AddParam(MTParameterType.String, BlankIfNull(invoice.PONum));
                stmt.AddParam(MTParameterType.Decimal, invoice.AmountToPay);

                stmt.ExecuteNonQuery();

                stmt.ClearParams();
                i++;
              }
            }
            else
            //if (!string.IsNullOrEmpty(mpi.InvoiceNum) || mpi.IsInvoiceDateDirty || !string.IsNullOrEmpty(mpi.PONum))
            {
              // This only handles the credit card case
              stmt.AddParam(MTParameterType.Integer, i);
              stmt.AddParam(MTParameterType.String, authToken.ToString());
              stmt.AddParam(MTParameterType.String, BlankIfNull(mpi.InvoiceNum));
              stmt.AddParam(MTParameterType.DateTime, mpi.InvoiceDate);
              stmt.AddParam(MTParameterType.String, BlankIfNull(mpi.PONum));
              stmt.AddParam(MTParameterType.Decimal, mpi.Amount);

              stmt.ExecuteNonQuery();

              stmt.ClearParams();
            }
          }
        }
      }

    }

    private void DeletePreAuthRecord(Guid authToken)
    {
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
              "__DELETE_PREAUTH_RECORD__"))
        {

          // This only handles the credit card case
          stmt.AddParam("%%ID_PREAUTH_TX_ID%%", authToken.ToString());


          stmt.ExecuteNonQuery();
          stmt.ClearQuery();
        }
      }
    }

    private string EncryptString(string input)
    {
      CryptoManager cm = new CryptoManager();

      string encryptedString = cm.Encrypt(CryptKeyClass.PaymentInstrument, input);
      return encryptedString;
    }

    private string DecryptString(string encryptedString)
    {
      CryptoManager cm = new CryptoManager();
      string decryptedString = cm.Decrypt(CryptKeyClass.PaymentInstrument, encryptedString);
      return decryptedString;
    }

    /// <summary>
    /// Returns the last four characters of a given string
    /// </summary>
    /// <param name="accountNumber">input string</param>
    /// <returns>last four chars of accountNumber string</returns>
    private string GetLastFourDigits(string accountNumber)
    {
      if (String.IsNullOrEmpty(accountNumber))
      {
        return string.Empty;
      }

      int strLen = accountNumber.Length;
      if (strLen <= 4)
      {
        return accountNumber;
      }

      string lastFour = accountNumber.Substring(strLen - 4, 4);
      return lastFour;
    }

    private bool DoesTransactionExist(MetraPaymentInfo paymentInfo)
    {
      var resourceManager = new ResourcesManager();
      string alreadySubmittedMessage = resourceManager.GetLocalizedResource("TX_ALREADY_SUBMITTED");

      IMTQueryAdapter qa = new MTQueryAdapter();
      qa.Init("PaymentServer");
      qa.SetQueryTag("__GET_PS_TRANSACTION_STATUS__");
      string numTx = qa.GetQuery();
      using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Suppress,
                                          new TransactionOptions(),
                                          EnterpriseServicesInteropOption.Full))
      {
        using (IMTConnection conn = ConnectionManager.CreateConnection())
        {
          using (IMTPreparedStatement stmt = conn.CreatePreparedStatement(numTx))
          {
            stmt.AddParam("id_transaction", MTParameterType.String,
                          paymentInfo.TransactionSessionId.ToString());



            using (IMTDataReader dataReader = stmt.ExecuteReader())
            {
              //if there are records, then we do have this credit card on file.  If not, we move on.
              if (dataReader.Read())
              {
                TransactionState state =
                    (TransactionState)
                    Enum.Parse(typeof(TransactionState), dataReader.GetString("n_state"));
                if (state == TransactionState.SUCCESS)
                {
                  return true;
                }
                else if (state == TransactionState.REJECTED)
                {
                  throw new MASBasicException(
                      String.Format(alreadySubmittedMessage, paymentInfo.TransactionSessionId),
                      ErrorCodes.TRANSACTION_ALREADY_REJECTED);
                }
                else
                {
                  throw new MASBasicException(
                      String.Format(alreadySubmittedMessage, paymentInfo.TransactionSessionId),
                      ErrorCodes.TRANSACTION_ALREADY_FAILED);
                }
              }
              else { return false; }
            }
          }
        }
      }
    }

    private CreditCardPaymentMethod GetCCPaymentMethod(Guid token, MetraPaymentMethod paymentMethod)
    {
      CreditCardPaymentMethod ccPaymentMethod = (CreditCardPaymentMethod)paymentMethod;
      using (IMTConnection conn = ConnectionManager.CreateConnection())
      {
        using (IMTAdapterStatement stmt = conn.CreateAdapterStatement("PaymentServer",
                "__SELECT_ALL_CC_DATA__"))
        {

          stmt.AddParam("%%PAYMENT_INSTRUMENT_ID%%", token.ToString());

          using (IMTDataReader dataReader = stmt.ExecuteReader())
          {
            // Read the credit card info details
            while (dataReader.Read())
            {

              EnumConfig enumCfg = new EnumConfig();
              string ccTypeEnumValue = enumCfg.GetEnumeratorByID((int)dataReader.GetInt32("n_credit_card_type"));

              ccPaymentMethod.CreditCardType = (MetraTech.DomainModel.Enums.Core.Metratech_com.CreditCardType)EnumHelper.GetGeneratedEnumByEntry(
                  typeof(MetraTech.DomainModel.Enums.Core.Metratech_com.CreditCardType),
                  ccTypeEnumValue);

              ccPaymentMethod.ExpirationDate = dataReader.GetString("nm_expirationdt");
              ccPaymentMethod.ExpirationDateFormat = (MTExpDateFormat)dataReader.GetInt32("nm_expirationdt_format");

              // these might be maestro specific, so might need to add check on cctype
              ccPaymentMethod.StartDate = dataReader.GetString("nm_startdate");
              ccPaymentMethod.IssuerNumber = dataReader.GetString("nm_issuernumber");

            }
          }
        }
      }
      return ccPaymentMethod;
    }

    private void UpdateTransactionStatus(Guid transactionId, TransactionState status, string response = "")
    {
      IMTQueryAdapter qa = new MTQueryAdapter();
      qa.Init("PaymentServer");
      qa.SetQueryTag("__UPDATE_PS_TRANSACTION_STATUS__");
      string psTxStmt = qa.GetQuery();
      //Transaction state updates shouldn't be rolled back in case of failure.
      using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Suppress,
                                                new TransactionOptions(),
                                                EnterpriseServicesInteropOption.Full))
      {
        using (IMTConnection conn = ConnectionManager.CreateConnection())
        {
          using (IMTPreparedStatement stmt = conn.CreatePreparedStatement(psTxStmt))
          {
            stmt.AddParam("id_transaction", MTParameterType.String, transactionId.ToString());
            stmt.AddParam("n_state", MTParameterType.String, status.ToString());
            stmt.AddParam("n_gateway_response", MTParameterType.String, response);

            stmt.ExecuteNonQuery();
            stmt.ClearParams();
          }
        }
      }
    }

    private void WriteToPaymentAudit(MetraPaymentMethod paymentMethod, MetraPaymentInfo paymentInfo, object requestType)
    {
      PaymentType pmt = PaymentType.Credit_Card;
      bool nullPaymentInfo = false;
      if (paymentInfo == null)
      {
        nullPaymentInfo = true;
        paymentInfo = new MetraPaymentInfo();
        paymentInfo.MetraPaymentInvoices = new List<MetraPaymentInvoice>();

        MetraPaymentInvoice invoice = new MetraPaymentInvoice();
        invoice.InvoiceDate = MetraTime.Now;

        paymentInfo.MetraPaymentInvoices.Add(invoice);
        paymentInfo.TransactionSessionId = Guid.NewGuid();
      }

      if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
          paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
      {
        pmt = PaymentType.Credit_Card;
      }
      else
      {
        pmt = PaymentType.ACH;
      }
      Guid nextAuditID = Guid.NewGuid();

      using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Suppress,
                                                new TransactionOptions(),
                                                EnterpriseServicesInteropOption.Full))
      {
        using (IMTConnection conn = ConnectionManager.CreateConnection())
        {
          IMTQueryAdapter qa = new MTQueryAdapter();
          qa.Init("PaymentServer");
          qa.SetQueryTag("__INSERT_INTO_T_PS_AUDIT__");
          string psAuditStmt = qa.GetQuery();
          //Transaction state updates shouldn't be rolled back in case of failure.
          using (IMTPreparedStatement stmt = conn.CreatePreparedStatement(psAuditStmt))
          {

            // This only handles the credit card case
            stmt.AddParam("id_audit", MTParameterType.String, nextAuditID.ToString());
            stmt.AddParam("id_request_type", MTParameterType.Integer, BlankIfNull(requestType));
            stmt.AddParam("id_transaction", MTParameterType.String, BlankIfNull(paymentInfo.TransactionID));
            stmt.AddParam("dt_transaction", MTParameterType.DateTime, MetraTime.Now);
            stmt.AddParam("n_payment_method_type", MTParameterType.Integer, BlankIfNull(EnumHelper.GetDbValueByEnum(pmt)));
            stmt.AddParam("nm_truncd_acct_num", MTParameterType.String, BlankIfNull(paymentMethod.AccountNumber));

            if (paymentMethod.GetType() == typeof(CreditCardPaymentMethod) ||
              paymentMethod.GetType().IsSubclassOf(typeof(CreditCardPaymentMethod)))
            {
              CreditCardPaymentMethod cc = (CreditCardPaymentMethod)paymentMethod;
              stmt.AddParam("n_creditcard_type", MTParameterType.Integer, BlankIfNull(EnumHelper.GetDbValueByEnum(cc.CreditCardType)));
              stmt.AddParam("n_account_type", MTParameterType.Integer, 0);
            }
            else
            {
              ACHPaymentMethod ach = (ACHPaymentMethod)paymentMethod;
              stmt.AddParam("n_creditcard_type", MTParameterType.Integer, 0);
              stmt.AddParam("n_account_type", MTParameterType.Integer, ach.AccountType);
            }

            stmt.AddParam("nm_description", MTParameterType.String, BlankIfNull(paymentInfo.Description));
            stmt.AddParam("n_currency", MTParameterType.String, BlankIfNull(paymentInfo.Currency));
            stmt.AddParam("n_amount", MTParameterType.Decimal, BlankIfNull(paymentInfo.Amount));
            stmt.AddParam("id_transaction_session_id", MTParameterType.String, paymentInfo.TransactionSessionId.ToString());
            //If there's no PaymentInfo, assume that it's a one-off transaction, and that it's completed immediately.
            if (nullPaymentInfo)
            {
              stmt.AddParam("n_state", MTParameterType.String, TransactionState.SUCCESS.ToString());
            }
            else
            {
              stmt.AddParam("n_state", MTParameterType.String, TransactionState.RECEIVED_REQUEST.ToString());
            }
            stmt.ExecuteNonQuery();
          }

          int i = 1;

          using (MTComSmartPtr<IMTQueryAdapter> queryAdapter = new MTComSmartPtr<IMTQueryAdapter>())
          {
            queryAdapter.Item = new MTQueryAdapter();
            queryAdapter.Item.Init("PaymentServer");
            queryAdapter.Item.SetQueryTag("__INSERT_INTO_T_PS_AUDIT_DETAILS__");

            using (IMTPreparedStatement stmt = conn.CreatePreparedStatement(queryAdapter.Item.GetRawSQLQuery(true)))
            {
              if (paymentInfo.MetraPaymentInvoices != null && paymentInfo.MetraPaymentInvoices.Count > 0)
              {
                foreach (MetraPaymentInvoice invoice in paymentInfo.MetraPaymentInvoices)
                {
                  stmt.AddParam(MTParameterType.Integer, i);
                  stmt.AddParam(MTParameterType.String, nextAuditID.ToString());
                  stmt.AddParam(MTParameterType.String, BlankIfNull(invoice.InvoiceNum));
                  stmt.AddParam(MTParameterType.DateTime, invoice.InvoiceDate);
                  stmt.AddParam(MTParameterType.String, BlankIfNull(invoice.PONum));
                  stmt.AddParam(MTParameterType.Decimal, invoice.AmountToPay);

                  stmt.ExecuteNonQuery();

                  stmt.ClearParams();

                  i++;
                }
              }
              else
              //if (!string.IsNullOrEmpty(paymentInfo.InvoiceNum) || paymentInfo.IsInvoiceDateDirty || !string.IsNullOrEmpty(paymentInfo.PONum))
              {
                stmt.AddParam(MTParameterType.Integer, i);
                stmt.AddParam(MTParameterType.String, nextAuditID.ToString());
                stmt.AddParam(MTParameterType.String, BlankIfNull(paymentInfo.InvoiceNum));
                stmt.AddParam(MTParameterType.DateTime, paymentInfo.InvoiceDate);
                stmt.AddParam(MTParameterType.String, BlankIfNull(paymentInfo.PONum));
                stmt.AddParam(MTParameterType.Decimal, paymentInfo.Amount);

                stmt.ExecuteNonQuery();

                stmt.ClearParams();
              }
            }
          }
        }

        scope.Complete();
      }
    }

    private MetraPaymentMethod CloneAndApplyProperties(MetraPaymentMethod updatedPaymentMethod, MetraPaymentMethod existingPaymentMethod)
    {
      MetraPaymentMethod updatedMethod = null;

      if (updatedPaymentMethod.GetType() == existingPaymentMethod.GetType() ||
          updatedPaymentMethod.GetType().IsSubclassOf(existingPaymentMethod.GetType()))
      {
        updatedMethod = updatedPaymentMethod.Clone() as MetraPaymentMethod;

        if (updatedMethod != null)
        {
          List<PropertyInfo> existingProps = existingPaymentMethod.GetMTProperties();

          foreach (PropertyInfo propInfo in existingProps)
          {
            if (!existingPaymentMethod.IsDirtyProperty(propInfo) &&
                !updatedPaymentMethod.IsDirty(propInfo))
            {
              updatedMethod.SetValue(propInfo, existingPaymentMethod.GetValue(propInfo));
            }
          }

          updatedMethod.AccountNumber = existingPaymentMethod.RawAccountNumber;
        }
        else
        {
          throw new MASBasicException("Unable to clone updated payment method");
        }
      }
      else
      {
        throw new MASBasicException("Updated payment method type is not the same or a subclass of the original payment method");
      }

      return updatedMethod;
    }
    #endregion

  }
}
