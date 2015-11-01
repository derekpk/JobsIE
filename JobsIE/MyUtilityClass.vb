Imports System.Data.SqlClient

Public Class MyUtilityClass
    Inherits System.Web.UI.Page

    Protected Function IsRegistered(ByRef connection, ByVal strTable, ByVal strEmail) As Boolean

        Dim cmdSearchUserTable As New SqlCommand()
        cmdSearchUserTable.CommandText = "SELECT Email FROM " & strTable & " WHERE Email='" & strEmail & "'"
        cmdSearchUserTable.Connection = connection

        cmdSearchUserTable.Connection.Open()

        Dim Reader As SqlDataReader
        Reader = cmdSearchUserTable.ExecuteReader()

        Dim strRegisteredEmail As String = vbNullString

        If Reader.Read Then
            strRegisteredEmail = Reader.Item("Email")
        End If
        cmdSearchUserTable.Connection.Close()

        If strRegisteredEmail = vbNullString Then
            IsRegistered = False
        Else
            IsRegistered = True
        End If

    End Function

    Protected Function Login(ByRef connection, ByVal strTable, ByVal strEmail, ByVal strPassword) As Boolean

        Dim cmdSearchUserTable As New SqlCommand()
        cmdSearchUserTable.CommandText = "SELECT * FROM " & strTable & " WHERE Email='" & strEmail & "' AND Password='" & strPassword & "'"
        cmdSearchUserTable.Connection = connection

        cmdSearchUserTable.Connection.Open()

        Dim Reader As SqlDataReader
        Reader = cmdSearchUserTable.ExecuteReader()

        If Reader.Read Then
            LogOut()
            Select strTable
                Case "TblUsers"
                    UpdateUserSessionVariables(strTable, Reader)

                Case "TblCompanies"
                    UpdateCompanySessionVariables(strTable, Reader)
            End Select

            Login = True
        Else
            Login = False
        End If

        cmdSearchUserTable.Connection.Close()

    End Function

    Private Sub UpdateUserSessionVariables(ByVal strTable As String, ByRef Reader As SqlDataReader)

        Session("LoggedInID") = Reader.Item("Id")
        Session("LoggedInName") = Reader.Item("Name")
        Session("LoggedInEmail") = Reader.Item("Email")
        If Reader.Item("CV_Path").ToString() = DBNull.Value.ToString() Then
            Session("LoggedInIsActive") = Session("Inactive")
        Else
            Session("LoggedInIsActive") = Session("Active")
        End If
        Session("LoggedInPreviousLogin") = Reader.Item("LoginDate")

        'Update the database with the current login time and date
        UpdateLoginDateAndTime(strTable, Session("LoggedInEmail").ToString())

        Session("LoggedInRole") = Session("LoggedInAsUser").ToString()

    End Sub

    Private Sub UpdateCompanySessionVariables(ByVal strTable As String, ByRef Reader As SqlDataReader)

        Session("LoggedInID") = Reader.Item("Id")
        Session("LoggedInName") = Reader.Item("Name")
        Session("LoggedInEmail") = Reader.Item("Email")
        Session("LoggedInPreviousLogin") = Reader.Item("LoginDate")


        Select Case Reader.Item("SubscriptionType")
            Case 0
                Session("CompanySubscriptionType") = Session("CompanySubscriptionNotSubscribed")
                Session("LoggedInIsActive") = Session("Inactive")
            Case 1
                Session("CompanySubscriptionType") = Session("CompanySubscriptionStandardPlan")
                Session("LoggedInIsActive") = Session("Active")
            Case 2
                Session("CompanySubscriptionType") = Session("CompanySubscriptionPremiumPlan")
                Session("LoggedInIsActive") = Session("Active")
        End Select

        'Update the database with the current login time and date
        UpdateLoginDateAndTime(strTable, Session("LoggedInEmail").ToString())

        Session("LoggedInRole") = Session("LoggedInAsCompany").ToString()

    End Sub

    Protected Sub LogOut()

        'All I have to do here is reset all the session variables
        'that is enough to log out who ever is logged in
        Select Case Session("LoggedInRole")
            'Reset the Admin session variables
            Case Session("LoggedInAsAdmin")

                'Reset the User session variables
            Case Session("LoggedInAsUser")
                ResetSessionVariablesOnLogOut()
                Session("UserSearchOffersLocation") = ""
                Session("UserSearchOffersTechnology") = ""

                'Reset the Company session variables

            Case Session("LoggedInAsCompany")
                ResetSessionVariablesOnLogOut()
                Session("CompanySearchAllUsers") = ""
                Session("CompanySubscriptionType") = Session("CompanySubscriptionNotSubscribed")
        End Select
    End Sub

    Protected Sub ResetSessionVariablesOnLogOut()
        If Session("LoggedInName").ToString().Length() > 0 Then
            Session("LoggedInID") = ""
            Session("LoggedInName") = ""
            Session("LoggedInEmail") = ""
            Session("LoggedInIsActive") = Session("Inactive")
            Session("LoggedInPreviousLogin") = ""
            Session("LoggedInRole") = Session("NotLoggedIn")
        End If
    End Sub

    Protected Sub UpdateLoginDateAndTime(ByVal strTable, ByVal strEmail)
        'Now we need to update the database with the latest login date
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim commandUpdateTable As New SqlCommand
                commandUpdateTable.CommandType = CommandType.Text
                commandUpdateTable.Connection = connection

                commandUpdateTable.CommandText = "UPDATE " & strTable & " SET LoginDate=@LoginDate WHERE Email=@LoggedInEmail;"

                commandUpdateTable.Parameters.Add("@LoginDate", SqlDbType.DateTime).Value = DateAndTime.Now()
                commandUpdateTable.Parameters.Add("@LoggedInEmail", SqlDbType.NVarChar, 100).Value = strEmail

                'preform the update on the database
                commandUpdateTable.Connection.Open()
                commandUpdateTable.ExecuteNonQuery()
                commandUpdateTable.Connection.Close()
            End Using
        End If
    End Sub

    Protected Function myGetDate() As String
        Dim strDate As String
        strDate = Now.Date.Day.ToString() & "/" & Now.Date.Month.ToString() & "/" & Now.Date.Year.ToString()
        myGetDate = strDate
    End Function

End Class
