Imports System.Data.SqlClient
Imports System.Timers

Public Class CompUpdateOneJob
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If no noboby looged in then redirect
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finish.NavigateUrl = "~/Company/CompJobUpdate.aspx"

        If Session("LoggedInIsActive") = Session("Inactive") Then
            Me.Label_InactiveMessage.Text = "You must have an Active Account to use this service"
            Me.Label_CompanyName.Enabled = False
            Me.TextBox_Title.Enabled = False
            Me.TextBox_Details.Enabled = False
            Me.TextBox_Location.Enabled = False
            Me.TextBox_Salary.Enabled = False
            Me.TextBox_Benefits.Enabled = False
            Me.TextBox_Hours.Enabled = False
            Me.TextBox_StartDate.Enabled = False
            Me.ButtonRenewJobOffer.Enabled = False
            Me.ButtonUpdateJobOffer.Enabled = False
        End If


        If Not Page.IsPostBack() Then
            Dim strConn As String
            strConn = Session("SQLConnectionString").ToString()
            If strConn.Length > 0 Then
                Using connection As New SqlConnection(strConn)

                    Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
                    Dim strCompanyId As String = Me.Request.QueryString("CompanyId").ToString()

                    If strJobOfferId.Length > 0 And strJobOfferId.Length > 0 Then
                        Dim cmdSearchCompanyTable As New SqlCommand()
                        cmdSearchCompanyTable.CommandText = "SELECT * FROM TblJobOffers, TblCompanies WHERE (TblJobOffers.Id = " & strJobOfferId.ToString() & ") AND (TblCompanies.Id = " & strCompanyId.ToString() & ")"

                        cmdSearchCompanyTable.Connection = connection
                        cmdSearchCompanyTable.Connection.Open()

                        Dim Reader As SqlDataReader
                        Reader = cmdSearchCompanyTable.ExecuteReader()
                        'OfferDate()
                        If Reader.Read Then
                            Me.Label_CompanyName.Text = "Company Name: <b>" & Reader.Item("Name") & "</b>"
                            Me.TextBox_Title.Text = Reader.Item("Title")
                            Me.TextBox_Details.Text = Reader.Item("Details")
                            Me.TextBox_Location.Text = Reader.Item("Location")
                            Me.TextBox_Salary.Text = Reader.Item("Salary")
                            Me.TextBox_Benefits.Text = Reader.Item("Benefits")
                            Me.TextBox_Hours.Text = Reader.Item("Hours")
                            Me.TextBox_StartDate.Text = Reader.Item("OfferDate")

                            Dim intDateDiff As Integer
                            intDateDiff = DateDiff(DateInterval.Day, Reader.Item("OfferDate"), Now)

                            If intDateDiff < 31 Then
                                Me.Label_OfferCountdownTitle.Text = "Job Advert will expire in: " & (30 - intDateDiff).ToString() & " Days and"
                            Else
                                Me.Timer_OfferCountdown.Enabled = False
                                Me.Label_OfferCountdownTitle.Text = "Your Job Advert has expired"
                                Me.Label_OfferCountdown.CssClass = "OfferCountdownExpired"
                            End If

                            cmdSearchCompanyTable.Connection.Close()
                        End If
                    End If
                End Using
            End If
        End If
    End Sub

    Protected Sub Timer_OfferCountdown_Tick(sender As Object, e As System.EventArgs)
        'does not work if the dtStartTime is set to 00:00:00
        Me.Label_OfferCountdown.CssClass = "OfferCountdownActive"
        Dim dtStartTime As DateTime = "23:59:59"
        Dim tsEndTime As TimeSpan = dtStartTime.TimeOfDay.Subtract(DateTime.Now.TimeOfDay)

        Label_OfferCountdown.Text = AdjustTimeDigits(tsEndTime.Hours.ToString()) & ":" & AdjustTimeDigits(tsEndTime.Minutes.ToString()) & ":" & AdjustTimeDigits(tsEndTime.Seconds)
    End Sub

    Private Function AdjustTimeDigits(ByVal strDigit As String)
        'Add an extra zero if it only has one digit
        If strDigit.Length() <= 1 Then
            AdjustTimeDigits = "0" & strDigit
        Else
            AdjustTimeDigits = strDigit
        End If

    End Function

    Protected Sub ButtonUpdateJobOffer_Click(sender As Object, e As System.EventArgs) Handles ButtonUpdateJobOffer.Click
        'Set all the attributes except the job offer date
        UpdateJobOffer("UPDATE TblJobOffers SET Title=@Title, Details=@Details, Location=@Location, Salary=@Salary, Benefits=@Benefits, Hours=@Hours WHERE Id=@JobOfferId AND CompanyId=@CompanyId;")

    End Sub

    Protected Sub ButtonRenewJobOffer_Click(sender As Object, e As System.EventArgs) Handles ButtonRenewJobOffer.Click
        'Only set the job offer date
        UpdateJobOffer("UPDATE TblJobOffers SET OfferDate=@OfferDate WHERE Id=@JobOfferId AND CompanyId=@CompanyId;")

    End Sub

    Private Sub UpdateJobOffer(strSqlStatement As String)
        'If we get here then all of the fields are already
        ' validated by the form validation controls
        'Now we need to update the database with the new details
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim strJobOfferId As String = Me.Request.QueryString("JobOfferId").ToString()
                Dim strCompanyId As String = Me.Request.QueryString("CompanyId").ToString()

                'if we have a jobOfferID and a CompanyID then update the table
                If strJobOfferId.Length > 0 And strJobOfferId.Length > 0 Then

                    Dim commandUpdateCompanyTable As New SqlCommand
                    commandUpdateCompanyTable.CommandType = CommandType.Text
                    commandUpdateCompanyTable.Connection = connection

                    commandUpdateCompanyTable.CommandText = strSqlStatement
                    'Get the details from the form controls
                    commandUpdateCompanyTable.Parameters.Add("@Title", SqlDbType.NVarChar, 200).Value = Me.TextBox_Title.Text
                    commandUpdateCompanyTable.Parameters.Add("@Details", SqlDbType.NVarChar, 200).Value = Me.TextBox_Details.Text
                    commandUpdateCompanyTable.Parameters.Add("@Location", SqlDbType.NVarChar, 200).Value = Me.TextBox_Location.Text
                    commandUpdateCompanyTable.Parameters.Add("@Salary", SqlDbType.NVarChar, 50).Value = Me.TextBox_Salary.Text
                    commandUpdateCompanyTable.Parameters.Add("@Benefits", SqlDbType.NChar, 100).Value = Me.TextBox_Benefits.Text
                    commandUpdateCompanyTable.Parameters.Add("@Hours", SqlDbType.NChar, 50).Value = Me.TextBox_Hours.Text
                    commandUpdateCompanyTable.Parameters.Add("@JobOfferId", SqlDbType.Int).Value = strJobOfferId.ToString()
                    commandUpdateCompanyTable.Parameters.Add("@CompanyId", SqlDbType.Int).Value = strCompanyId.ToString()

                    commandUpdateCompanyTable.Parameters.Add("@OfferDate", SqlDbType.Date).Value = myGetDate().ToString()

                    'preform the update on the database
                    commandUpdateCompanyTable.Connection.Open()
                    commandUpdateCompanyTable.ExecuteNonQuery()
                    commandUpdateCompanyTable.Connection.Close()

                    'finished updating the Comapany Job Offer details
                    'redirect to the company services page
                    Response.Redirect("~/Company/CompUpdateOneJob.aspx?JobOfferId=" & strJobOfferId.ToString() & "&CompanyId=" & strCompanyId.ToString())
                End If
            End Using
        End If

    End Sub

End Class