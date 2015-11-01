<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompRespondToApplicant.aspx.vb" Inherits="JobsIE.CompRespondToApplicant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Viewing an Applicant's Details</h2>
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
    <!--Application State-->
            <asp:Label ID="Label_DropDownList_ApplicationState" runat="server" AssociatedControlID="DropDownList_ApplicationState">Application State:
            <asp:DropDownList CssClass="DropDownList" ID="DropDownList_ApplicationState" runat="server">
                <asp:ListItem Value="0">To Be Read</asp:ListItem>
                <asp:ListItem Value="1">Under Review</asp:ListItem>
                <asp:ListItem Value="2">Unsuccessful</asp:ListItem>
            </asp:DropDownList>
            </asp:Label>
    </fieldset>
    <p class="submitButton">
            <asp:Button ID="ButtonUpdateApplicationState"
                runat="server"
                CausesValidation="False" 
                CommandName="UpdateApplicationState"
                onclick="ButtonUpdateApplicationState_Click"
                Text="Update"/>
        </p>
</fieldset>
</asp:Content>
