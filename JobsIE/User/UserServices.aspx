<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserServices.aspx.vb" Inherits="JobsIE.UserServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>User Services</h2>
    <fieldset>
    <fieldset class="leftSideContainer">
        <h2>
    <asp:HyperLink
        ID="HyperLink_UpdateUserDetails"
        runat="server" 
        EnableViewState="false">Update Details</asp:HyperLink></h2>
        <p>Click link above to update your details</p>
    <h2>
    <asp:HyperLink
        ID="HyperLink_UploadCV"
        runat="server" 
        EnableViewState="false">Upload your C.V.</asp:HyperLink></h2>
        <p>Click link above to upload your C.V.</p>
    <h2>
    <asp:HyperLink
        ID="HyperLink_SearchJobOffers" 
        runat="server" 
        EnableViewState="false">Search for a Job</asp:HyperLink></h2>
        <p>Click link above to search for a Job Advert</p>
        
    </fieldset>
     <fieldset class="rightSideContainer">
         <h2>
        <asp:HyperLink
         ID="HyperLink_ViewJobsAppliedFor"
         runat="server" 
         EnableViewState="false">View my Job Applications</asp:HyperLink></h2>
            <p>Click link above to view all my job applications</p>
     </fieldset>
     </fieldset> 

</asp:Content>
