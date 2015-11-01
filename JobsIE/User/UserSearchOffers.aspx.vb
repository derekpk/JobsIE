Public Class UserSearchOffers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        HyperLink_Finished.NavigateUrl = "~/User/UserServices.aspx"

        If Session("LoggedInIsActive") = Session("Inactive") Then
            Me.Label_InactiveMessage.Text = "You must have an Active Account to use that service"
            Me.TextBox_Location.Enabled = False
            Me.TextBox_Technology.Enabled = False
            Me.Button_SearchJobOffers.Enabled = False
        Else

            If Not Page.IsPostBack() Then
                TextBox_Location.Text = Session("UserSearchOffersLocation")
                TextBox_Technology.Text = Session("UserSearchOffersTechnology")
            End If
        End If
    End Sub

    Private Sub UserSearchOffers_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
        Session("UserSearchOffersLocation") = TextBox_Location.Text
        Session("UserSearchOffersTechnology") = TextBox_Technology.Text
    End Sub

End Class