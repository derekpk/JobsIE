Imports System.Data.SqlClient

Public Class UserViewOneOfTheJobsYouApplied
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        If Session("LoggedInIsActive") = Session("Inactive") Then
            Response.Redirect("~/Main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/User/UserViewJobsAppliedFor.aspx"

        If Not Page.IsPostBack() Then
            'Load the job advert into the page

            If LoadJobAdvertIntoWebPage() = True Then
                ShowApplcationState()
            End If
        Else
            Me.Label_FailureNotificationMessage.Text = "Problem loading Job Advert"
        End If
    End Sub

    Private Function ShowApplcationState()
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
                Dim strCompanyId As String = Me.Request.QueryString("CompanyId").ToString()

                If strJobOfferId.Length > 0 And strJobOfferId.Length > 0 Then
                    Dim cmdSearchCompanyTable As New SqlCommand()
                    cmdSearchCompanyTable.CommandText = "SELECT * FROM TblJobApplications WHERE (TblJobApplications.JobOfferId = " & strJobOfferId.ToString() & ") AND (TblJobApplications.UserId = " & Session("LoggedInID").ToString() & ")"

                    cmdSearchCompanyTable.Connection = connection
                    cmdSearchCompanyTable.Connection.Open()

                    Dim Reader As SqlDataReader
                    Reader = cmdSearchCompanyTable.ExecuteReader()

                    If Reader.Read Then
                        Dim intDateDiff As Integer
                        intDateDiff = DateDiff(DateInterval.Day, Reader.Item("ApplicationDate"), Now)

                        Dim strApplicationState As String = vbNullString
                        Select Case Reader.Item("ApplicationState")
                            Case 0

                                If intDateDiff >= 5 Then
                                    strApplicationState = strApplicationState & "Unsuccessful"
                                    'The Company did not respond to the Application within 5 days
                                    'So, Update the table to change to ApplicationState field to "Unsucessful"
                                    UpdateTheApplicationField(2, strJobOfferId)
                                Else
                                    strApplicationState = "To Be Read"
                                    Me.Label_FailureNotificationMessage.CssClass = "JobApplicationMessageToBeRead"
                                End If

                            Case 1
                                strApplicationState = "Under Review"
                                Me.Label_FailureNotificationMessage.CssClass = "JobApplicationMessageUnderReview"
                            Case 2
                                strApplicationState = "Unsuccessful"
                                Me.Label_FailureNotificationMessage.CssClass = "JobApplicationMessageUnsuccessful"
                        End Select
                        Me.Label_FailureNotificationMessage.Text = "Date of Application: <b>" & Reader.Item("ApplicationDate") & "</b>" & " - Application State: " & "<b>" & strApplicationState & "</b>"
                        cmdSearchCompanyTable.Connection.Close()
                        ShowApplcationState = True
                    Else
                        ShowApplcationState = False
                    End If
                Else
                    ShowApplcationState = False
                End If
            End Using
        Else
            ShowApplcationState = False
        End If


    End Function


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

    Private Function UpdateTheApplicationField(ByVal intApplicationState As Integer, ByVal strJobOfferId As String) As Boolean

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim commandUpdateJobsOffersTable As New SqlCommand
                commandUpdateJobsOffersTable.CommandType = CommandType.Text
                commandUpdateJobsOffersTable.Connection = connection

                commandUpdateJobsOffersTable.CommandText = "UPDATE TblJobApplications SET ApplicationState=@ApplicationState WHERE JobOfferId=@JobOfferId;"

                'Get the details from the form controls
                commandUpdateJobsOffersTable.Parameters.Add("@ApplicationState", SqlDbType.Int).Value = intApplicationState
                commandUpdateJobsOffersTable.Parameters.Add("@JobOfferId", SqlDbType.Int).Value = strJobOfferId

                'preform the update on the database
                commandUpdateJobsOffersTable.Connection.Open()
                commandUpdateJobsOffersTable.ExecuteNonQuery()
                commandUpdateJobsOffersTable.Connection.Close()

                UpdateTheApplicationField = True
            End Using
        Else
            UpdateTheApplicationField = False
        End If
    End Function



End Class