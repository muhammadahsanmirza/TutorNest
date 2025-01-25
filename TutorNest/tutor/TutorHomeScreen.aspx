<%@ Page Title="" Language="C#" MasterPageFile="~/tutor/TutorDashboard.Master" AutoEventWireup="true" CodeBehind="TutorHomeScreen.aspx.cs" Inherits="TutorNest.tutor.TutorHomeScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .welcome-section {
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .welcome-section h1 {
            font-size: 2.5rem;
            color: #343a40;
        }

        .welcome-section p {
            font-size: 1.2rem;
            color: #666;
        }

        .stats-card {
            background-color: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .stats-card h3 {
            font-size: 1.5rem;
            color: #343a40;
            margin-bottom: 10px;
        }

        .stats-card p {
            font-size: 1rem;
            color: #666;
        }

        .quick-links {
            margin-top: 30px;
        }

        .quick-links .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .quick-links .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .quick-links .card-body {
            text-align: center;
            padding: 20px;
        }

        .quick-links .card-body i {
            font-size: 2rem;
            color: #007bff;
            margin-bottom: 15px;
        }

        .quick-links .card-body h5 {
            font-size: 1.25rem;
            color: #343a40;
            margin-bottom: 10px;
        }

        .quick-links .card-body p {
            font-size: 1rem;
            color: #666;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1>Welcome, <%: Session["tutor_username"] %>!</h1>
            <p>Manage your students, track progress, and make a difference in their learning journey.</p>
        </div>

        <!-- Quick Stats Section -->
        <div class="row">
            <div class="col-md-4">
                <div class="stats-card">
                    <h3>25</h3>
                    <p>Total Students</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card">
                    <h3>15</h3>
                    <p>Active Sessions</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card">
                    <h3>95%</h3>
                    <p>Student Satisfaction</p>
                </div>
            </div>
        </div>

        <!-- Quick Links Section -->
        <div class="row quick-links">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-user-graduate"></i>
                        <h5>View Students</h5>
                        <p>Manage and interact with your students.</p>
                        <a href="ViewStudents.aspx" class="btn btn-primary">Go to Students</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-calendar-alt"></i>
                        <h5>Schedule Sessions</h5>
                        <p>Plan and organize your tutoring sessions.</p>
                        <a href="#" class="btn btn-primary">Schedule Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-chart-line"></i>
                        <h5>Track Progress</h5>
                        <p>Monitor your students' learning progress.</p>
                        <a href="#" class="btn btn-primary">View Progress</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>