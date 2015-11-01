Imports System.Data.SqlClient

Public Class CompJobUpload
    Inherits MyUtilityClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Cancel.NavigateUrl = "~/Company/CompServices.aspx"
        If Session("LoggedInIsActive") = Session("Inactive") Then
            Me.Label_InactiveMessage.Text = "You must have an Active Account to use this service"
            Me.TextBox_Title.Enabled = False
            Me.TextBox_Details.Enabled = False
            Me.TextBox_Location.Enabled = False
            Me.TextBox_Salary.Enabled = False
            Me.TextBox_Benefits.Enabled = False
            Me.TextBox_Hours.Enabled = False
            Me.ButtonUploadJobOffer.Enabled = False
        End If

    End Sub

    Protected Sub ButtonUploadJobOffer_Click(sender As Object, e As System.EventArgs)

        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)
                Dim strTable As String = "TblJobOffers"
                'Do not add job offer record if not logged in as a Company
                If Session("LoggedInRole").ToString() = Session("LoggedInAsCompany").ToString() Then
                    Dim commandJobOfferTable As New SqlCommand
                    commandJobOfferTable.CommandText = "INSERT INTO " & strTable & " (CompanyId, Title, Details, Location, Salary, Benefits, Hours) VALUES (@CompanyId, @Title, @Details, @Location, @Salary, @Benefits, @Hours)"
                    commandJobOfferTable.Connection = connection

                    Dim i_CompanyID As Integer = Session("LoggedInID").ToString()
                    commandJobOfferTable.Parameters.Add("@CompanyId", SqlDbType.Int).Value = i_CompanyID
                    commandJobOfferTable.Parameters.Add("@Title", SqlDbType.NVarChar, 100).Value = Me.TextBox_Title.Text
                    commandJobOfferTable.Parameters.Add("@Details", SqlDbType.NVarChar, 200).Value = Me.TextBox_Details.Text
                    commandJobOfferTable.Parameters.Add("@Location", SqlDbType.NVarChar, 200).Value = Me.TextBox_Location.Text
                    commandJobOfferTable.Parameters.Add("@Salary", SqlDbType.NVarChar, 100).Value = Me.TextBox_Salary.Text
                    commandJobOfferTable.Parameters.Add("@Benefits", SqlDbType.NVarChar, 100).Value = Me.TextBox_Benefits.Text
                    commandJobOfferTable.Parameters.Add("@Hours", SqlDbType.NVarChar, 50).Value = Me.TextBox_Hours.Text
                    'Description
                    commandJobOfferTable.Connection.Open()
                    commandJobOfferTable.ExecuteNonQuery()
                    commandJobOfferTable.Connection.Close()

                    Response.Redirect("~/Company/CompJobUploadComplete.aspx?")
                Else
                End If

            End Using
        End If

    End Sub

End Class