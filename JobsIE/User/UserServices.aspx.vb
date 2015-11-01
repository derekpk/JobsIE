Public Class UserServices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        'Leftside links
        HyperLink_UpdateUserDetails.NavigateUrl = "~/User/UserUpdate.aspx"
        HyperLink_UploadCV.NavigateUrl = "~/User/UserUploadCV.aspx"
        HyperLink_SearchJobOffers.NavigateUrl = "~/User/UserSearchOffers.aspx"

        'Rightside links
        HyperLink_ViewJobsAppliedFor.NavigateUrl = "~/User/UserViewJobsAppliedFor.aspx"
 
    End Sub

End Class