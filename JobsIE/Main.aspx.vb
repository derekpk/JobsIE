Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_UserLogin.NavigateUrl = "~/User/UserLogin.aspx"
        HyperLink_CompanyLogin.NavigateUrl = "~/Company/CompLogin.aspx"

    End Sub
End Class