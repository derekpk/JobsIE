Public Class RegistrationComplete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_UserServices.NavigateUrl = "~/User/UserServices.aspx"

    End Sub

End Class