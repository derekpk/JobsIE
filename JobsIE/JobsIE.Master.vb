Public Class JobsIE
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strName As String = Session("LoggedInName").ToString()
        Dim strDate As String = Session("LoggedInPreviousLogin").ToString()
        Dim strIsActive As String = " - Your Account is " + Session("LoggedInIsActive").ToString()

        Select Case Session("LoggedInRole")
            Case Session("LoggedInAsAdmin")

                Me.Label_LogInMessage.Text = Session("LoggedInAsAdmin").ToString()
            Case Session("LoggedInAsUser")

                Select Case Session("LoggedInIsActive")
                    Case Session("Active")
                        Me.Label_LogInMessage.CssClass = "LoginMessageActive"
                    Case Session("Inactive")
                        Me.Label_LogInMessage.CssClass = "LoginMessageInactive"
                End Select

                Me.Label_LogInMessage.Text = strName & " - your last log in was : " & strDate & strIsActive

            Case Session("LoggedInAsCompany")
                Dim strSubscriptionType As String = vbNullString
                Select Case Session("CompanySubscriptionType")
                    Case Session("CompanySubscriptionNotSubscribed")
                        Me.Label_LogInMessage.CssClass = "LoginMessageInactive"
                        strSubscriptionType = " - Your Subscription is Overdue"
                    Case Session("CompanySubscriptionStandardPlan")
                        Me.Label_LogInMessage.CssClass = "LoginMessageActive"
                        strSubscriptionType = " - You have a Standard Subscription"
                    Case Session("CompanySubscriptionPremiumPlan")
                        Me.Label_LogInMessage.CssClass = "LoginMessageActive"
                        strSubscriptionType = " - You have a Premium Subscription"

                End Select
                Me.Label_LogInMessage.Text = strName & " - your last log in was : " & strDate & strIsActive & strSubscriptionType
        End Select

    End Sub

End Class