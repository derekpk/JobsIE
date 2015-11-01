<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompUpdateOneJob.aspx.vb" Inherits="JobsIE.CompUpdateOneJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Update this Job Advert.</h2>
    <h2><asp:HyperLink ID="HyperLink_Finish" runat="server" EnableViewState="false">Finished Updating</asp:HyperLink></h2>
        <p>Click the link above when finished updating</p>


<fieldset class="UpdateAJobOffer">
 <!--Company Name-->
 <p class="CompanyName"><asp:Label ID="Label_CompanyName" runat="server"></asp:Label></p>           
   <fieldset class="leftSideContainerForDate">
            <!--Title-->
            <asp:Label ID="Label_Title" runat="server" AssociatedControlID="TextBox_Title">Title:</asp:Label>
            <asp:TextBox ID="TextBox_Title" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Title"
                runat="server"
                ControlToValidate="TextBox_Title" 
                CssClass="failureNotification"
                ToolTip="Title is required.">Title is required.</asp:RequiredFieldValidator>
            
            <!--Details-->
            <asp:Label ID="Label_Details" runat="server" AssociatedControlID="TextBox_Details">Details:</asp:Label>
            <asp:TextBox ID="TextBox_Details" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Details"
                runat="server"
                ControlToValidate="TextBox_Details" 
                CssClass="failureNotification"
                ToolTip="Details are required.">Details are required.</asp:RequiredFieldValidator>

            <!--Location-->
            <asp:Label ID="Label_Location" runat="server" AssociatedControlID="TextBox_Location">Location:</asp:Label>
            <asp:TextBox ID="TextBox_Location" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Location"
                runat="server"
                ControlToValidate="TextBox_Location" 
                CssClass="failureNotification"
                ToolTip="Email is required.">A Location is required.</asp:RequiredFieldValidator>
            
            <!--Salary-->
            <asp:Label ID="Label_Salary" runat="server" AssociatedControlID="TextBox_Salary">Salary:</asp:Label>
            <asp:TextBox ID="TextBox_Salary" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Salary"
                runat="server"
                ControlToValidate="TextBox_Salary" 
                CssClass="failureNotification"
                ToolTip="Salary is required.">You must enter a value.</asp:RequiredFieldValidator>
            
            <!--Benefits-->
            <asp:Label ID="Label_Benefits" runat="server" AssociatedControlID="TextBox_Benefits">Benefits:</asp:Label>
            <asp:TextBox ID="TextBox_Benefits" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Benefits"
                runat="server"
                ControlToValidate="TextBox_Benefits" 
                CssClass="failureNotification"
                ToolTip="Benefits are required.">You must enter a value.</asp:RequiredFieldValidator>

            <!--Hours-->
            <asp:Label ID="Label_Hours" runat="server" AssociatedControlID="TextBox_Hours">Hours:</asp:Label>
            <asp:TextBox ID="TextBox_Hours" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator_Hours"
                runat="server"
                ControlToValidate="TextBox_Hours" 
                CssClass="failureNotification"
                ToolTip="Hours are required.">You must enter a value.</asp:RequiredFieldValidator>

            <!--Offer Start Date-->
            <asp:Label ID="Label_StartDate" runat="server" AssociatedControlID="TextBox_StartDate">Advert Start Date:</asp:Label>
            <asp:TextBox ReadOnly="true" ID="TextBox_StartDate" runat="server" CssClass="textEntry"></asp:TextBox>
            <p class="extraInfo">To renew the advert click the renew button</p>
       
    </fieldset>    
    <fieldset class="rightSideContainerForDate">
            <asp:ScriptManager ID="ScriptManager_OfferCountdown" runat="server"></asp:ScriptManager>
            <asp:Timer ID="Timer_OfferCountdown" OnTick="Timer_OfferCountdown_Tick" runat="server" Interval="1000" />
            <asp:UpdatePanel ID="UpdatePanel_OfferCountdownTitle" runat="server" UpdateMode="Conditional">
            <Triggers><asp:AsyncPostBackTrigger ControlID="Timer_OfferCountdown" /></Triggers>
            <ContentTemplate>
                <p class="OfferCountdownTitle"><asp:Label id="Label_OfferCountdownTitle" runat="server"></asp:Label></p>
                <p class="OfferCountdown"><asp:Label CssClass="OfferCountdownInit" id="Label_OfferCountdown" runat="server">00:00:00</asp:Label></p>
                <p class="TextUnderCountdown">Hours : Minutes : Seconds</p>  
            </ContentTemplate>
            </asp:UpdatePanel>
    </fieldset>   
   
    <p class="submitButton">
        <asp:Button ID="ButtonUpdateJobOffer"
             runat="server"
             CommandName="Update"
             onclick="ButtonUpdateJobOffer_Click"
             Text="Update"
             ValidationGroup="UpdateJobOfferValidationGroup" />
    </p>
    <p class="submitButton">
        <asp:Button ID="ButtonRenewJobOffer"
             runat="server"
             CommandName="Renew"
             onclick="ButtonRenewJobOffer_Click"
             Text="Renew" />
    </p>
 </fieldset>   
 <asp:Label CssClass="LoginMessageInactive" ID="Label_InactiveMessage" runat="server"></asp:Label>

</asp:Content>
