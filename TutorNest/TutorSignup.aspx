<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="TutorSignup.aspx.cs" Inherits="TutorNest.TutorSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StudentSignupStylesheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        <div class="form-container">
            <!-- Icon at the top -->
            <div class="form-icon mb-0">
                <span><i class="fas fa-graduation-cap"></i></span>
            </div>
            <!-- Sign up as Student Button in Top-Right Corner -->
           <%-- <div class="tutor-signup-link text-right mx-0">
                <asp:HyperLink runat="server" ID="lnkTutorSignup" NavigateUrl="~/StudentSignup.aspx" CssClass="btn btn-sm btn-info">
                    <i class=""></i>Sign up as Student
                </asp:HyperLink>
            </div>--%>

            <h2 class="text-center mx-0">Tutor Registration</h2>
            <!-- First Row: Name, Surname, Age -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtName">Name</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control item" placeholder="Name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtSurname">Surname</label>
                        <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control item" placeholder="Surname" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" ErrorMessage="Surname is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtAge">Age</label>
                        <asp:TextBox runat="server" ID="txtAge" CssClass="form-control item" placeholder="Age" TextMode="Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RangeValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age must be between 18 to 60." CssClass="text-danger" Display="Dynamic" MinimumValue="18" MaximumValue="60" Type="Integer" />
                    </div>
                </div>
            </div>

            <!-- Second Row: Marital Status, Phone No, Email -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlMaritalStatus">Marital Status</label>
                        <asp:DropDownList runat="server" ID="ddlMaritalStatus" CssClass="form-control item">
                            <asp:ListItem Text="Select Marital Status" Value="" />
                            <asp:ListItem Text="Single" Value="Single" />
                            <asp:ListItem Text="Married" Value="Married" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlMaritalStatus" ErrorMessage="Marital Status is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtContactNo">Contact No</label>
                        <asp:TextBox runat="server" ID="txtContactNo" CssClass="form-control item" placeholder="Contact No" TextMode="Phone" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactNo" ErrorMessage="Contact No is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtContactNo" ErrorMessage="Invalid Contact No." CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{11}$" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control item" placeholder="Email" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." CssClass="text-danger" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" />
                    </div>
                </div>
            </div>
            <!-- Third Row: Qualification, Degree, Experience -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlQualification">Qualification</label>
                        <asp:DropDownList runat="server" ID="ddlQualification" CssClass="form-control item">
                            <asp:ListItem Text="Select Qualification" Value="" />
                            <asp:ListItem Text="Matric" Value="Matric" />
                            <asp:ListItem Text="Intermediate" Value="Intermediate" />
                            <asp:ListItem Text="Bachelor" Value="Bachelor" />
                            <asp:ListItem Text="Master" Value="Master" />
                            <asp:ListItem Text="PhD" Value="PhD" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlQualification" ErrorMessage="Qualification is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtDegree">Degree</label>
                        <asp:TextBox runat="server" ID="txtDegree" CssClass="form-control item" placeholder="Degree" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDegree" ErrorMessage="Degree is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtExperience">Experience (Years)</label>
                        <asp:TextBox runat="server" ID="txtExperience" CssClass="form-control item" placeholder="Experience" TextMode="Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtExperience" ErrorMessage="Experience is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RangeValidator runat="server" ControlToValidate="txtExperience" ErrorMessage="Experience cannot be negative." CssClass="text-danger" Display="Dynamic" Type="Integer" MinimumValue="0" MaximumValue="60" />
                    </div>
                </div>
            </div>
            <!-- Fourth Row: Country, City -->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="ddlCountry">Country</label>
                        <asp:DropDownList runat="server" ID="ddlCountry" CssClass="form-control item" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            <asp:ListItem Text="Select Country" Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Country is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="ddlCity">City</label>
                        <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-control item">
                            <asp:ListItem Text="Select City" Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCity" ErrorMessage="City is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
            </div>

            <!-- Fifth Row: Address -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control item" placeholder="Address" TextMode="MultiLine" Rows="3" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <!-- Sixth Row: Username, Password, Confirm Password -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control item" placeholder="Username" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control item" placeholder="Password" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Must include a capital letter and a number." CssClass="text-danger" Display="Dynamic" ValidationExpression="^(?=.*[A-Z])(?=.*\d).+$" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password</label>
                        <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control item" placeholder="Confirm Password" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:CompareValidator runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="row">
                <div class="col-md-12 text-right">
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn btn-sm create-account" OnClick="btnRegister_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
