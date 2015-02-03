﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/NoMenuPageExt.master" AutoEventWireup="true" CodeFile="ProductOfferingsList.aspx.cs" Inherits="ProductOfferingsList" meta:resourcekey="PageResource1" Culture="auto" UICulture="auto" %>

<%@ Register Assembly="MetraTech.UI.Controls" Namespace="MetraTech.UI.Controls" TagPrefix="MT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <MT:MTFilterGrid ID="MTFilterGrid1" runat="server" ExtensionName="Core"
    TemplateFileName="ProductOfferingsList" ButtonAlignment="Center"
    Buttons="None" DefaultSortDirection="Ascending" DisplayCount="True"
    EnableColumnConfig="True" EnableFilterConfig="True" EnableLoadSearch="False"
    EnableSaveSearch="False" Expandable="False" ExpansionCssClass=""
    Exportable="False" FilterColumnWidth="350" FilterInputWidth="220"
    FilterLabelWidth="75" FilterPanelCollapsed="False"
    FilterPanelLayout="MultiColumn" meta:resourcekey="MTFilterGrid1Resource1"
    MultiSelect="False" PageSize="10"
    Resizable="True" RootElement="Items" SearchOnLoad="True"
    SelectionModel="Standard" ShowBottomBar="True" ShowColumnHeaders="True"
    ShowFilterPanel="True" ShowGridFrame="True" ShowGridHeader="True"
    ShowTopBar="True" TotalProperty="TotalRows" NoRecordsText='<%=GetLocalResourceObject("NO_RECORDS_TEXT")%>' />

  <script type="text/javascript" src="/mcm/default/lib/browsercheck.js"></script>
  <script type="text/javascript" src="/mcm/default/lib/PopupEdit.js"></script>
  <script type="text/javascript" src="../javascript/metraOffer.js"></script>

  <script type="text/javascript">

    var intialize = function(){
      if(MetraControl.common){
        this.MetraControljs = new MetraControl.common();
      }
    }();

    function CreateProductOffering_<%=MTFilterGrid1.ClientID%> () {
        var gridId = "extGrid_" + "<%=MTFilterGrid1.ClientID%>";
        MetraControljs.saveFilterModel(gridId);
        location.href = '/MetraNet/MetraOffer/ProductOfferings/CreateProductOffering.aspx?Master=' + <%=IsMaster.ToString().ToLower()%>;
      };

      OverrideRenderer_<%=MTFilterGrid1.ClientID%> = function(cm) {
      if (<%=IsMaster.ToString().ToLower()%>) {
          cm.setRenderer(cm.getIndexById('ProductOfferingId'), NoActionsColRenderer);
      } else {
        cm.setRenderer(cm.getIndexById('Name'), NameColRenderer);
        cm.setRenderer(cm.getIndexById('ProductOfferingId'), ActionsColRenderer);
      }
      };
  
      function NameColRenderer(value, meta, record, rowIndex, colIndex, store)
      {
        var str,
            textTEXT_UnhidePO = '<%=GetLocalResourceObject("TEXT_UnhidePO")%>',
            textTEXT_ViewPO = '<%=GetLocalResourceObject("TEXT_ViewPO")%>';
        if (record.data.IsHidden)
        {
          str = String.format("<span title='Name_{0}'><a style='cursor:hand;color:DimGrey;' id='unhideName_{0}' title='{1}' href='JavaScript:UnHideProductOffering({0});'>{2}</a></span>", 
                              record.data.ProductOfferingId,
                              textTEXT_UnhidePO,
                              record.data.Name);
        }
        else
        {
          str = String.format("<span title='Name_{0}'><a style='cursor:hand;' id='viewName_{0}' title='{1}' href='JavaScript:ViewProductOffering({0}, \"{3}\");'>{2}</a></span>", 
                              record.data.ProductOfferingId,
                              textTEXT_ViewPO,
                              record.data.Name,
                              store.sm.grid.id);        
        }
        return str;
      };

      function ActionsColRenderer(value, meta, record, rowIndex, colIndex, store)
      {
        var str = "";
        var textTEXT_UnhidePO = '<%=GetLocalResourceObject("TEXT_UnhidePO")%>';
        var textTEXT_ViewPO = '<%=GetLocalResourceObject("TEXT_ViewPO")%>';
        var textTEXT_EditPO = '<%=GetLocalResourceObject("TEXT_EditPO")%>';
        var textTEXT_CopyPO = '<%=GetLocalResourceObject("TEXT_CopyPO")%>';
        var textTEXT_HidePO = '<%=GetLocalResourceObject("TEXT_HidePO")%>';
        var textTEXT_DeletePO = '<%=GetLocalResourceObject("TEXT_DeletePO")%>';

        if (record.data.IsHidden)
        {
          str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='unhide_{0}' title='{1}' href='JavaScript:UnHideProductOffering({0}, \"{2}\");'>  <img src='/Res/Images/icons/package_add.png' alt='{1}' /></a>", 
            record.data.ProductOfferingId, textTEXT_UnhidePO, store.sm.grid.id);
        }
        else
        {
          str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='view_{0}' title='{1}' href='JavaScript:ViewProductOffering({0},\"{2}\");'>  <img src='/Res/Images/icons/package_go.png' alt='{1}' /></a>",
            record.data.ProductOfferingId, textTEXT_ViewPO, store.sm.grid.id);
          str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='edit_{0}' title='{1}' href='JavaScript:EditProductOffering({0}, \"{2}\");'>  <img src='/Res/Images/icons/pencil.png' alt='{1}' /></a>",
            record.data.ProductOfferingId, textTEXT_EditPO, store.sm.grid.id);
          str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='manage_{0}' title='{6}' href='JavaScript:CopyProductOffering(\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\",\"{5}\");'><img src='/Res/Images/icons/copy.png' alt='{6}' /></a>",
            record.data.ProductOfferingId, escape(record.data.Name), escape(record.data.Description),escape(record.data.DisplayName),escape(record.data.Currency), store.sm.grid.id, textTEXT_CopyPO); 
            
          if (<%=(!(PartitionLibrary.IsPartition)).ToString().ToLower()%>)
          {
              str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='hide_{0}' title='{1}' href='JavaScript:HideProductOffering({0}, \"{2}\");'>  <img src='/Res/Images/icons/package_gray.png' alt='{1}' /></a>", 
                record.data.ProductOfferingId, textTEXT_HidePO, store.sm.grid.id);
        }
        if (<%=UI.CoarseCheckCapability("Delete Product Offerings").ToString().ToLower()%>) {
        str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='delete_{0}' title='{1}' href='JavaScript:DeleteProductOffering({0}, \"{2}\");'><img src='/Res/Images/icons/delete.png' alt='{1}' /></a>",
          record.data.ProductOfferingId, textTEXT_DeletePO, store.sm.grid.id);
      }
      }
      return str;
      }     

      function NoActionsColRenderer(value, meta, record, rowIndex, colIndex, store)
      {        
        var str = "";
        var textTEXT_CopyPO = '<%=GetLocalResourceObject("TEXT_CopyPO")%>';
      str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='manage_{0}' title='{6}' href='JavaScript:CopyProductOffering(\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\",\"{5}\");'><img src='/Res/Images/icons/copy.png' alt='{6}' /></a>",
        record.data.ProductOfferingId, escape(record.data.Name), escape(record.data.Description),escape(record.data.DisplayName),escape(record.data.Currency), store.sm.grid.id, textTEXT_CopyPO); 
      return str;
    };

    function ViewProductOffering(poId, gridId) {
      this.MetraControljs.saveFilterModel(gridId);
      var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.ViewEdit.Frame.asp|ID=" 
        + poId+"**Master=<%=IsMaster.ToString().ToLower()%>";
        location.href = targetURL;
      };

      function EditProductOffering(poId, gridId)
      {
        var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.Edit.Asp|ID=" + poId + "**GridId=" + gridId;
        this.MetraControljs.openModalWindow(targetURL);
        this.MetraControljs.gridRefresh(gridId);
      };

      function CopyProductOffering(POID, name, description, displayname, currency, gridId) {
        this.MetraControljs.saveFilterModel(gridId);
        location.href = '/MetraNet/MetraOffer/ProductOfferings/CopyExistingProductOffering.aspx?poid=' + POID 
          + '&poname=' + name + '&podescription=' + description + '&podisplayname=' + displayname + '&pocurrency=' 
          + currency + "&Master="+ '<%=IsMaster.ToString().ToLower()%>';
    };
   
    function HideProductOffering(poId, gridId) {
      var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.HideUnhide.asp|ID=" + poId + 
        "**Hide=TRUE**Parameters=MDMReload|TRUE" + "**GridId=" + gridId;
      this.MetraControljs.openModalWindow(targetURL);
      this.MetraControljs.gridRefresh(gridId);
    };

    function UnHideProductOffering(poId, gridId) {
      var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.HideUnhide.asp|ID=" + poId + 
        "**Hide=FALSE**Parameters=MDMReload|TRUE" + "**GridId=" + gridId;
      this.MetraControljs.openModalWindow(targetURL);
      this.MetraControljs.gridRefresh(gridId);
    }; 

    function DeleteProductOffering(poId, gridId) {
      var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOfferingDelete.asp|ID=" + poId + "**GridId=" + gridId;
      this.MetraControljs.openModalWindow(targetURL);
      this.MetraControljs.gridRefresh(gridId);
    };
  </script>

  <div id="results-win" class="x-hidden">
    <div class="x-window-header"></div>
    <div id="result-content"></div>
  </div>
</asp:Content>
