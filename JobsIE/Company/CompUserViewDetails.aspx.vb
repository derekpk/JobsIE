Imports System.Data.SqlClient

Public Class UserViewDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        'If Session("LoggedInIsActive") = Session("Inactive") Then
        'Response.Redirect("~/Main.aspx")
        'End If

        HyperLink_Finished.NavigateUrl = "~/Company/CompSearchAll.aspx"

        If Not Page.IsPostBack() Then
            Dim strConn As String
            strConn = Session("SQLConnectionString").ToString()
            If strConn.Length > 0 Then
                Using connection As New SqlConnection(strConn)

                    Dim strUserId As String = Me.Request.QueryString("UserId").ToString()

                    If strUserId.Length > 0 Then
                        Dim cmdSearchUserTable As New SqlCommand()
                        cmdSearchUserTable.CommandText = "SELECT Name, Buzzwords, Email, Address, Phone, Age, CV_Path FROM TblUsers WHERE (Id = " & strUserId.ToString() & ")"

                        cmdSearchUserTable.Connection = connection
                        cmdSearchUserTable.Connection.Open()

                        Dim Reader As SqlDataReader
                        Reader = cmdSearchUserTable.ExecuteReader()
                        'OfferDate()
                        If Reader.Read Then
                            Me.Label_Name.Text = "User Name: <b>" & Reader.Item("Name") & "</b>"
                            Me.Label_Buzzwords.Text = "Buzawords: <b>" & Reader.Item("Buzzwords") & "</b>"
                            Me.Label_Email.Text = "Email: <b>" & Reader.Item("Email") & "</b>"
                            Me.Label_Address.Text = "Address: <b>" & Reader.Item("Address") & "</b>"
                            Me.Label_Phone.Text = "Phone: <b>" & Reader.Item("Phone") & "</b>"
                            Me.Label_Age.Text = "Age: <b>" & Reader.Item("Age") & "</b>"

                            If Reader.Item("CV_Path").ToString().Length() <= 0 Then
                                Me.Label_CV_Path.Text = "C.V.: <b>NONE ON RECORD</b>"
                            Else
                                Me.Label_CV_Path.Text = "C.V.: <b>" & Reader.Item("CV_Path") & "</b>"
                            End If

                            cmdSearchUserTable.Connection.Close()
                        End If
                    End If
                End Using
            End If
        End If

    End Sub

    Protected Sub ButtonFinishedViewing_Click(sender As Object, e As System.EventArgs) Handles ButtonFinishedViewing.Click
        Response.Redirect("~/Company/CompSearchAll.aspx")
    End Sub
End Class