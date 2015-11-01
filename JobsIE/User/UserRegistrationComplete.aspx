<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserRegistrationComplete.aspx.vb" Inherits="JobsIE.RegistrationComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <h1>Congratulations! <% Response.Write(Session("LoggedInName").ToString())%></h1>
<h2>Your registrations in almost complete</h2>

   <h2><asp:HyperLink ID="HyperLink_UserServices" runat="server" EnableViewState="false">User Services</asp:HyperLink></h2>
    <p>Click link above to access User Services</p>
   
</asp:Content>
