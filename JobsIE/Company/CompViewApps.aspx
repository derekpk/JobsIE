<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompViewApps.aspx.vb" Inherits="JobsIE.CompViewApps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Review All Applicants.</h2>
    <h2><asp:HyperLink ID="HyperLink_Finished" runat="server" EnableViewState="false">Finshed Searching</asp:HyperLink></h2>
        <p>Click the link above to return to the Company Sevices page</p>
<fieldset class="userSearchOffers">

    <asp:GridView 
     ID="GridView_CompanyViewApplicants" 
     runat="server" 
     DataSourceID="SqlCompanyViewApplicants"
     AutoGenerateColumns="False"
     CssClass="myGridStyle"
     DataKeyNames="Id"
     AllowPaging="True"
     PageSize="6">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Offer Title" 
                SortExpression="Title" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="ApplicationState" HeaderText="ApplicationState" 
                SortExpression="ApplicationState" />
            <asp:HyperLinkField 
                DataNavigateUrlFields="UserId, ApplicationState, Id, CompanyId" 
                DataNavigateUrlFormatString="~/Company/CompRespondToApplicant.aspx?UserId={0}&ApplicationState={1}&ApplicationId={2}&CompanyId={3}"
                HeaderText="Applicant Details" 
                Text="View"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlCompanyViewApplicants" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JobsIEConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM [TblJobApplications], [TblUsers], [TblJobOffers] WHERE (TblJobOffers.CompanyId = @CompanyId) AND (TblJobApplications.UserId = TblUsers.Id) AND (TblJobApplications.JobOfferId = TblJobOffers.Id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="CompanyId" 
                SessionField="LoggedInID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
 </fieldset> 
    <asp:Label CssClass="failureNotification" ID="Label_FailureNotificationMessage" runat="server"></asp:Label>

 </asp:Content>
