Imports System.Data.SqlClient

Public Class CompanyLogin
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_Register.NavigateUrl = "~/Company/CompRegister.aspx"
        LogOut()
    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                'Do not add record if Email is already in registered 
                If Login(connection, "TblCompanies", Me.TextBox_Email.Text, Me.TextBox_Password.Text) = True Then
                    Response.Redirect("~/Company/CompServices.aspx?")
                Else
                    Response.Redirect("~/Company/CompLoginFailed.aspx?")
                End If

            End Using
        End If
    End Sub
End Class