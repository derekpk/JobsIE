<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserApplyForOffer.aspx.vb" Inherits="JobsIE.UserApplyForOffer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Apply to this Job Offer</h2>
    <h2><asp:HyperLink
     ID="HyperLink_Finished" 
     runat="server" 
     EnableViewState="false">Finished Viewing</asp:HyperLink></h2>
        <p>Click the link above to return to the search page</p>
        <p class="CompanyName"><asp:Label ID="Label_CompanyName" runat="server"/></p>
<fieldset class="ShowJobOffer">        
<fieldset class="leftSideContainer">            
            <p><asp:Label ID="Label_Location" runat="server"/></p>
            <p><asp:Label ID="Label_Title" runat="server"/></p>
            <p><asp:Label ID="Label_Details" runat="server"/></p>
            <p><asp:Label ID="Label_Salary" runat="server"/></p>
</fieldset>
<fieldset class="rightSideContainer">
               <p><asp:Label ID="Label_Benefits" runat="server"/></p>
            <p><asp:Label ID="Label_Hours" runat="server"/></p>
            <p><asp:Label ID="Label_OfferDate" runat="server"/></p>
</fieldset>
 <p class="submitButton">
        <asp:Button ID="UserApplyForOfferButton"
             runat="server"
             CommandName="UserApplyForOffer"
             onclick="UserApplyForOfferButton_Click"
             Text="Apply" />
             
    </p>   
</fieldset>
<asp:Label CssClass="failureNotification" ID="Label_FailureNotificationMessage" runat="server"></asp:Label>
        
</asp:Content>
