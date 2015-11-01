Public Class CompanyRegistrationFailed
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_ComapnyRegistration.NavigateUrl = "~/Comp/CompanyRegistration.aspx"

    End Sub

End Class