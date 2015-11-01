<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompUserViewDetails.aspx.vb" Inherits="JobsIE.UserViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Viewing a User's Details</h2>
    <h2><asp:HyperLink
     ID="HyperLink_Finished" 
     runat="server" 
     EnableViewState="false">Finished Viewing</asp:HyperLink></h2>
        <p>Click the link above to return to the search page</p>
<fieldset class="ViewUserDetails">        
    <fieldset class="leftSideContainer">            
        <p><asp:Label ID="Label_Name" runat="server"/></p>
        <p><asp:Label ID="Label_Buzzwords" runat="server"/></p>
        <p><asp:Label ID="Label_Email" runat="server"/></p>
        <p><asp:Label ID="Label_Address" runat="server"/></p>
    </fieldset>
    <fieldset class="rightSideContainer">
        <p><asp:Label ID="Label_Phone" runat="server"/></p>
        <p><asp:Label ID="Label_Age" runat="server"/></p>
        <p><asp:Label ID="Label_CV_Path" runat="server"/></p>
    </fieldset>
    <p class="submitButton">
        <asp:Button ID="ButtonFinishedViewing"
             runat="server"
             CommandName="FinishedViewing"
             onclick="ButtonFinishedViewing_Click"
             Text="Finished Viewing" />
    </p>       
</asp:Content>
