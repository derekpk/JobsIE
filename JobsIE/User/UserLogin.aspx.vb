Imports System.Data.SqlClient

Public Class UserLogin
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_Register.NavigateUrl = "~/User/UserRegister.aspx"
        LogOut()
    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                'Do not add record if Email is already in registered 
                If Login(connection, "TblUsers", Me.TextBox_Email.Text, Me.TextBox_Password.Text) = True Then
                    Response.Redirect("~/User/UserServices.aspx?")
                Else
                    Response.Redirect("~/User/UserLoginFailed.aspx?")
                End If

            End Using
        End If
    End Sub
End Class