<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="StudentSignup.aspx.cs" Inherits="TutorNest.StudentSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StudentSignupStylesheet.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-form">
        <div class="form-container">
            <!-- Icon at the top -->
            <div class="form-icon">
                <span><i class="icon icon-notebook"></i></span>
            </div>
            <h2 class="text-center">Student Registration</h2>

            <!-- First Row: Name, Father Name, Surname -->
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
                        <label for="txtFatherName">Father's Name</label>
                        <asp:TextBox runat="server" ID="txtFatherName" CssClass="form-control item" placeholder="Father's Name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFatherName" ErrorMessage="Father's Name is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <!-- Second Row: Gender, Age, Country -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlGender">Gender</label>
                        <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-control item">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGender" ErrorMessage="Gender is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtAge">Age</label>
                        <asp:TextBox runat="server" ID="txtAge" CssClass="form-control item" placeholder="Age" TextMode="Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RangeValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age must be between 5 to 60." CssClass="text-danger" Display="Dynamic" MinimumValue="5" MaximumValue="60" Type="Integer" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlCountry">Country</label>
                        <asp:DropDownList runat="server" ID="ddlCountry" CssClass="form-control item" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            <asp:ListItem Text="Select Country" Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Country is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
            </div>

            <!-- Third Row: City, Address -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlCity">City</label>
                        <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-control item">
                            <asp:ListItem Text="Select City" Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCity" ErrorMessage="City is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control item" placeholder="Address" TextMode="MultiLine" Rows="3" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <!-- Fourth Row: Class, Going To, Subject -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtStandard">Class</label>
                        <asp:TextBox runat="server" ID="txtStandard" CssClass="form-control item" placeholder="Class" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStandard" ErrorMessage="Class is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlGoingTo">Going To</label>
                        <asp:DropDownList runat="server" ID="ddlGoingTo" CssClass="form-control item">
                            <asp:ListItem Text="Select Option" Value="" />
                            <asp:ListItem Text="School" Value="School" />
                            <asp:ListItem Text="College" Value="College" />
                            <asp:ListItem Text="University" Value="University" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGoingTo" ErrorMessage="Going To is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtSubject">Subject</label>
                        <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control item" placeholder="Subject" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <!-- Fifth Row: Contact No, Tuition Type, Tutor Preferred -->
            <div class="row">
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
                        <label for="ddlTuitionType">Tuition Type</label>
                        <asp:DropDownList runat="server" ID="ddlTuitionType" CssClass="form-control item">
                            <asp:ListItem Text="Select Tuition Type" Value="" />
                            <asp:ListItem Text="Online" Value="Online" />
                            <asp:ListItem Text="Physical" Value="Physical" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTuitionType" ErrorMessage="Tuition Type is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="ddlTutorPreferred">Tutor Preferred</label>
                        <asp:DropDownList runat="server" ID="ddlTutorPreferred" CssClass="form-control item">
                            <asp:ListItem Text="Select Tutor Level" Value="" />
                            <asp:ListItem Text="Graduation" Value="Graduation" />
                            <asp:ListItem Text="Masters" Value="Masters" />
                            <asp:ListItem Text="PHD" Value="PHD" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTutorPreferred" ErrorMessage="Tutor Preferred is required." CssClass="text-danger" Display="Dynamic" InitialValue="" />
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
