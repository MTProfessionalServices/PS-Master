﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls_ReportParams" CodeFile="ReportParams.ascx.cs" %>
<asp:Localize meta:resourcekey="ShowingResultsFor" runat="server">Showing results for</asp:Localize> <%=StartDate.ToShortDateString() %> <asp:Localize meta:resourcekey="Through" runat="server">through</asp:Localize> <%=EndDate.ToShortDateString() %>