<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="CompSearchAll.aspx.vb" Inherits="JobsIE.CompSearchAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Search All Users.</h2>
    <h2><asp:HyperLink ID="HyperLink_Finished" runat="server" EnableViewState="false">Finshed Searching</asp:HyperLink></h2>
        <p>Click the link above to return to the Company Sevices page</p>
 
<fieldset class="userSearchOffers">

    <fieldset class="leftSideContainer">
        <asp:Label ID="Label_TechnologyBuzzwords" runat="server" Text="Label">Technology Buzzwords</asp:Label>
        <asp:TextBox ID="TextBox_TechnologyBuzzwords" runat="server"></asp:TextBox>
        <p class="extraInfo">(Enter a technology buzzword in the box to search for)</p>
    </fieldset>

    <asp:GridView 
     ID="GridView_SearcAllUsers" 
     runat="server" 
     DataSourceID="SqlSearchAllUsers"
     AutoGenerateColumns="False"
     CssClass="myGridStyle"
     AllowPaging="True"
     PageSize="6">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Buzzwords" HeaderText="Buzzwords" SortExpression="Buzzwords" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:HyperLinkField 
                DataNavigateUrlFields="Id" 
                DataNavigateUrlFormatString="~/Company/CompUserViewDetails.aspx?UserId={0}"
                HeaderText="More Info" 
                Text="View Details"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlSearchAllUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JobsIEConnectionString %>" 
        
        SelectCommand="SELECT * FROM TblUsers WHERE ([Buzzwords] LIKE '%' + @TechnologyBuzzwords + '%')">
        <SelectParameters>
            <asp:ControlParameter
             ControlID="TextBox_TechnologyBuzzwords" 
             Name="TechnologyBuzzwords" 
             PropertyName="Text" 
             Type="String"
             DefaultValue="*" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p class="submitButton">
        <asp:Button 
         ID="Button_SearchAllUsers" 
         runat="server" 
         Text="Search" />
    </p>

 </fieldset> 
    <asp:Label CssClass="failureNotification" ID="Label_FailureNotificationMessage" runat="server"></asp:Label>

</asp:Content>
