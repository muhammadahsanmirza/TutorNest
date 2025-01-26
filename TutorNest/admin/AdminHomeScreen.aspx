<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/admin/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminHomeScreen.aspx.cs" Inherits="TutorNest.admin.AdminHomeScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Additional CSS for the home screen -->
    <style>
        .card {
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .quick-links a {
            text-decoration: none;
            color: inherit;
        }
        .quick-links .card:hover {
            background-color: #f8f9fa;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <!-- Key Metrics Section -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Total Tutors</h5>
                        <h2 class="card-text">150</h2>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Total Students</h5>
                        <h2 class="card-text">500</h2>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Pending Requests</h5>
                        <h2 class="card-text">12</h2>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Total Revenue</h5>
                        <h2 class="card-text">$10,000</h2>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Links Section -->
        <div class="row">
            <div class="col-lg-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-tasks mr-1"></i>
                        Quick Actions
                    </div>
                    <div class="card-body quick-links">
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="card h-100 text-center">
                                    <div class="card-body">
                                        <i class="fas fa-user-plus fa-3x mb-3"></i>
                                        <h5 class="card-title">Add New Tutor</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="card h-100 text-center">
                                    <div class="card-body">
                                        <i class="fas fa-book fa-3x mb-3"></i>
                                        <h5 class="card-title">Manage Courses</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="card h-100 text-center">
                                    <div class="card-body">
                                        <i class="fas fa-envelope fa-3x mb-3"></i>
                                        <h5 class="card-title">View Messages</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="card h-100 text-center">
                                    <div class="card-body">
                                        <i class="fas fa-cog fa-3x mb-3"></i>
                                        <h5 class="card-title">Settings</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity Section -->
            <div class="col-lg-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-history mr-1"></i>
                        Recent Activity
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">New tutor registered - John Doe</li>
                            <li class="list-group-item">Course "Mathematics 101" updated</li>
                            <li class="list-group-item">New student enrolled - Jane Smith</li>
                            <li class="list-group-item">Revenue of $500 generated</li>
                            <li class="list-group-item">Pending request approved</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>