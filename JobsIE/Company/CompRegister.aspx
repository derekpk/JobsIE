<%@ Page Title="Register Company Details" Language="vb" MasterPageFile="~/JobsIE.Master" AutoEventWireup="false" 
    CodeBehind="CompRegister.aspx.vb" Inherits="JobsIE.CompRegister" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Company Account</h2>
    <h2><asp:HyperLink ID="HyperLink_Cancel" runat="server" EnableViewState="false">Cancel</asp:HyperLink></h2>
        <p>Click the link above to cancel</p>
    <fieldset class="register">
            <!--Name-->
            <asp:Label ID="Label_Name" runat="server" AssociatedControlID="TextBox_Name">Name:</asp:Label>
            <asp:TextBox ID="TextBox_Name" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Name"
                runat="server"
                ControlToValidate="TextBox_Name" 
                CssClass="failureNotification"
                ToolTip="First Name is required.">Name is required.</asp:RequiredFieldValidator>

            <!--Description-->
            <asp:Label ID="Label_Description" runat="server" AssociatedControlID="TextBox_Description">Description:</asp:Label>
            <asp:TextBox ID="TextBox_Description" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Description"
                runat="server"
                ControlToValidate="TextBox_Description" 
                CssClass="failureNotification"
                ToolTip="First Name is required.">Description is required.</asp:RequiredFieldValidator>
            
            <!--Email-->
            <asp:Label ID="Label_Email" runat="server" AssociatedControlID="TextBox_Email">Email:</asp:Label>
            <asp:TextBox ID="TextBox_Email" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Email"
                runat="server"
                ControlToValidate="TextBox_Email" 
                CssClass="failureNotification"
                ToolTip="Email is required.">Email is required.</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                ID="RegularExpressionValidator_Email"
                runat="server"
                ControlToValidate="TextBox_Email"
                CssClass="failureNotification"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">You must enter a valid email address.</asp:RegularExpressionValidator>
            
            <!--Address-->
            <asp:Label ID="Label_Address" runat="server" AssociatedControlID="TextBox_Address">Address:</asp:Label>
            <asp:TextBox ID="TextBox_Address" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Address"
                runat="server"
                ControlToValidate="TextBox_Address" 
                CssClass="failureNotification"
                ToolTip="Address is required.">Address is required.</asp:RequiredFieldValidator>
            
            <!--Phone-->
            <asp:Label ID="Label_Phone" runat="server" AssociatedControlID="TextBox_Phone">Phone:</asp:Label>
            <asp:TextBox ID="TextBox_Phone" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Phone"
                runat="server"
                ControlToValidate="TextBox_Phone" 
                CssClass="failureNotification"
                ToolTip="Phone is required.">Phone is required.</asp:RequiredFieldValidator>
            <asp:RangeValidator
                ID="RangeValidator_Phone"
                runat="server"
                ControlToValidate="TextBox_Phone"
                MaximumValue="9999999999"
                MinimumValue="0"
                Type="Double"
                CssClass="failureNotification">Numeric between 0 and 9999999999.</asp:RangeValidator>

            <!--Password-->
            <asp:Label ID="Label_Password" runat="server" AssociatedControlID="TextBox_Password">Password:</asp:Label>
            <asp:TextBox ID="TextBox_Password" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Password"
                runat="server"
                ControlToValidate="TextBox_Password" 
                CssClass="failureNotification"
                ToolTip="Password is required.">Password is required.</asp:RequiredFieldValidator>
            
            <!--Confirm Password-->
            <asp:Label ID="Label_ConfirmPassword" runat="server" AssociatedControlID="TextBox_ConfirmPassword">Confirm Password:</asp:Label>
            <asp:TextBox ID="TextBox_ConfirmPassword" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_ConfirmPassword"
                runat="server"
                ControlToValidate="TextBox_ConfirmPassword" 
                CssClass="failureNotification"
                ToolTip="Confirmation of Password is required.">Confirmation of Password is required.</asp:RequiredFieldValidator>

            <!--Subscription Type-->
            <asp:Label ID="Label_SubscriptionType" runat="server" AssociatedControlID="DropDownList_SubscriptionType">Subscription Type:</asp:Label>
            <asp:DropDownList CssClass="DropDownList" ID="DropDownList_SubscriptionType" runat="server">
                <asp:ListItem Value="0">Not Subscribed</asp:ListItem>
                <asp:ListItem Value="1">Standard Plan</asp:ListItem>
                <asp:ListItem Value="2">Premium Plan</asp:ListItem>
            </asp:DropDownList>
        
            <asp:CompareValidator ID="ValidatorPasswordCompare" runat="server"  
                ControlToCompare="TextBox_Password" ControlToValidate="TextBox_ConfirmPassword"
                CssClass="failureNotification"><br />Passwords do not match.</asp:CompareValidator>
            
        <p class="submitButton">
            <asp:Button ID="AddCompanyButton"
                runat="server"
                CausesValidation="True" 
                CommandName="AddCompany"
                onclick="CompRegistrationButton_Click"
                Text="Add Company"/>
        </p>
    </fieldset>    

</asp:Content>
