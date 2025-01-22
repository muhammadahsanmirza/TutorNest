<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="ViewContact.aspx.cs" Inherits="TutorNest.admin.ViewContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
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
        <asp:ScriptManager runat="server" />
        <!-- Required for UpdatePanel -->
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="table table-bordered table-striped table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                        AllowPaging="True" PageSize="3" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnSorting="GridView1_Sorting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id">
                        <Columns>
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn btn-info btn-sm" OnClientClick='<%# "showDetails(\"" + Eval("name") + "\", \"" + Eval("email") + "\", \"" + Eval("subject") + "\", \"" + Eval("message") + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn btn-info btn-sm" OnClientClick='<%# "showDetails(\"" + Eval("name") + "\", \"" + Eval("email") + "\", \"" + Eval("subject") + "\", \"" + Eval("message") + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSubject" runat="server">
                                        <asp:ListItem Text="Suggestion" Value="Suggestion" />
                                        <asp:ListItem Text="Feedback" Value="Feedback" />
                                        <asp:ListItem Text="Complaint" Value="Complaint" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Message">
                                <ItemTemplate>
                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("message") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMessage" runat="server" Text='<%# Bind("message") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm" ToolTip="Edit">
                                <i class="fas fa-edit"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                <i class="fas fa-trash"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" ToolTip="Update">
                                <i class="fas fa-check"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" ToolTip="Cancel">
                                <i class="fas fa-times"></i>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination" />
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
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
