<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TutorNest.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2>About Us</h2>
                <ol>
                    <li><a href="Default.aspx">Home</a></li>
                    <li>About Us</li>
                </ol>
            </div>
        </div>
    </section>
    <!-- End About Us Section -->

    <!-- ======= About Section ======= -->
    <section class="about" data-aos="fade-up">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <img src="assets/img/about.jpg" class="img-fluid" alt="About Tutor Nest">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0">
                    <h3>Empowering Learners and Tutors Worldwide</h3>
                    <p class="font-italic">
                        Tutor Nest is a comprehensive tutor management system designed to connect students with highly qualified tutors. 
                        Our platform makes learning and teaching seamless, flexible, and accessible to everyone.
                    </p>
                    <ul>
                        <li><i class="icofont-check-circled"></i>Find the best tutors in various subjects and fields.</li>
                        <li><i class="icofont-check-circled"></i>Track your learning progress with detailed reports and feedback.</li>
                        <li><i class="icofont-check-circled"></i>Book sessions at your convenience with flexible scheduling options.</li>
                    </ul>
                    <p>
                        At Tutor Nest, we believe in the power of education to transform lives. 
                        Our mission is to provide a platform where students and tutors can connect, collaborate, and achieve their goals.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!-- End About Section -->

    <!-- ======= Facts Section ======= -->
    <section class="facts section-bg" data-aos="fade-up">
        <div class="container">
            <div class="row counters">
                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">500</span>
                    <p>Happy Students</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">200</span>
                    <p>Qualified Tutors</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">1,000</span>
                    <p>Hours of Tutoring</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">10</span>
                    <p>Countries Served</p>
                </div>
            </div>
        </div>
    </section>
    <!-- End Facts Section -->


    <!-- ======= Testimonials Section ======= -->
    <section class="testimonials" data-aos="fade-up">
        <div class="container">
            <div class="section-title">
                <h2>Testimonials</h2>
                <p>
                    Hear from our students and tutors about their experiences with Tutor Nest. 
                    We are proud to have made a positive impact on their learning journeys.
                </p>
            </div>

            <div class="owl-carousel testimonials-carousel">
                <div class="testimonial-item">
                    <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="Student Testimonial">
                    <h3>John Doe</h3>
                    <h4>Student</h4>
                    <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        Tutor Nest helped me find the perfect tutor for my math classes. The platform is easy to use, and the tutors are highly qualified.
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                    </p>
                </div>

                <div class="testimonial-item">
                    <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="Tutor Testimonial">
                    <h3>Jane Doe</h3>
                    <h4>Tutor</h4>
                    <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        I love teaching on Tutor Nest! The platform is well-organized, and I can easily connect with students from around the world.
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                    </p>
                </div>

                <div class="testimonial-item">
                    <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="Parent Testimonial">
                    <h3>Jane Smith</h3>
                    <h4>Parent</h4>
                    <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        My child has improved significantly in school thanks to the amazing tutors on Tutor Nest. Highly recommended!
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!-- End Testimonials Section -->

</asp:Content>