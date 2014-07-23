﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PageExt.master" AutoEventWireup="true" CodeFile="ProductOfferingsList.aspx.cs" Inherits="ProductOfferingsList" meta:resourcekey="PageResource1" Culture="auto" UICulture="auto" %>

<%@ Register assembly="MetraTech.UI.Controls" namespace="MetraTech.UI.Controls" tagprefix="MT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

    <script type="text/javascript" language="javascript" src="/mcm/default/lib/browsercheck.js"></script>
    <script type="text/javascript" language="javascript" src="/mcm/default/lib/PopupEdit.js"></script>

    <script language="javascript" type="text/javascript">
      function CreateProductOffering_<%=MTFilterGrid1.ClientID%> () {
        //var targetURL= "/MetraNet/TicketToMCM.aspx?Redirect=True&Title=Create New Product Offerings&URL=/mcm/default/dialog/wizard/CreatePO/wizardstart.asp|Path=/mcm/default/dialog/wizard/CreatePO**PageID=start";
        //OpenModalWindow(targetURL);
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
        var str;
        var textTEXT_UnhidePO = '<%=GetLocalResourceObject("TEXT_UnhidePO")%>';
        var textTEXT_ViewPO = '<%=GetLocalResourceObject("TEXT_ViewPO")%>';
        if (record.data.IsHidden)
        {
            str = String.format("<span title='Name_{0}'><a style='cursor:hand;color:DimGrey;' id='unhideName_{0}' title='{1}' href='JavaScript:UnHideProductOffering({0});'>{2}</a></span>", 
                                record.data.ProductOfferingId,
                                textTEXT_UnhidePO,
                                record.data.Name);
        }
        else
        {
            str = String.format("<span title='Name_{0}'><a style='cursor:hand;' id='viewName_{0}' title='{1}' href='JavaScript:ViewProductOffering({0});'>{2}</a></span>", 
                                record.data.ProductOfferingId,
                                textTEXT_ViewPO,
                                record.data.Name);
        }

        return str;
    }

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
            str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='unhide_{0}' title='{1}' href='JavaScript:UnHideProductOffering({0});'>  <img src='/Res/Images/icons/package_add.png' alt='{1}' /></a>", 
              record.data.ProductOfferingId, textTEXT_UnhidePO);
        }
        else
        {
            str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='view_{0}'   title='{1}' href='JavaScript:ViewProductOffering({0});'>  <img src='/Res/Images/icons/package_go.png'   alt='{1}' /></a>",
              record.data.ProductOfferingId, textTEXT_ViewPO);
            str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='edit_{0}'   title='{1}' href='JavaScript:EditProductOffering({0}, \"{2}\");'>  <img src='/Res/Images/icons/pencil.png'       alt='{1}' /></a>",
              record.data.ProductOfferingId, textTEXT_EditPO, store.sm.grid.id);
            //str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='manage_{0}' title='{2}' href='JavaScript:CopyProductOffering(\"{0}\", \"{1}\");'><img src='/Res/Images/icons/copy.png' alt='{2}' /></a>", record.data.ProductOfferingId, escape(record.data.Currency), "Copy Product Offering"); 
            str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='manage_{0}' title='{5}' href='JavaScript:CopyProductOffering(\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\");'><img src='/Res/Images/icons/copy.png' alt='{5}' /></a>",
              record.data.ProductOfferingId, escape(record.data.Name), escape(record.data.Description),escape(record.data.DisplayName),escape(record.data.Currency), textTEXT_CopyPO); 
            
            if (<%=(!(PartitionLibrary.IsPartition)).ToString().ToLower()%>)
            {
                str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='hide_{0}'   title='{1}' href='JavaScript:HideProductOffering({0});'>  <img src='/Res/Images/icons/package_gray.png' alt='{1}' /></a>", 
                  record.data.ProductOfferingId, textTEXT_HidePO);
            }

            if (<%=UI.CoarseCheckCapability("Delete Product Offerings").ToString().ToLower()%>)
            {
                str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='delete_{0}' title='{1}' href='JavaScript:DeleteProductOffering({0});'><img src='/Res/Images/icons/delete.png'       alt='{1}' /></a>",
                  record.data.ProductOfferingId, textTEXT_DeletePO);
            }
        }
        return str;
    }

    function NoActionsColRenderer(value, meta, record, rowIndex, colIndex, store)
    {        
        var str = "";
        var textTEXT_CopyPO = '<%=GetLocalResourceObject("TEXT_CopyPO")%>';

        str += String.format("&nbsp;&nbsp;<a style='cursor:hand;' id='manage_{0}' title='{5}' href='JavaScript:CopyProductOffering(\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\");'><img src='/Res/Images/icons/copy.png' alt='{5}' /></a>",
          record.data.ProductOfferingId, escape(record.data.Name), escape(record.data.Description),escape(record.data.DisplayName),escape(record.data.Currency), textTEXT_CopyPO); 
            
        return str;
    }
  
    function ViewProductOffering(POID)
    {
        var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.ViewEdit.Frame.asp|ID=" + POID;
        location.href = targetURL;
    }  

    function EditProductOffering(POID , gridId)
    {
      var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.Edit.Asp|ID=" + POID + "**GridId=" + gridId;
      OpenModalWindow(targetURL);
      GridRefresh(gridId);
    }  

    //function CopyProductOffering(POID,Currency)
    function CopyProductOffering(POID, name, description, displayname, currency)
    {
      //location.href = '/MetraNet/MetraOffer/ProductOfferings/CopyExistingProductOffering.aspx?poid='+ POID + '&currency=' + currency; 
      location.href = '/MetraNet/MetraOffer/ProductOfferings/CopyExistingProductOffering.aspx?poid='+ POID + '&poname=' + name + '&podescription=' + description+ '&podisplayname=' + displayname + '&pocurrency=' + currency; 
      
    }  

    
    function HideProductOffering(POID)
    {
        var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.HideUnhide.asp|ID=" + POID + "**Hide=TRUE**Parameters=MDMReload|TRUE";
        OpenModalWindow(targetURL);
    }  

    function UnHideProductOffering(POID)
    {
        var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOffering.HideUnhide.asp|ID=" + POID + "**Hide=FALSE**Parameters=MDMReload|TRUE";
        OpenModalWindow(targetURL);
    }  

    function DeleteProductOffering(POID)
    {
        var targetURL="/MetraNet/TicketToMCM.aspx?Redirect=True&URL=/MCM/default/dialog/ProductOfferingDelete.asp|ID=" + POID;
        OpenModalWindow(targetURL);
    }

    function OpenModalWindow(url)
    {
      window.OpenDialogWindow(url, "height=400,width=600,resizable=yes,scrollbars=yes");
    }
    
    function GridRefresh(gridId) {
      var grid = window.Ext.getCmp(gridId);
      setTimeout(function() {
        if (window.winDialog.closed) {
          grid.getSelectionModel().deselectAll(true);
          grid.store.reload();
        }
        else
          setTimeout(arguments.callee, 10);
      }, 10);
    }

    </script>

    <div id="results-win" class="x-hidden"> 
      <div class="x-window-header"></div> 
    <div id="result-content"></div> 
  </div> 
</asp:Content>