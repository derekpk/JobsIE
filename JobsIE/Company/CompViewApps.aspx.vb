Public Class CompViewApps
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
            If Session("CompanySubscriptionType") = Session("CompanySubscriptionPremiumPlan") Or
                Session("CompanySubscriptionType") = Session("CompanySubscriptionStandardPlan") Then

                If Me.GridView_CompanyViewApplicants.Rows.Count = 0 Then
                    Me.Label_FailureNotificationMessage.Text = "You don't have applicants to review"
                Else
                    ChangeTheApplicationStateToTextForViewing()
                End If

            Else
                If Me.GridView_CompanyViewApplicants.Rows.Count >= 0 Then
                    ChangeTheApplicationStateToTextForViewing()
                End If
                ResetTheGridViewTheHyperLinks()
                Me.Label_FailureNotificationMessage.Text = "You must have an upto date Subscription to view applicants"
            End If
        End If
    End Sub

    Private Sub ResetTheGridViewTheHyperLinks()
        'Reset all the hyperlinks if the Company is not Subscribed and paid in full
        For Count = 0 To Me.GridView_CompanyViewApplicants.Rows.Count - 1
            Dim hlinkField As HyperLink
            Dim tGridRow As GridViewRow

            tGridRow = Me.GridView_CompanyViewApplicants.Rows(Count)
            hlinkField = tGridRow.Cells(3).Controls(0)
            hlinkField.NavigateUrl = ""
        Next

    End Sub

    Private Sub ChangeTheApplicationStateToTextForViewing()
        'Reset all the hyperlinks if the Company is not Subscribed and paid in full
        For Count = 0 To Me.GridView_CompanyViewApplicants.Rows.Count - 1
            Dim tGridRow As GridViewRow

            Dim strApplicationState As String = vbNullString

            tGridRow = Me.GridView_CompanyViewApplicants.Rows(Count)
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