<%@ Page Title="" Language="C#" MasterPageFile="~/TutorNest.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TutorNest.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex justify-content-center align-items-center">
        <div id="heroCarousel" class="container carousel carousel-fade" data-ride="carousel">

            <!-- Slide 1 -->
            <div class="carousel-item active">
                <div class="carousel-container">
                    <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Tutor Nest</span></h2>
                    <p class="animate__animated animate__fadeInUp">
                        Tutor Nest is your one-stop solution for managing tutors and students efficiently. 
                    Connect with experienced tutors, track progress, and achieve your learning goals seamlessly.
                    </p>
                    <a href="#about" class="btn-get-started animate__animated animate__fadeInUp">Get Started</a>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item">
                <div class="carousel-container">
                    <h2 class="animate__animated animate__fadeInDown">Find the Best Tutors</h2>
                    <p class="animate__animated animate__fadeInUp">
                        Discover highly qualified tutors in various subjects and fields. 
                    Whether you need help with academics, professional skills, or hobbies, we’ve got you covered.
                    </p>
                    <a href="#tutors" class="btn-get-started animate__animated animate__fadeInUp">Browse Tutors</a>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item">
                <div class="carousel-container">
                    <h2 class="animate__animated animate__fadeInDown">Track Progress & Achievements</h2>
                    <p class="animate__animated animate__fadeInUp">
                        Monitor your learning journey with detailed progress reports and feedback from tutors. 
                    Stay motivated and achieve your goals faster with Tutor Nest.
                    </p>
                    <a href="#features" class="btn-get-started animate__animated animate__fadeInUp">Learn More</a>
                </div>
            </div>

            <!-- Carousel Controls -->
            <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon bx bx-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>

            <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon bx bx-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>
    </section>
    <!-- End Hero -->


   <!-- ======= Services Section ======= -->
<section class="services" id="services">
    <div class="container">

        <!-- Section Title -->
        <div class="section-title">
            <h2>Our Services</h2>
            <p>
                Tutor Nest offers a range of services to make learning and teaching seamless. 
                Explore how we can help you achieve your educational goals.
            </p>
        </div>

        <div class="row">
            <!-- Service 1: Find Tutors -->
            <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up">
                <div class="icon-box icon-box-pink">
                    <div class="icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <h4 class="title"><a href="find-tutors.html">Find Tutors</a></h4>
                    <p class="description">
                        Discover highly qualified tutors in various subjects and fields. 
                        Connect with experts to achieve your learning goals.
                    </p>
                    <a href="find-tutors.html" class="btn btn-primary mt-3">Learn More</a>
                </div>
            </div>

            <!-- Service 2: Track Progress -->
            <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                <div class="icon-box icon-box-cyan">
                    <div class="icon"><i class="fas fa-chart-line"></i></div>
                    <h4 class="title"><a href="track-progress.html">Track Progress</a></h4>
                    <p class="description">
                        Monitor your learning journey with detailed progress reports and feedback from tutors.
                    </p>
                    <a href="track-progress.html" class="btn btn-primary mt-3">Learn More</a>
                </div>
            </div>

            <!-- Service 3: Flexible Scheduling -->
            <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box icon-box-green">
                    <div class="icon"><i class="fas fa-calendar-alt"></i></div>
                    <h4 class="title"><a href="flexible-scheduling.html">Flexible Scheduling</a></h4>
                    <p class="description">
                        Book sessions at your convenience with flexible scheduling options tailored to your needs.
                    </p>
                    <a href="flexible-scheduling.html" class="btn btn-primary mt-3">Learn More</a>
                </div>
            </div>

            <!-- Service 4: Global Reach -->
            <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box icon-box-blue">
                    <div class="icon"><i class="fas fa-globe"></i></div>
                    <h4 class="title"><a href="global-reach.html">Global Reach</a></h4>
                    <p class="description">
                        Access tutors from around the world and learn from the best, no matter where you are.
                    </p>
                    <a href="global-reach.html" class="btn btn-primary mt-3">Learn More</a>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- End Services Section -->



    <!-- ======= Features Section ======= -->
    <section class="features">
        <div class="container">

            <!-- Section Title -->
            <div class="section-title">
                <h2>Features</h2>
                <p>
                    Tutor Nest is designed to make learning and teaching seamless. 
                Explore the features that make us the best choice for managing tutors and students.
                </p>
            </div>

            <!-- Feature 1: Find the Best Tutors -->
            <div class="row" data-aos="fade-up">
                <div class="col-md-5">
                    <div class="feature-image">
                        <img src="assets/img/tutor.jpg" class="img-fluid" alt="Find Tutors">
                    </div>
                </div>
                <div class="col-md-7 pt-4">
                    <h3>Find the Best Tutors</h3>
                    <p class="font-italic">
                        Connect with highly qualified tutors in various subjects and fields.
                    </p>
                    <ul>
                        <li><i class="fas fa-check"></i>Search tutors by subject, qualification, or experience.</li>
                        <li><i class="fas fa-check"></i>View detailed profiles and reviews.</li>
                    </ul>
                </div>
            </div>

            <!-- Feature 2: Track Your Progress -->
            <div class="row" data-aos="fade-up">
                <div class="col-md-5 order-1 order-md-2">
                    <div class="feature-image">
                        <img src="assets/img/progress.jpg" class="img-fluid" alt="Track Progress">
                    </div>
                </div>
                <div class="col-md-7 pt-5 order-2 order-md-1">
                    <h3>Track Your Progress</h3>
                    <p class="font-italic">
                        Monitor your learning journey with detailed progress reports.
                    </p>
                    <p>
                        Stay motivated and achieve your goals with regular feedback from tutors. 
                    Our platform provides insights into your performance and areas for improvement.
                    </p>
                </div>
            </div>

            <!-- Feature 3: Flexible Scheduling -->
            <div class="row" data-aos="fade-up">
                <div class="col-md-5">
                    <div class="feature-image">
                        <img src="assets/img/scheduling.jpg" class="img-fluid" alt="Flexible Scheduling">
                    </div>
                </div>
                <div class="col-md-7 pt-5">
                    <h3>Flexible Scheduling</h3>
                    <p>
                        Book sessions at your convenience with flexible scheduling options.
                    </p>
                    <ul>
                        <li><i class="fas fa-check"></i>Choose from multiple time slots.</li>
                        <li><i class="fas fa-check"></i>Reschedule or cancel sessions easily.</li>
                        <li><i class="fas fa-check"></i>Get reminders for upcoming sessions.</li>
                    </ul>
                </div>
            </div>

            <!-- Feature 4: Global Reach -->
            <div class="row" data-aos="fade-up">
                <div class="col-md-5 order-1 order-md-2">
                    <div class="feature-image">
                        <img src="assets/img/global-reach.jpg" class="img-fluid" alt="Global Reach">
                    </div>
                </div>
                <div class="col-md-7 pt-5 order-2 order-md-1">
                    <h3>Global Reach</h3>
                    <p class="font-italic">
                        Access tutors from around the world and learn from the best.
                    </p>
                    <p>
                        Whether you're in the same city or across the globe, Tutor Nest connects you with experienced tutors 
                    who can help you achieve your learning goals.
                    </p>
                </div>
            </div>

        </div>
    </section>
    <!-- End Features Section -->


</asp:Content>
