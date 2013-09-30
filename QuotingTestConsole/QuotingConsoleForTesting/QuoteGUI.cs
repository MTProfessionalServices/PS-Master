﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetraTech.Domain.Quoting;
using MetraTech.DomainModel.BaseTypes;

namespace QuotingConsoleForTesting
{
  public partial class formQuoteGUI : Form
  {
    private const string PiNameColumn = "PiName";
    private const string UdrcValueColumn = "UdrcValue";
    private const string PiIdColumn = "PiId";
    private const string PoIdColumn = "PoId";
    private const int DefaultUdrcValue = 0;

    private readonly QuoteRequest _request;
    private List<BasePriceableItemInstance> _piWithIcbs;
    private List<IndividualPrice> _icbs;

    private readonly BackgroundWorker _quoteWorker = new BackgroundWorker {WorkerReportsProgress = true};

    public formQuoteGUI()
    {
      _request = new QuoteRequest();
      InitializeComponent();

      gridViewUDRCs.Columns.Add(PiNameColumn, "Priceable Item");
      gridViewUDRCs.Columns.Add(UdrcValueColumn, "UDRC Value");
      gridViewUDRCs.Columns.Add(PiIdColumn, "PiId");
      gridViewUDRCs.Columns.Add(PoIdColumn, "PoId");

      gridViewUDRCs.Columns[PiNameColumn].ReadOnly = true;
      gridViewUDRCs.Columns[UdrcValueColumn].AutoSizeMode = DataGridViewAutoSizeColumnMode.ColumnHeader;
      gridViewUDRCs.Columns[PiIdColumn].Visible = false;
      gridViewUDRCs.Columns[PoIdColumn].Visible = false;

      _quoteWorker.DoWork += QuoteDoWork;
      _quoteWorker.ProgressChanged += QuoteProgressChanged;
      _quoteWorker.RunWorkerCompleted += QuoteRunWorkerCompleted;
    }

    #region Event Listeners

    private void exitToolStripMenuItem_Click(object sender, EventArgs e)
    {
      Close();
    }

    private void formQuoteGUI_Load(object sender, EventArgs e)
    {
      listBoxAccounts.Items.Clear();
      listBoxPOs.Items.Clear();
      dateTimePickerStartDate.Value = DateTime.Today.AddDays(1);
      dateTimePickerEndDate.Value = DateTime.Today.AddDays(1);
      var gateway = GetGatewy();
      RefreshServices(gateway);
    }

    private void btnRefresh_Click(object sender, EventArgs e)
    {
      var gateway = string.IsNullOrEmpty(textBoxMetraNetServer.Text) ? GetGatewy() : textBoxMetraNetServer.Text;
      RefreshServices(gateway);
    }

    private void createQuoteToolStripMenuItem_Click(object sender, EventArgs e)
    {
      SetRequest();
      richTextBoxResults.Text = string.Format("Sending quote request...{0}Waiting for response...", Environment.NewLine);
      createQuoteToolStripMenuItem.Enabled = false;
      _quoteWorker.RunWorkerAsync();
    }

    private void checkBoxIsGroupSubscription_CheckedChanged(object sender, EventArgs e)
    {
      comboBoxCorporateAccount.Enabled = checkBoxIsGroupSubscription.Checked;
      label2.Enabled = checkBoxIsGroupSubscription.Checked;
    }

    private void loadPiButton_Click(object sender, EventArgs e)
    {
      var poIds = GetSelectedPoIds();

      //load PIs
      gridViewUDRCs.Rows.Clear();
      foreach (var poId in poIds)
      {
        foreach (var item in ServiceHelper.GetPriceListsWithUdrcs(poId))
        {
          gridViewUDRCs.Rows.Add(item.Name, DefaultUdrcValue, item.ID, poId);
        }
      }

      //load PIS with Allowed ICBS
      _piWithIcbs = ServiceHelper.GetPIWithAllowICBs(poIds);
      foreach (var item in _piWithIcbs)
      {
        listBoxPOs.Items.Add(item.Name);
      }
    }

    private void listBoxICBs_MouseDoubleClick(object sender, MouseEventArgs e)
    {
      if ((listBoxICBs.Items.Count > 0) && (listBoxICBs.SelectedIndex >= 0))
      {
        var selectedPI = _piWithIcbs[listBoxICBs.SelectedIndex];
        var icbForm = new ICBForm(selectedPI,
                                  _icbs.Where(indPrices => indPrices.PriceableItemId == selectedPI.ID).ToList());
        if (icbForm.ShowDialog() == DialogResult.OK)
        {
          _icbs.RemoveAll(i => i.PriceableItemId == selectedPI.ID);
          _icbs.AddRange(icbForm.icbsLocal);
        }
      }
    }

    #region Background Worker Event Listeners

    private void QuoteDoWork(object sender, DoWorkEventArgs e)
    {
      var quoteTask = Task<string>.Factory.StartNew(() => QuoteInvoker.InvokeCreateQuote(_request).ToString());

      while (!quoteTask.IsCompleted)
      {
        _quoteWorker.ReportProgress(1);
        Thread.Sleep(500);
      }

      e.Result = quoteTask.Result;
    }

    private void QuoteProgressChanged(object sender, ProgressChangedEventArgs e)
    {
      richTextBoxResults.Text = string.Format("{0}.", richTextBoxResults.Text);
    }

    private void QuoteRunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
    {
      richTextBoxResults.Text = string.Format("{0}{1}Response received:{1}{2}",
                                              richTextBoxResults.Text, Environment.NewLine, e.Result);
      createQuoteToolStripMenuItem.Enabled = true;
    }

    #endregion

    #endregion

    #region Additional methods

    private void SetRequest()
    {
      _request.QuoteIdentifier = "Test Quote " + DateTime.Now;
      _request.QuoteDescription = textBoxQuoteDescription.Text;
      _request.Accounts = GetSelectedAccountIds();
      _request.ProductOfferings = GetSelectedPoIds();
      _request.ReportParameters.PDFReport = checkBoxPDF.Checked;
      _request.EffectiveDate = dateTimePickerStartDate.Value;
      _request.EffectiveEndDate = dateTimePickerEndDate.Value;
      _request.SubscriptionParameters.UDRCValues = RetrieveUdrcList();
      _request.IcbPrices = _icbs;

      if (checkBoxIsGroupSubscription.Checked)
      {
        _request.SubscriptionParameters.IsGroupSubscription = true;
        var selectedCorpAccItem = (KeyValuePair<int, string>) comboBoxCorporateAccount.SelectedItem;
        _request.SubscriptionParameters.CorporateAccountId = selectedCorpAccItem.Key;
      }
    }

    private List<int> GetSelectedPoIds()
    {
      return (from KeyValuePair<int, string> po in listBoxPOs.SelectedItems select po.Key).ToList();
    }

    private List<int> GetSelectedAccountIds()
    {
      return (from KeyValuePair<int, string> acc in listBoxAccounts.SelectedItems select acc.Key).ToList();
    }

    private Dictionary<string, List<UDRCInstanceValueBase>> RetrieveUdrcList()
    {
      var dictionaryToReturn = new Dictionary<string, List<UDRCInstanceValueBase>>();

      foreach (DataGridViewRow row in gridViewUDRCs.Rows)
      {
        var piId = Convert.ToInt32(row.Cells[PiIdColumn].Value);
        var poId = row.Cells[PoIdColumn].Value.ToString();

        var udrc = new UDRCInstanceValueBase
          {
            UDRC_Id = piId,
            StartDate = DateTime.Now,
            EndDate = DateTime.Now.AddYears(1),
            Value = Convert.ToInt32(row.Cells[UdrcValueColumn].Value)
          };

        if (dictionaryToReturn.ContainsKey(poId))
        {
          dictionaryToReturn[poId].Add(udrc);
        }
        else
        {
          dictionaryToReturn.Add(poId, new List<UDRCInstanceValueBase> {udrc});
        }
      }

      return dictionaryToReturn;
    }

    private void RefreshServices(string gateway)
    {
      SetGateway(gateway);

      //load Accounts
      foreach (var item in ServiceHelper.GetAccounts(gateway))
      {
        listBoxAccounts.Items.Add(ContentLoader.GetAccountListBoxItem(item));
        comboBoxCorporateAccount.Items.Add(ContentLoader.GetAccountListBoxItem(item));
      }

      //load POs
      foreach (var item in ServiceHelper.GetProductOfferings(gateway))
      {
        listBoxPOs.Items.Add(ContentLoader.GetProductOfferingListBoxItem(item));
      }
    }

    private static string GetGatewy()
    {
      return "localhost:8001";
    }

    private static void SetGateway(string gateway)
    {
      //do something
    }

    #endregion
  }
}
