<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="LogOut.aspx.vb" Inherits="JobsIE.UserLogOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>You are now Logged Out</h2>
    <h2><asp:HyperLink ID="HyperLink_Continue" runat="server" EnableViewState="false">Continue</asp:HyperLink></h2>
        <p>Click the link above to continue</p>

</asp:Content>
