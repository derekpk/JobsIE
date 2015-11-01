<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompServices.aspx.vb" Inherits="JobsIE.CompanyServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Company Services</h2>
<fieldset>
<fieldset class="leftSideContainer">
     <h2>
    <asp:HyperLink
     ID="HyperLink_UpdateCompanyDetails"
     runat="server" 
     EnableViewState="false">Update Details</asp:HyperLink></h2>
        <p>Click link above to update your details</p>
    <h2>
    <asp:HyperLink
     ID="HyperLink_UploadJobOffer"
     runat="server" 
     EnableViewState="false">Create a Job Advert</asp:HyperLink></h2>
        <p>Click link above to create a Job Advert</p>
    <h2>
    <asp:HyperLink
     ID="HyperLink_UpdateJobOffer" 
     runat="server" 
     EnableViewState="false">Update a Job Advert</asp:HyperLink></h2>
        <p>Click link above to update a Job Advert</p>
        
 </fieldset>
 <fieldset class="rightSideContainer">
     <h2>
    <asp:HyperLink
     ID="HyperLink_SearchUserDetails"
     runat="server" 
     EnableViewState="false">Search User Details</asp:HyperLink></h2>
        <p>Click link above to Search User details</p>
    <h2>
    <asp:HyperLink
     ID="HyperLink_ReviewApplicants"
     runat="server" 
     EnableViewState="false">Review Job Applicants</asp:HyperLink></h2>
        <p>Click link above to Review Applicants to your Adverts</p>
        
 </fieldset>
 </fieldset> 
</asp:Content>
