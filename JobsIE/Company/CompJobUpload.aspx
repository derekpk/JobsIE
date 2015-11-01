<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompJobUpload.aspx.vb" Inherits="JobsIE.CompJobUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Upload a Job Advert.</h2>
    <h2><asp:HyperLink ID="HyperLink_Cancel" runat="server" EnableViewState="false">Cancel</asp:HyperLink></h2>
        <p>Click the link above to return to the Company Services page</p>
    <fieldset class="register">
            <!--Title-->
            <asp:Label ID="Label_Title" runat="server" AssociatedControlID="TextBox_Title">Title:</asp:Label>
            <asp:TextBox ID="TextBox_Title" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Title"
                runat="server"
                ControlToValidate="TextBox_Title" 
                CssClass="failureNotification"
                ToolTip="Title is required.">Offer title is required.</asp:RequiredFieldValidator>

            <!--Details-->
            <asp:Label ID="Label_Details" runat="server" AssociatedControlID="TextBox_Details">Details:</asp:Label>
            <asp:TextBox ID="TextBox_Details" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Details"
                runat="server"
                ControlToValidate="TextBox_Details" 
                CssClass="failureNotification"
                ToolTip="Details is required.">Details are required.</asp:RequiredFieldValidator>

            <!--Location-->
            <asp:Label ID="Label_Location" runat="server" AssociatedControlID="TextBox_Location">Location:</asp:Label>
            <asp:TextBox ID="TextBox_Location" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Location"
                runat="server"
                ControlToValidate="TextBox_Location" 
                CssClass="failureNotification"
                ToolTip="Location is required.">Location is required.</asp:RequiredFieldValidator>
            
            <!--Salary-->
            <asp:Label ID="Label_Salary" runat="server" AssociatedControlID="TextBox_Salary">Salary:</asp:Label>
            <asp:TextBox ID="TextBox_Salary" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Salary"
                runat="server"
                ControlToValidate="TextBox_Salary" 
                CssClass="failureNotification"
                ToolTip="Salary is required.">Salary is required.</asp:RequiredFieldValidator>
            
            <!--Benefits-->
            <asp:Label ID="Label_Benefits" runat="server" AssociatedControlID="TextBox_Benefits">Benefits:</asp:Label>
            <asp:TextBox ID="TextBox_Benefits" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Benefits"
                runat="server"
                ControlToValidate="TextBox_Benefits" 
                CssClass="failureNotification"
                ToolTip="Benefits are required.">Offer Benefits are required.</asp:RequiredFieldValidator>
            
            <!--Hours-->
            <asp:Label ID="Label_Hours" runat="server" AssociatedControlID="TextBox_Hours">Hours per week:</asp:Label>
            <asp:TextBox ID="TextBox_Hours" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Hours"
                runat="server"
                ControlToValidate="TextBox_hours" 
                CssClass="failureNotification"
                ToolTip="Hours are required.">Hours per week is required.</asp:RequiredFieldValidator>
            
        <p class="submitButton">
            <asp:Button ID="ButtonUploadJobOffer"
                runat="server"
                CausesValidation="True" 
                CommandName="UploadJobOffer"
                onclick="ButtonUploadJobOffer_Click"
                Text="Add Job Offer"/>
        </p>
        <p class="extraInfo">(Job advert's are only Active for 1 month from date of uploading)</p>
    </fieldset>
<asp:Label CssClass="LoginMessageInactive" ID="Label_InactiveMessage" runat="server"></asp:Label>      
 </asp:Content>
