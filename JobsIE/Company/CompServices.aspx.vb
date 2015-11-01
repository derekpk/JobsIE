Public Class CompanyServices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoggedInRole") = Session("NotLoggedIn") Then
            Response.Redirect("~/main.aspx")
        End If

        'Leftside links
        HyperLink_UpdateCompanyDetails.NavigateUrl = "~/Company/CompUpdate.aspx"
        HyperLink_UploadJobOffer.NavigateUrl = "~/Company/CompJobUpload.aspx"
        HyperLink_UpdateJobOffer.NavigateUrl = "~/Company/CompJobUpdate.aspx"

        'Rightside links
        HyperLink_SearchUserDetails.NavigateUrl = "~/Company/CompSearchAll.aspx"
        HyperLink_ReviewApplicants.NavigateUrl = "~/Company/CompViewApps.aspx"
    End Sub

End Class