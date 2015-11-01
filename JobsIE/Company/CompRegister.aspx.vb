Imports System.Data.SqlClient

Class CompRegister
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink_Cancel.NavigateUrl = "~/Company/CompServices.aspx"

    End Sub

    Protected Sub CompRegistrationButton_Click(sender As Object, e As EventArgs)

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)
                Dim strTable As String = "TblCompanies"
                'Do not add record if Email is already registered 
                If IsRegistered(connection, strTable, Me.TextBox_Email.Text) = False Then
                    Dim commandUserTable As New SqlCommand
                    commandUserTable.CommandText = "INSERT INTO " & strTable & " (Name, Email, Address, Description, Phone, Password, LoginDate, SubscriptionType, PaymentDate) VALUES (@Name, @Email, @Address, @Description, @Phone, @Password, @LoginDate, @SubscriptionType, @PaymentDate)"
                    commandUserTable.Connection = connection

                    commandUserTable.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = Me.TextBox_Name.Text
                    commandUserTable.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = Me.TextBox_Email.Text
                    commandUserTable.Parameters.Add("@Address", SqlDbType.NVarChar, 100).Value = Me.TextBox_Address.Text
                    commandUserTable.Parameters.Add("@Description", SqlDbType.NVarChar, 200).Value = Me.TextBox_Description.Text
                    commandUserTable.Parameters.Add("@Phone", SqlDbType.NChar, 20).Value = Me.TextBox_Phone.Text
                    commandUserTable.Parameters.Add("@Password", SqlDbType.NChar, 20).Value = Me.TextBox_Password.Text
                    commandUserTable.Parameters.Add("@LoginDate", SqlDbType.DateTime).Value = DateAndTime.Now()

                    commandUserTable.Parameters.Add("@SubscriptionType", SqlDbType.Int).Value = DropDownList_SubscriptionType.SelectedValue
                    commandUserTable.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = Date.Now()

                    commandUserTable.Connection.Open()
                    commandUserTable.ExecuteNonQuery()
                    commandUserTable.Connection.Close()

                    'Log the user in after registration
                    If Login(connection, strTable, Me.TextBox_Email.Text, Me.TextBox_Password.Text) = True Then
                        Response.Redirect("~/Company/CompRegistrationComplete.aspx?")
                    Else
                        Response.Redirect("~/Company/CompanyRegistrationFailed.aspx?")
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