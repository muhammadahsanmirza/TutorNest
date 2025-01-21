<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="ViewContact.aspx.cs" Inherits="TutorNest.admin.ViewContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom CSS for table */
        .table-responsive {
            overflow-x: auto;
        }
        .table thead th {
            background-color: #5891ff; /* Theme color for header */
            color: white;
            font-weight: bold;
        }
        .table tbody td {
            vertical-align: middle; /* Align content vertically */
        }
        .btn-sm {
            margin: 2px; /* Add spacing between buttons */
        }
        .edit-mode-buttons {
            display: flex;
            gap: 5px; /* Add spacing between Update and Cancel buttons */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>View Contact Messages</h2>
        <div class="table table-bordered table-striped table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSorting="GridView1_Sorting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id">
                <Columns>
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CssClass="btn btn-info btn-sm" OnClientClick='<%# "showDetails(\"" + Eval("name") + "\", \"" + Eval("email") + "\", \"" + Eval("subject") + "\", \"" + Eval("message") + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i> View
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" CssClass="btn btn-info btn-sm" OnClientClick='<%# "showDetails(\"" + Eval("name") + "\", \"" + Eval("email") + "\", \"" + Eval("subject") + "\", \"" + Eval("message") + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i> View
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                    <asp:BoundField DataField="message" HeaderText="Message" SortExpression="message" />

                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-warning btn-sm" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-sm" />
                </Columns>
                <PagerStyle CssClass="pagination" />
            </asp:GridView>
        </div>
    </div>

    <!-- SweetAlert Script for View Details Popup -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function showDetails(name, email, subject, message) {
            Swal.fire({
                title: 'Contact Details',
                html: `<b>Name:</b> ${name}<br>
                       <b>Email:</b> ${email}<br>
                       <b>Subject:</b> ${subject}<br>
                       <b>Message:</b> ${message}`,
                icon: 'info',
                confirmButtonText: 'Close'
            });
        }
    </script>
</asp:Content>