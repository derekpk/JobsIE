<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompJobUpdate.aspx.vb" Inherits="JobsIE.CompJobUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Update a Job Advert.</h2>
    <h2><asp:HyperLink ID="HyperLink_Finish" runat="server" EnableViewState="false">Finished Updating</asp:HyperLink></h2>
        <p>Click the link to return to the Company Services page</p>

<fieldset class="compJobUpdate">

    <asp:GridView 
     ID="GridView_CompJobUpdate" 
     runat="server" 
     DataSourceID="SqlCompJobUpdate"
     AutoGenerateColumns="False"
     CssClass="myGridStyle"
     AllowPaging="True"
     PageSize="6">
       <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:HyperLinkField 
                DataNavigateUrlFields="Id, CompanyId" 
                DataNavigateUrlFormatString="~/Company/CompUpdateOneJob.aspx?JobOfferId={0}&CompanyId={1}"
                HeaderText="Advert" 
                Text="Update"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlCompJobUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JobsIEConnectionString %>" 
        SelectCommand="SELECT * FROM [TblJobOffers] WHERE ([CompanyId] = @CompanyId)">
     <SelectParameters>
        <asp:SessionParameter
         DefaultValue="0" 
         Name="CompanyId" 
         SessionField="LoggedInID"
         Type="Int32" />
        </SelectParameters>
     </asp:SqlDataSource>

 </fieldset> 
<asp:Label CssClass="failureNotification" ID="Label_FailureNotificationMessage" runat="server"></asp:Label>

</asp:Content>
