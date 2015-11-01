<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/JobsIE.Master" CodeBehind="UserUploadCV.aspx.vb" Inherits="JobsIE.UserUploadCV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>User Ciriculum Vitae Upload.</h2>
    <h2><asp:HyperLink ID="HyperLink_Finish" runat="server" EnableViewState="false">Finished Uploading</asp:HyperLink></h2>
        <p>Click the link to return to the User Services page</p>
    <div class="cvUpload">
       <fieldset class="cvUpload">
           <asp:FileUpload
                    ID="FileUpload_UserCV"
                    runat="server"
                    Width="467px"/>
            <br />
            <br />
            <asp:Button 
                ID="Button_UploadUserCV"
                runat="server"
                Text="File Upload"
                OnClick="Button_UploadUserCV_Click"/>
            <br />
            <br />
            <asp:Label
                ID="Label_UploadStatus"
                runat="server">Choose a file, then press the file upload button</asp:Label>
            <br />
            <p>(Valid file type's are <b>.doc</b> OR <b>.txt</b>)</p>
        </fieldset>
        <asp:Label
            CssClass="CV_Filename"
            ID="Label_CV_FileName"
            runat="server"></asp:Label>
    </div>
</asp:Content>
