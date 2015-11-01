Imports System.Data.SqlClient

Public Class UserUploadCV
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finish.NavigateUrl = "~/User/UserServices.aspx"

        Dim strCVFilename As String = GetCV_Filename()

        If strCVFilename <> vbNullString Then
            Label_CV_FileName.Text = "Current C.V. : " & strCVFilename
        End If

    End Sub

    Private Function GetCV_Filename() As String
        'If we get here then all of the fields are already
        ' validated by the form validation controls
        'Now we need to update the database with the new details
        Dim strConn As String
        strConn = Session("SQLConnectionString").ToString()
        If strConn.Length > 0 Then
            Using connection As New SqlConnection(strConn)

                Dim strEmail As String = Session("LoggedInEmail").ToString()

                Dim cmdSearchUserTable As New SqlCommand()

                cmdSearchUserTable.CommandText = "SELECT CV_Path FROM TblUsers WHERE Email='" & strEmail & "'"
                cmdSearchUserTable.Connection = connection
                cmdSearchUserTable.Connection.Open()

                Dim Reader As SqlDataReader
                Reader = cmdSearchUserTable.ExecuteReader()

                If Reader.Read Then
                    GetCV_Filename = Reader.Item("CV_Path").ToString()
                Else
                    GetCV_Filename = vbNullString
                End If

                cmdSearchUserTable.Connection.Close()

            End Using
        Else
            GetCV_Filename = vbNullString
        End If

    End Function


    Protected Sub Button_UploadUserCV_Click(sender As Object, e As EventArgs) Handles Button_UploadUserCV.Click
        'The file upload requires some special error handling because some of the file details are not
        'available at the time the file is selected, so the error messages have to be
        'created in this method, some style settings also have to be changed here
        'which goes against the CSS guidelines but it will do for now.
        Try
            If FileUpload_UserCV.HasFile Then
                ' Get the name of the file to upload.
                Dim strFileName As String = Server.HtmlEncode(FileUpload_UserCV.FileName)


                ' Get the extension of the uploaded file.
                Dim extension As String = System.IO.Path.GetExtension(strFileName)

                ' Allow only files with .doc or .xls extensions to be uploaded.
                If (extension = ".doc") Or (extension = ".txt") Then

                    ' Get the size in bytes of the file to upload.
                    Dim fileSize As Integer = FileUpload_UserCV.PostedFile.ContentLength

                    ' Allow only files less than 1,024,000 bytes (approximately 1 MB) to be uploaded.
                    If (fileSize < 1024000) Then
                        FileUpload_UserCV.SaveAs(Server.MapPath("CV/" & strFileName))

                        UpdateUserCVPath(strFileName)

                        Label_UploadStatus.Text = "Your CV named: " & strFileName & " was uploaded successfully."

                        Response.Redirect("~/User/UserUploadCV.aspx")
                    Else
                        ' Notify the user why their file was not uploaded.
                        Label_UploadStatus.ForeColor = Drawing.Color.Red
                        Label_UploadStatus.Text = "Your file was not uploaded because it exceeds the 1 MB size limit."
                    End If

                Else
                    Label_UploadStatus.ForeColor = Drawing.Color.Red
                    Label_UploadStatus.Text = "Your CV was not uploaded, valid files have <b>.doc</b> or <b>.txt</b> extensions."
                End If

            Else
                Label_UploadStatus.ForeColor = Drawing.Color.Red
                Label_UploadStatus.Text = "Please select a file to upload."
            End If

        Catch ex As Exception
            Label_UploadStatus.ForeColor = Drawing.Color.Red
            Label_UploadStatus.Text = "TRY:CATCH exception : " & ex.Message.ToString()

        End Try

    End Sub

    Private Sub UpdateUserCVPath(ByVal strFilename)

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

                commandUpdateUserTable.CommandText = "UPDATE TblUsers SET CV_Path=@CV_Path WHERE Email=@LoggedInEmail;"

                commandUpdateUserTable.Parameters.Add("@CV_Path", SqlDbType.NVarChar, 200).Value = strFilename

                commandUpdateUserTable.Parameters.Add("@LoggedInEmail", SqlDbType.NVarChar, 100).Value = strEmail

                'preform the update on the database
                commandUpdateUserTable.Connection.Open()
                commandUpdateUserTable.ExecuteNonQuery()
                commandUpdateUserTable.Connection.Close()

                Session("LoggedInIsActive") = Session("Active")
            End Using
        End If
    End Sub
End Class