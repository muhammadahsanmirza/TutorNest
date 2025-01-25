<%@ Page Title="" Language="C#" MasterPageFile="~/tutor/TutorDashboard.Master" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="TutorNest.tutor.ViewStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .card {
            background-color: #343a40; /* Dark background */
            color: #ffffff; /* White text */
            margin: 10px;
        }

        .card-header {
            background-color: #212529; /* Darker header */
            font-weight: bold;
        }

        .list-group-item {
            background-color: #343a40; /* Dark background */
            color: #ffffff; /* White text */
            border: 1px solid #454d55; /* Slightly lighter border */
        }

        .search-container {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="text-center">View Students</h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="search-container" style="width: 360px">
            <div class="input-group">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name, country, city, or subject"></asp:TextBox>
                <div class="input-group-append">
                    <asp:Button ID="btnSearch" runat="server" Text="&#128269;" CssClass="btn btn-dark" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rptStudents" runat="server">
                    <ItemTemplate>
                        <div class="card" style="width: 18rem;">
                            <div class="card-header">
                                Student Details
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <strong>Name:</strong> <span><%# Eval("name") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Country:</strong> <span><%# Eval("country") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>City:</strong> <span><%# Eval("city") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Going To:</strong> <span><%# Eval("going_to") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Subject:</strong> <span><%# Eval("subject") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Tuition Type:</strong> <span><%# Eval("tution_type") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Tutor Preferred:</strong> <span><%# Eval("tutor_preferred") %></span>
                                </li>
                                <li class="list-group-item">
                                    <strong>Contact No:</strong> <span><%# Eval("contact_no") %></span>
                                </li>
                            </ul>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript">
        function showAlert(message) {
            Swal.fire({
                icon: 'info',
                title: 'No Records Found',
                text: message,
                confirmButtonText: 'OK'
            });
        }
    </script>
</asp:Content>