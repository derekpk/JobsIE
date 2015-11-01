Imports System.Data.SqlClient

Class UserUpdate
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finish.NavigateUrl = "~/User/UserServices.aspx"
        'Get the details of the currently logged in user
        'Search the DB using the email value stored in a Session variable
        If Not Page.IsPostBack() Then
            Dim strConn As String
            strConn = Session("SQLConnectionString").ToString()
            If strConn.Length > 0 Then
                Using connection As New SqlConnection(strConn)

                    Dim strEmail As String = Session("LoggedInEmail").ToString()

                    Dim cmdSearchUserTable As New SqlCommand()

                    cmdSearchUserTable.CommandText = "SELECT * FROM TblUsers WHERE Email='" & strEmail & "'"
                    cmdSearchUserTable.Connection = connection
                    cmdSearchUserTable.Connection.Open()

                    Dim Reader As SqlDataReader
                    Reader = cmdSearchUserTable.ExecuteReader()

                    If Reader.Read Then
                        Me.TextBox_Name.Text = Reader.Item("Name")
                        Me.TextBox_Buzzwords.Text = Reader.Item("Buzzwords")
                        Me.TextBox_Email.Text = Reader.Item("Email")
                        Me.TextBox_Address.Text = Reader.Item("Address")
                        Me.TextBox_Age.Text = Reader.Item("Age")
                        Me.TextBox_Phone.Text = Reader.Item("Phone")
                        Me.TextBox_Password.Text = Reader.Item("Password")
                        Me.TextBox_ConfirmPassword.Text = Reader.Item("Password")
                    End If

                    cmdSearchUserTable.Connection.Close()

                End Using
            End If
        End If
    End Sub

    Protected Sub Button_UpdateUser_Click(sender As Object, e As System.EventArgs) Handles Button_UpdateUser.Click
        'If we get here then all of the fields are already
        ' validated by the form validation controls
        'Now we need to update the database with the new details
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                'get the logged in users email from the session variables
                Dim strEmail As String = Session("LoggedInEmail").ToString()

                Dim commandUpdateUserTable As New SqlCommand
                commandUpdateUserTable.CommandType = CommandType.Text
                commandUpdateUserTable.Connection = connection

                commandUpdateUserTable.CommandText = "UPDATE TblUsers SET Name=@Name, Buzzwords=@Buzzwords, Email=@Email, Address=@Address, Phone=@Phone, Age=@Age, Password=@Password WHERE Email=@LoggedInEmail;"

                'Get the details from the form controls
                commandUpdateUserTable.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = Me.TextBox_Name.Text
                commandUpdateUserTable.Parameters.Add("@Buzzwords", SqlDbType.NVarChar, 200).Value = Me.TextBox_Buzzwords.Text
                commandUpdateUserTable.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = Me.TextBox_Email.Text
                commandUpdateUserTable.Parameters.Add("@Address", SqlDbType.NVarChar, 100).Value = Me.TextBox_Address.Text
                commandUpdateUserTable.Parameters.Add("@Phone", SqlDbType.NChar, 20).Value = Me.TextBox_Phone.Text
                commandUpdateUserTable.Parameters.Add("@Age", SqlDbType.NChar, 10).Value = Me.TextBox_Age.Text
                commandUpdateUserTable.Parameters.Add("@Password", SqlDbType.NChar, 20).Value = Me.TextBox_Password.Text

                commandUpdateUserTable.Parameters.Add("@LoggedInEmail", SqlDbType.NVarChar, 100).Value = strEmail

                'preform the update on the database
                commandUpdateUserTable.Connection.Open()
                commandUpdateUserTable.ExecuteNonQuery()
                commandUpdateUserTable.Connection.Close()

                'reset the sessin variables
                Session("LoggedInName") = Me.TextBox_Name.Text
                Session("LoggedInEmail") = Me.TextBox_Email.Text

                'finished updating the users details
                'redirect to the user services page
                Response.Redirect("~/User/UserServices.aspx?")

            End Using
        End If
    End Sub
End Class