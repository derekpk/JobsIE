<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="Main.aspx.vb" Inherits="JobsIE._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Welcome to Jobs.ie, matching you with your new job!
    </h2>
<fieldset>  
    <%If Session.Item("LoggedInRole").ToString = Session("NotLoggedIn").ToString() Then%>
            <p>You must be logged in to use the full range of services on offer.</p>
    <%Else
            Dim strName As String
            strName = ""
            Select Case Session("LoggedInRole")
                Case Session("LoggedInAsAdmin")
                    strName = Session("LoggedInAsAdmin").ToString()

                Case Session("LoggedInAsUser")
                    strName = Session("LoggedInName").ToString()

                Case Session("LoggedInAsCompany")
                    strName = Session("LoggedInName").ToString()
            End Select
            Response.Write("<p>You are currently logged in as " & strName & ", Clicking a link below will log you out!</p>")
        End If%>
        <h2><asp:HyperLink ID="HyperLink_UserLogin" runat="server" EnableViewState="false">User Login</asp:HyperLink></h2>
        <p>Click link above to login</p>
        <h4>OR</h4>
        <h2><asp:HyperLink ID="HyperLink_CompanyLogin" runat="server" EnableViewState="false">Company Login</asp:HyperLink></h2>
        <p>Click link above to login</p>
   
</fieldset>

   <asp:AdRotator
     class="JobsIEAdverts"
     ID="AdRotator_JobsIEAdverts"
     runat="server"
     DataSourceID="XmlDataSource_JobsIEAdverts" />
    <asp:XmlDataSource ID="XmlDataSource_JobsIEAdverts" runat="server" 
        DataFile="~/AdRotator/JobsIEAdverts.xml"></asp:XmlDataSource>
</asp:Content>
