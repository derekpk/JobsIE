<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master"
     CodeBehind="UserUpdate.aspx.vb" Inherits="JobsIE.UserUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>User Update</h2>
    <h2><asp:HyperLink ID="HyperLink_Finish" runat="server" EnableViewState="false">Finished Updating</asp:HyperLink></h2>
        <p>Click the link to return to the User Services page</p>
   <fieldset class="UserUpdate">
            <!--Firstname-->
            <asp:Label ID="Label_Name" runat="server" AssociatedControlID="TextBox_Name">Name:</asp:Label>
            <asp:TextBox ID="TextBox_Name" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Name"
                runat="server"
                ControlToValidate="TextBox_Name" 
                CssClass="failureNotification"
                ToolTip="First Name is required.">Name is required.</asp:RequiredFieldValidator>
            
            <!--Buzzwords-->
            <asp:Label ID="Label_Buzzwords" runat="server" AssociatedControlID="TextBox_Buzzwords">Technology Buzzwords:</asp:Label>
            <asp:TextBox ID="TextBox_Buzzwords" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Buzzwords"
                runat="server"
                ControlToValidate="TextBox_Buzzwords" 
                CssClass="failureNotification"
                ToolTip="Enter some of your skills.">Skills are required.</asp:RequiredFieldValidator>

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
            <!--Age-->
            <asp:Label ID="Label_Age" runat="server" AssociatedControlID="TextBox_Age">Age:</asp:Label>
            <asp:TextBox ID="TextBox_Age" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Age"
                runat="server"
                ControlToValidate="TextBox_Age" 
                CssClass="failureNotification"
                ToolTip="Age is required.">Age is required.</asp:RequiredFieldValidator>
            <asp:RangeValidator
                ID="AgeRangeValidator"
                runat="server"
                ControlToValidate="TextBox_Age"
                MaximumValue="100"
                MinimumValue="0"
                Type="Integer"
                CssClass="failureNotification">Numeric between 0 and 100.</asp:RangeValidator>

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

               
        <p class="submitButton">
            <asp:Button ID="Button_UpdateUser"
                runat="server"
                CausesValidation="True" 
                CommandName="Button_UpdateUser"
                onclick="Button_UpdateUser_Click"
                Text="Update User Details"/>
        </p>
    </fieldset>    
        <asp:CompareValidator ID="ValidatorPasswordCompare" runat="server"  
                ControlToCompare="TextBox_Password" ControlToValidate="TextBox_ConfirmPassword"
                CssClass="failureNotification"><br />Passwords do not match.</asp:CompareValidator>
</asp:Content>
