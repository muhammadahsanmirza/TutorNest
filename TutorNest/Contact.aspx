<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TutorNest.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successSubmission() {
            Swal.fire({
                title: "Success",
                text: "Message Submitted Successfully",
                icon: "success"
            });
        }
        function errorSubmission() {
            Swal.fire({
                title: "Failure",
                text: "Error in Message Submission",
                icon: "error"
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ======= Contact Section ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>Contact</h2>
                <ol>
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Contact</li>
                </ol>
            </div>

        </div>
    </section>
    <!-- End Contact Section -->

    <!-- ======= Contact Section ======= -->
    <section class="contact" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
        <div class="container">

            <div class="row">

                <div class="col-lg-6">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="info-box">
                                <i class="bx bx-map"></i>
                                <h3>Our Address</h3>
                                <p>Gulberg Greens, Islamabad</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bx bx-envelope"></i>
                                <h3>Email Us</h3>
                                <p>
                                    work.muhammadahsan@gmail.com<br >
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bx bx-phone-call"></i>
                                <h3>Call Us</h3>
                                <p>
                                    0304 5594554<br>
                                    
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="col-lg-12 align-items-center">
            <div class="form-row">
                <div class="col-md-6 form-group">
                    <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Your Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" ControlToValidate="NameTextBox" runat="server" ErrorMessage="Name is required" Display="Dynamic" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6 form-group">
                    <asp:TextBox ID="MailTextBox" CssClass="form-control" placeholder="Your Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" ControlToValidate="MailTextBox" runat="server" ErrorMessage="Email is required" Display="Dynamic" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" ControlToValidate="MailTextBox" runat="server" ErrorMessage="Invalid Email" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="SubjectDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>Select </asp:ListItem>
                    <asp:ListItem>Suggestion</asp:ListItem>
                    <asp:ListItem>Feedback</asp:ListItem>
                    <asp:ListItem>Complaint</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="SubjectRequiredFieldValidator" ControlToValidate="SubjectDropDownList" InitialValue="Select" runat="server" ErrorMessage="Subject is required" Display="Dynamic" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="MessageTextBox" CssClass="form-control" Columns="50" Rows="5" placeholder="Enter Message" TextMode="MultiLine" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="MessageTextBox" runat="server" ErrorMessage="Message is required" Display="Dynamic" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="text-right">
                <asp:Button ID="ClearBtn" CssClass="btn btn-light" runat="server" Text="Clear" OnClick="ClearBtn_Click" CausesValidation="false" />
                <asp:Button ID="SubmitButton" CssClass="btn btn-info" runat="server" Text="Send Message" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
            </div>

        </div>
    </section>
    <!-- End Contact Section -->


</asp:Content>
