Imports System.Data.SqlClient

Class CompUpdate
    Inherits MyUtilityClass
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/Company/CompServices.aspx"

        'Get the details of the currently logged in user
        'Search the DB using the email value stored in a Session variable
        If Not Page.IsPostBack() Then
            Dim strConn As String
            strConn = Session("SQLConnectionString").ToString()
            If strConn.Length > 0 Then
                Using connection As New SqlConnection(strConn)

                    Dim strEmail As String = Session("LoggedInEmail").ToString()

                    Dim cmdSearchCompanyTable As New SqlCommand()

                    cmdSearchCompanyTable.CommandText = "SELECT * FROM TblCompanies WHERE Email='" & strEmail & "'"
                    cmdSearchCompanyTable.Connection = connection
                    cmdSearchCompanyTable.Connection.Open()

                    Dim Reader As SqlDataReader
                    Reader = cmdSearchCompanyTable.ExecuteReader()

                    If Reader.Read Then
                        Me.TextBox_Name.Text = Reader.Item("Name")
                        Me.TextBox_Description.Text = Reader.Item("Description")
                        Me.TextBox_Email.Text = Reader.Item("Email")
                        Me.TextBox_Address.Text = Reader.Item("Address")
                        Me.TextBox_Phone.Text = Reader.Item("Phone")
                        Me.TextBox_Password.Text = Reader.Item("Password")
                        Me.TextBox_ConfirmPassword.Text = Reader.Item("Password")
                        Me.DropDownList_SubscriptionType.SelectedIndex = Reader.Item("SubscriptionType")
                    End If

                    cmdSearchCompanyTable.Connection.Close()

                End Using
            End If
        End If
    End Sub

    Protected Sub Button_UpdateCompany_Click(sender As Object, e As System.EventArgs) Handles Button_UpdateCompany.Click
        'If we get here then all of the fields are already
        ' validated by the form validation controls
        'Now we need to update the database with the new details
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                'get the logged in users email from the session variables
                Dim strEmail As String = Session("LoggedInEmail").ToString()

                Dim commandUpdateCompanyTable As New SqlCommand
                commandUpdateCompanyTable.CommandType = CommandType.Text
                commandUpdateCompanyTable.Connection = connection

                commandUpdateCompanyTable.CommandText = "UPDATE TblCompanies SET Name=@Name, Description=@Description, Email=@Email, Address=@Address, Phone=@Phone, Password=@Password, SubscriptionType=@SubscriptionType, PaymentDate=@PaymentDate WHERE Email=@LoggedInEmail;"

                'Get the details from the form controls
                commandUpdateCompanyTable.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = Me.TextBox_Name.Text
                commandUpdateCompanyTable.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = Me.TextBox_Email.Text
                commandUpdateCompanyTable.Parameters.Add("@Address", SqlDbType.NVarChar, 100).Value = Me.TextBox_Address.Text
                commandUpdateCompanyTable.Parameters.Add("@Description", SqlDbType.NVarChar, 200).Value = Me.TextBox_Description.Text
                commandUpdateCompanyTable.Parameters.Add("@Phone", SqlDbType.NChar, 20).Value = Me.TextBox_Phone.Text
                commandUpdateCompanyTable.Parameters.Add("@Password", SqlDbType.NChar, 20).Value = Me.TextBox_Password.Text

                commandUpdateCompanyTable.Parameters.Add("@LoggedInEmail", SqlDbType.NVarChar, 100).Value = strEmail

                Select Case DropDownList_SubscriptionType.SelectedValue
                    Case 0
                        commandUpdateCompanyTable.Parameters.Add("@SubscriptionType", SqlDbType.Int).Value = DropDownList_SubscriptionType.SelectedValue
                        commandUpdateCompanyTable.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = DBNull.Value
                        Session("CompanySubscriptionType") = Session("CompanySubscriptionNotSubscribed")
                        Session("LoggedInIsActive") = Session("Inactive")
                    Case 1
                        commandUpdateCompanyTable.Parameters.Add("@SubscriptionType", SqlDbType.Int).Value = DropDownList_SubscriptionType.SelectedValue
                        commandUpdateCompanyTable.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = Date.Now()
                        Session("CompanySubscriptionType") = Session("CompanySubscriptionStandardPlan")
                        Session("LoggedInIsActive") = Session("Active")
                    Case 2
                        commandUpdateCompanyTable.Parameters.Add("@SubscriptionType", SqlDbType.Int).Value = DropDownList_SubscriptionType.SelectedValue
                        commandUpdateCompanyTable.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = Date.Now()
                        Session("CompanySubscriptionType") = Session("CompanySubscriptionPremiumPlan")
                        Session("LoggedInIsActive") = Session("Active")
                End Select

                'preform the update on the database
                commandUpdateCompanyTable.Connection.Open()
                commandUpdateCompanyTable.ExecuteNonQuery()
                commandUpdateCompanyTable.Connection.Close()

                'reset the sessin variables
                Session("LoggedInName") = Me.TextBox_Name.Text
                Session("LoggedInEmail") = Me.TextBox_Email.Text

                Response.Redirect("~/Company/CompUpdate.aspx")

                'finished updating the Comapanies details
            End Using
        End If
    End Sub
End Class