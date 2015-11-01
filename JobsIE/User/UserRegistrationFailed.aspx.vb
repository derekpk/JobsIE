Public Class UserRegistrationFailed
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_UserRegistration.NavigateUrl = "~/User/UserRegistration.aspx"
    End Sub

End Class