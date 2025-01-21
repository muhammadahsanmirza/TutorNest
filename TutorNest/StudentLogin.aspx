<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="TutorNest.StudentLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="LoginStylesheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="registration-form">
        <div class="form-container">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <h2 class="text-center">Student Login</h2>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control item" placeholder="Username" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control item" placeholder="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-block create-account" OnClick="btnLogin_Click"/>
            </div>
        </div>
    </div>

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</asp:Content>
