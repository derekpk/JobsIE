<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompRegistrationComplete.aspx.vb" Inherits="JobsIE.CompRegistrationComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <h1>Congratulations! <% Response.Write(Session("LoggedInName").ToString())%></h1>
<h2>Your registration in complete</h2>

   <h2><asp:HyperLink ID="HyperLink_CompanyServices" runat="server" EnableViewState="false">Company Services</asp:HyperLink></h2>
    <p>Click link above to access Company Services</p>

</asp:Content>
