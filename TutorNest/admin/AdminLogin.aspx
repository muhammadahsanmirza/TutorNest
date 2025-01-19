<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="TutorNest.admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Admin</title>
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link href="AdminLoginStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-form">
            <div class="form-container">
                <div class="form-icon">
                    <span><i class="icon icon-user"></i></span>
                </div>
                <h2 class="text-center">Admin Login</h2>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control item" placeholder="Username" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control item" placeholder="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-block create-account" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
    </form>

    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
