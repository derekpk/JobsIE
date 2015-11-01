Public Class UserLogOut
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_Continue.NavigateUrl = "~/Main.aspx"
        LogOut()
    End Sub

End Class