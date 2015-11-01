Public Class CompJobUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finish.NavigateUrl = "~/Company/CompServices.aspx"

        If Me.GridView_CompJobUpdate.Rows.Count = 0 Then
            Me.Label_FailureNotificationMessage.Text = "You don't have any Job Adverts to update!"
        End If
    End Sub

End Class