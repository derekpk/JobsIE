Public Class UserLoginFailed
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_UserLogin.NavigateUrl = "~/User/UserLogin.aspx"
    End Sub

End Class