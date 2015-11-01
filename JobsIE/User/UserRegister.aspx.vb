Imports System.Data.SqlClient

Class UserRegister
    '    Inherits System.Web.UI.Page
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_Cancel.NavigateUrl = "~/User/UserServices.aspx"

    End Sub

    Protected Sub UserRegistrationButton_Click(sender As Object, e As EventArgs)

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)
                Dim strTable As String = "TblUsers"
                'Do not add record if Email is already in registered 
                If IsRegistered(connection, strTable, Me.TextBox_Email.Text) = False Then
                    Dim commandUserTable As New SqlCommand
                    commandUserTable.CommandText = "INSERT INTO " & strTable & " (Name, Buzzwords, Email, Address, Phone, Age, Password, LoginDate, CV_Path) VALUES (@Name, @Buzzwords, @Email, @Address, @Phone, @Age, @Password, @LoginDate, @CV_Path)"
                    commandUserTable.Connection = connection

                    commandUserTable.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = Me.TextBox_Name.Text
                    commandUserTable.Parameters.Add("@Buzzwords", SqlDbType.NVarChar, 200).Value = Me.TextBox_Buzzwords.Text
                    commandUserTable.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = Me.TextBox_Email.Text
                    commandUserTable.Parameters.Add("@Address", SqlDbType.NVarChar, 100).Value = Me.TextBox_Address.Text
                    commandUserTable.Parameters.Add("@Phone", SqlDbType.NChar, 20).Value = Me.TextBox_Phone.Text
                    commandUserTable.Parameters.Add("@Age", SqlDbType.NChar, 10).Value = Me.TextBox_Age.Text
                    commandUserTable.Parameters.Add("@Password", SqlDbType.NChar, 20).Value = Me.TextBox_Password.Text
                    commandUserTable.Parameters.Add("@CV_Path", SqlDbType.NVarChar, 200).Value = DBNull.Value
                    commandUserTable.Parameters.Add("@LoginDate", SqlDbType.DateTime).Value = DateAndTime.Now()

                    commandUserTable.Connection.Open()
                    commandUserTable.ExecuteNonQuery()
                    commandUserTable.Connection.Close()

                    'Log the user in after registration
                    If Login(connection, strTable, Me.TextBox_Email.Text, Me.TextBox_Password.Text) = True Then
                        Response.Redirect("~/User/UserRegistrationComplete.aspx?")
                    Else
                        Response.Redirect("~/User/UserRegistrationFailed.aspx?")
                    End If
                Else
                    Me.TextBox_Email.Text = ""
                    Me.RequiredFieldValidator_Email.Text = "Email address is already registered."
                    Me.RequiredFieldValidator_Email.Validate()
                End If

            End Using
        End If
    End Sub
End Class