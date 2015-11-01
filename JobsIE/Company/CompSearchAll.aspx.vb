Public Class CompSearchAll
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        If Session("LoggedInRole") = Session("LoggedInAsUser") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/Company/CompServices.aspx"

        If Session("LoggedInRole") = Session("LoggedInAsCompany") Then
            If Session("CompanySubscriptionType") = Session("CompanySubscriptionPremiumPlan") Then

                If Not Page.IsPostBack() Then
                    TextBox_TechnologyBuzzwords.Text = Session("CompanySearchAllUsers")
                End If
            Else
                Me.Button_SearchAllUsers.Enabled = False
                Me.TextBox_TechnologyBuzzwords.Enabled = False
                Me.Label_FailureNotificationMessage.Text = "Premium Subscription required to search all Users"
            End If
        End If
    End Sub

    Private Sub CompSearchAll_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
        Session("CompanySearchAllUsers") = TextBox_TechnologyBuzzwords.Text
    End Sub
End Class