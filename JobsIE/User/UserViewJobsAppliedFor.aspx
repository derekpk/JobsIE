<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserViewJobsAppliedFor.aspx.vb" Inherits="JobsIE.UserViewJobsAppliedFor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h1>View all job applications for <% Response.Write(Session("LoggedInName").ToString())%></h1>

    <h2><asp:HyperLink
     ID="HyperLink_Finished" 
     runat="server" 
     EnableViewState="false">Finished Searching</asp:HyperLink></h2>
        <p>Click the link above to return to User Services</p>
<fieldset class="userSearchOffers">

    <asp:GridView 
     ID="GridView_ViewAllJobsAppliedFor" 
     runat="server" 
     DataSourceID="SqlViewAllJobsAppliedFor"
     AutoGenerateColumns="False"
     CssClass="myGridStyle"
     DataKeyNames="Id"
     AllowPaging="True"
     PageSize="6">
         <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" 
                SortExpression="Title" />
            <asp:BoundField DataField="Details" HeaderText="Details" 
                SortExpression="Details" />
            <asp:BoundField DataField="ApplicationState" HeaderText="ApplicationState" 
                SortExpression="ApplicationState" />
           <asp:HyperLinkField 
                DataNavigateUrlFields="Id, UserId, CompanyId" 
                DataNavigateUrlFormatString="~/User/UserViewOneOfTheJobsYouApplied.aspx?JobOfferId={0}&UserId={1}&CompanyId={2}"
                HeaderText="More Info" 
                Text="View Details"/>
        </Columns>
    </asp:GridView>

   <asp:SqlDataSource ID="SqlViewAllJobsAppliedFor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JobsIEConnectionString %>" 
        
        SelectCommand="SELECT * FROM [TblJobOffers], [TblJobApplications] WHERE (TblJobApplications.UserId = @UserId) AND (TblJobApplications.JobOfferId = TblJobOffers.Id)">
       <SelectParameters>
           <asp:SessionParameter DefaultValue="0" Name="UserId" SessionField="LoggedInID" 
               Type="Int32" />
       </SelectParameters>
    </asp:SqlDataSource>
 </fieldset> 
    <asp:Label CssClass="LoginMessageInactive" ID="Label_InactiveMessage" runat="server"></asp:Label>

</asp:Content>
