<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserSearchOffers.aspx.vb" Inherits="JobsIE.UserSearchOffers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Search Job Offer's</h2>
    <h2><asp:HyperLink
     ID="HyperLink_Finished" 
     runat="server" 
     EnableViewState="false">Finished Searching</asp:HyperLink></h2>
        <p>Click the link above to return to User Services</p>
<fieldset class="userSearchOffers">

    <fieldset class="leftSideContainer">
        <asp:Label ID="Label_Technology" runat="server" Text="Label">Technology</asp:Label>
        <asp:TextBox ID="TextBox_Technology" runat="server"></asp:TextBox>
        <p class="extraInfo">(Enter a technology in the box to search for)</p>
    </fieldset>

    <fieldset class="rightSideContainer">
        <asp:Label ID="Label_Location" runat="server" Text="Label">Location</asp:Label>
        <asp:TextBox ID="TextBox_Location" runat="server"></asp:TextBox>
        <p class="extraInfo">(Enter a location in the box to search for)</p>
    </fieldset>

    <asp:GridView 
     ID="GridView_SearcJobOffers" 
     runat="server" 
     DataSourceID="SqlSearchJobOffers"
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
                DataNavigateUrlFormatString="~/User/UserApplyForOffer.aspx?JobOfferId={0}&CompanyId={1}"
                HeaderText="More Info" 
                Text="View Details"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlSearchJobOffers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JobsIEConnectionString %>" 
        
        SelectCommand="SELECT * FROM TblJobOffers WHERE (OfferDate &gt;= GETDATE() - 31) AND (([Details] LIKE '%' + @Technology + '%') OR ([Title] LIKE '%' + @Technology + '%') OR ([Location] LIKE '%' + @Location + '%'))">
        <SelectParameters>
            <asp:ControlParameter
             ControlID="TextBox_Technology" 
             Name="Technology" 
             PropertyName="Text" 
             Type="String"
             DefaultValue="*" />
            <asp:ControlParameter
             ControlID="TextBox_Location" 
             Name="Location" 
             PropertyName="Text"
             Type="String"
             DefaultValue="*" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p class="submitButton">
        <asp:Button 
         ID="Button_SearchJobOffers" 
         runat="server" 
         Text="Search" />
    </p>

 </fieldset> 
<asp:Label CssClass="LoginMessageInactive" ID="Label_InactiveMessage" runat="server"></asp:Label>

</asp:Content>