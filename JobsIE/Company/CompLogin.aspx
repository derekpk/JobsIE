<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompLogin.aspx.vb" Inherits="JobsIE.CompanyLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Company Log In
    </h2>
    <p>
        Please enter your Email Address and Password. - OR -  
        <asp:HyperLink ID="HyperLink_Register" runat="server" EnableViewState="false">Register</asp:HyperLink>
        if you don&#39;t have an account.
    </p>

    <div class="accountInfo">
        <fieldset class="login">
            <legend>Account Information</legend>
            <p>
                <asp:Label ID="Label_Email" runat="server" AssociatedControlID="TextBox_Email">Email Address:</asp:Label>
                <asp:TextBox ID="TextBox_Email" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:RequiredFieldValidator
                 ID="EmailRequired"
                 runat="server"
                 ControlToValidate="TextBox_Email"
                 CssClass="failureNotification"
                 ErrorMessage="Email Address is required."
                 ToolTip="Email Address is required."
                 ValidationGroup="LoginCompanyValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label_Password" runat="server" AssociatedControlID="TextBox_Password">Password:</asp:Label>
                <asp:TextBox ID="TextBox_Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                 ID="PasswordRequired"
                 runat="server"
                 ControlToValidate="TextBox_Password"
                 CssClass="failureNotification"
                 ErrorMessage="Password is required."
                 ToolTip="Password is required."
                 ValidationGroup="LoginCompanyValidationGroup">*</asp:RequiredFieldValidator>
            </p>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="LoginButton"
             runat="server"
             CommandName="Login"
             onclick="LoginButton_Click"
             Text="Log In"
             ValidationGroup="LoginCompanyValidationGroup" />
        </p>
    </div>
    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" ValidationGroup="LoginCompanyValidationGroup" />
</asp:Content>
