Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started

        'Create the main Login types
        'The site will generate the menus based on the value of these session variables
        Session.Add("LoggedInAsAdmin", "Admin")
        Session.Add("LoggedInAsUser", "User")
        Session.Add("LoggedInAsCompany", "Company")
        Session.Add("NotLoggedIn", "NotLoggedIn")
        Session.Add("Active", "Active")
        Session.Add("Inactive", "Inactive")

        'This value should only be set to "User" or "Company" or "Admin"
        'depanding on the user that logs in
        'The site will generate the menus based on the value of this session variables
        Session.Add("LoggedInRole", Session("NotLoggedIn"))

        'Session Variables needed for currently logged client
        Session.Add("LoggedInID", "")
        Session.Add("LoggedInName", "")
        Session.Add("LoggedInEmail", "")
        Session.Add("LoggedInIsActive", Session("Inactive"))
        Session.Add("LoggedInPreviousLogin", "")

        Session.Add("SQLConnectionString", ConfigurationManager.ConnectionStrings("JobsIEConnectionString").ConnectionString.ToString())

        '-----------------------------------------
        'We need some variables for specific users
        '-----------------------------------------
        'Variables specific to Users
        Session.Add("UserSearchOffersTechnology", "")
        Session.Add("UserSearchOffersLocation", "")

        'Variables specific to Companies
        Session.Add("CompanySubscriptionNotSubscribed", "0")
        Session.Add("CompanySubscriptionStandardPlan", "1")
        Session.Add("CompanySubscriptionPremiumPlan", "2")

        Session.Add("CompanySubscriptionType", Session("CompanySubscriptionNotSubscribed"))
        Session.Add("CompanySearchAllUsers", "")
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends

        'Just incase remove all session variables
        Session.RemoveAll()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
        'Just incase remove all session variables
        Session.RemoveAll()
    End Sub

End Class