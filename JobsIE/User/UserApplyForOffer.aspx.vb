Imports System.Data.SqlClient

Public Class UserApplyForOffer
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        If Session("LoggedInIsActive") = Session("Inactive") Then
            Response.Redirect("~/Main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/User/UserSearchOffers.aspx"

        If Not Page.IsPostBack() Then
            'Load the job advert into the page

            If LoadJobAdvertIntoWebPage() = True Then
                If AlreadyAppliedForThisJob() = True Then
                    Me.Label_FailureNotificationMessage.Text = "Your have already applied to this Job Advert"
                    Me.UserApplyForOfferButton.Enabled = False
                Else

                End If
            Else
                Me.Label_FailureNotificationMessage.Text = "Problem loading Job Advert"
            End If
        End If
    End Sub

    Protected Sub UserApplyForOfferButton_Click(sender As Object, e As System.EventArgs) Handles UserApplyForOfferButton.Click

        If ApplyForThisJob() = True Then
            Me.Label_FailureNotificationMessage.Text = "Your applcation has been noted"
        Else
            Me.Label_FailureNotificationMessage.Text = "There is a problem with your account"
        End If

    End Sub

    Private Function LoadJobAdvertIntoWebPage() As Boolean

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
                Dim strCompanyId As String = Me.Request.QueryString("CompanyId").ToString()

                If strJobOfferId.Length > 0 And strJobOfferId.Length > 0 Then
                    Dim cmdSearchCompanyTable As New SqlCommand()
                    cmdSearchCompanyTable.CommandText = "SELECT Name, Title, Details, Location, OfferDate, Salary, Benefits, Hours FROM TblJobOffers, TblCompanies WHERE (TblJobOffers.Id = " & strJobOfferId.ToString() & ") AND (TblCompanies.Id = " & strCompanyId.ToString() & ")"

                    cmdSearchCompanyTable.Connection = connection
                    cmdSearchCompanyTable.Connection.Open()

                    Dim Reader As SqlDataReader
                    Reader = cmdSearchCompanyTable.ExecuteReader()

                    If Reader.Read Then
                        Me.Label_CompanyName.Text = "Company Name: <b>" & Reader.Item("Name") & "</b>"
                        Me.Label_Title.Text = "Title: <b>" & Reader.Item("Title") & "</b>"
                        Me.Label_Details.Text = "Details: <b>" & Reader.Item("Details") & "</b>"
                        Me.Label_Location.Text = "Location: <b>" & Reader.Item("Location") & "</b>"
                        Me.Label_Salary.Text = "Salary: <b>" & Reader.Item("Salary") & "</b>"
                        Me.Label_Benefits.Text = "Benefits: <b>" & Reader.Item("Benefits") & "</b>"
                        Me.Label_Hours.Text = "Hours: <b>" & Reader.Item("Hours") & "</b>"
                        Me.Label_OfferDate.Text = "Offer Date: <b>" & Reader.Item("OfferDate") & "</b>"

                        cmdSearchCompanyTable.Connection.Close()
                        LoadJobAdvertIntoWebPage = True
                    Else
                        LoadJobAdvertIntoWebPage = False
                    End If
                Else
                    LoadJobAdvertIntoWebPage = False
                End If
            End Using
        Else
            LoadJobAdvertIntoWebPage = False
        End If
    End Function


    Private Function AlreadyAppliedForThisJob() As Boolean
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
                Dim strUserId As String = Session("LoggedInID").ToString()

                Dim cmdSearchUserTable As New SqlCommand()
                cmdSearchUserTable.CommandText = "SELECT Id FROM TblJobApplications WHERE JobOfferId=" & strJobOfferId & " AND UserId = " & strUserId & ""
                cmdSearchUserTable.Connection = connection

                cmdSearchUserTable.Connection.Open()

                Dim Reader As SqlDataReader
                Reader = cmdSearchUserTable.ExecuteReader()

                Dim strAlliedForJobId As String = vbNullString

                If Reader.Read Then
                    strAlliedForJobId = Reader.Item("Id")
                End If
                cmdSearchUserTable.Connection.Close()

                If strAlliedForJobId = vbNullString Then
                    AlreadyAppliedForThisJob = False
                Else
                    AlreadyAppliedForThisJob = True
                End If
            End Using
        Else
            AlreadyAppliedForThisJob = False
        End If
    End Function

    Private Function ApplyForThisJob() As Boolean
        Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
        Dim strCompanyId As String = Me.Request.QueryString("CompanyId").ToString()

        If strJobOfferId.Length > 0 And strJobOfferId.Length > 0 Then

            Dim strConn As String
            strConn = Session("SQLConnectionString").ToString()
            If strConn.Length > 0 Then
                Using connection As New SqlConnection(strConn)
                    Dim strUserId As String = Session("LoggedInID").ToString()

                    Dim strTable As String = "TblJobApplications"
                    'Do not add record if Email is already in registered 
                    If IsRegistered(connection, "TblUsers", Session("LoggedInEmail").ToString()) = True Then
                        Dim commandUserTable As New SqlCommand
                        commandUserTable.CommandText = "INSERT INTO " & strTable & " (JobOfferId, UserId) VALUES (@JobOfferId, @UserId)"
                        commandUserTable.Connection = connection

                        commandUserTable.Parameters.Add("@JobOfferId", SqlDbType.Int).Value = strJobOfferId
                        commandUserTable.Parameters.Add("@UserId", SqlDbType.NVarChar, 200).Value = strUserId

                        commandUserTable.Connection.Open()
                        commandUserTable.ExecuteNonQuery()
                        commandUserTable.Connection.Close()

                        'Success
                        ApplyForThisJob = True
                    Else
                        'Failed
                        ApplyForThisJob = False
                    End If

                End Using
            Else
                'Failed
                ApplyForThisJob = False
            End If
        Else
            'Failed
            ApplyForThisJob = False
        End If

    End Function

End Class