Public Class UserViewJobsAppliedFor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/User/UserServices.aspx"


        If Session("LoggedInIsActive") = Session("Inactive") Then
            Me.Label_InactiveMessage.Text = "You must have an Active Account to use that service"
        Else

            If Not Page.IsPostBack() Then
                If Me.GridView_ViewAllJobsAppliedFor.Rows.Count = 0 Then
                    Me.Label_InactiveMessage.Text = "You don't have applications to view"
                Else
                    ChangeTheApplicationStateToTextForViewing()
                End If

            End If
        End If
    End Sub

    Private Sub ChangeTheApplicationStateToTextForViewing()
        'Reset all the hyperlinks if the Company is not Subscribed and paid in full
        For Count = 0 To Me.GridView_ViewAllJobsAppliedFor.Rows.Count - 1
            Dim tGridRow As GridViewRow

            Dim strApplicationState As String = vbNullString

            tGridRow = Me.GridView_ViewAllJobsAppliedFor.Rows(Count)
            Select Case tGridRow.Cells(2).Text
                Case "0"
                    strApplicationState = "To Be Read"
                Case "1"
                    strApplicationState = "Under Review"
                Case "2"
                    strApplicationState = "Unsuccessful"
            End Select

            If strApplicationState <> vbNullString Then
                tGridRow.Cells(2).Text = strApplicationState
            End If
        Next
    End Sub
End Class