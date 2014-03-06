<%@ Page Language="C#" MasterPageFile="~/MasterPages/PageExt.master" AutoEventWireup="true"
  Inherits="ReportsAnalyticsDashboard" Title="MetraNet" CodeFile="ReportsAnalyticsDashboard.aspx.cs" %>

<%@ Register Assembly="MetraTech.UI.Controls.CDT" Namespace="MetraTech.UI.Controls.CDT"
  TagPrefix="MTCDT" %>
<%@ Register Assembly="MetraTech.UI.Controls" Namespace="MetraTech.UI.Controls" TagPrefix="MT" %>
<asp:Content ID="ReportsAnalyticsDashboardPage" ContentPlaceHolderID="ContentPlaceHolder1"
  runat="Server">
  
  <link rel="stylesheet" type="text/css" href="/Res/Styles/jquery.gridster.css">
  <link rel="stylesheet" type="text/css" href="/Res/Styles/dc.css">

  <script type="text/javascript" src="MetraControl/ControlCenter/js/D3Visualize.js"></script>
  <script type="text/javascript" src="/Res/JavaScript/jquery.min.js"></script>
  <script type="text/javascript" src="/Res/JavaScript/jquery.gridster.min.js"></script>
  <script type="text/javascript" src="/Res/JavaScript/crossfilter.min.js"></script>
  <script type="text/javascript" src="/Res/JavaScript/dc.min.js"></script>
  <script type="text/javascript" src="/Res/JavaScript/Renderers.js"></script>

  <MT:MTTitle ID="MTTitle1" Text="Finance Dashboard" runat="server" meta:resourcekey="MTTitle1Resource1" />
  <%--<div style="margin: 40px; border: 1px solid; padding: 15px 10px 15px 35px; background-repeat: no-repeat;
    background-position: 10px center; color: #9F6000; background-color: #FEEFB3; background-image: url('/Res/Images/icons/error.png');">
    Under development
  </div>--%>
  <br />
  <div class="remaining-graphs span8">
    <div class="row-fluid">
      <div id='dc-volume-chart' class="pie-graph span4 dc-chart" style="float: none !important;">
      </div>
    </div>
  </div>
  <br />
  <script type="text/javascript">
    $(function () {
      getNewCustomers();
    });
    
    function getNewCustomers() {
      $.ajax({
        type: 'GET',
        async: true,
        url: '\\Report\\NewCustomers',
        success: function (data) {
          RenderGraph(data);
        },
        error: function () {
          alert("Error getting Data");
        }
      });
    };

    function RenderGraph(JSONData) {

      var volumeChart = dc.barChart("#dc-volume-chart");

      var ndx = crossfilter(JSONData);

      var startValue = ndx.dimension(function (d) {
        return new Date(parseInt(d.Date.substr(6)));
      });
      var startValueGroup = startValue.group();
      
      volumeChart.width(800)
        .height(300)
        .dimension(startValue)
        .group(startValueGroup, "New Customers")
        .transitionDuration(1500)
        .centerBar(true)
        .gap(15)
        .round(d3.time.month.round)
        .x(d3.time.scale().domain([new Date(2012, 11, 1), new Date(2013, 12, 31)]))
        .xUnits(d3.time.months)
        .legend(dc.legend().x(680).y(0))
        .elasticY(true)
        .xAxis().tickFormat(d3.time.format("%b-%Y"));        

      dc.renderAll();
      dc.redrawAll();
    }

  </script>
</asp:Content>
