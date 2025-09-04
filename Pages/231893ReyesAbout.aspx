<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesAbout.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesAbout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- About Hero Section -->
    <div class="container-fluid py-5">
        <div class="row align-items-center min-vh-75">
            <div class="col-lg-6 order-lg-1 order-2">
                <div class="pe-lg-5">
                    <h1 class="display-4 fw-bold text-primary mb-4">About PCPartsShop</h1>
                    <p class="lead text-muted mb-4">
                        Your trusted partner in computer hardware and technology solutions. We've been serving 
                        tech enthusiasts, gamers, and professionals with premium quality computer parts at 
                        competitive prices for over a decade.
                    </p>
                    <p class="mb-4">
                        From cutting-edge graphics cards and processors to reliable storage solutions and 
                        peripherals, we offer everything you need to build, upgrade, or maintain your 
                        perfect computer setup.
                    </p>
                    <div class="d-flex gap-3">
                        <button class="btn btn-primary btn-lg">
                            <i class="bi bi-cart3 me-2"></i>Shop Now
                        </button>
                        <button class="btn btn-outline-primary btn-lg">
                            <i class="bi bi-telephone me-2"></i>Contact Us
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 order-lg-2 order-1 mb-4 mb-lg-0">
                <div class="text-center">
                    <img src="https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp" 
                         class="img-fluid rounded-3 shadow-lg" 
                         alt="PC Parts and Technology"
                         style="max-width: 500px;">
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container-fluid py-5 bg-light">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="display-5 fw-bold text-dark mb-3">Why Choose PCPartsShop?</h2>
                    <p class="lead text-muted">We're committed to providing the best computer parts shopping experience</p>
                </div>
            </div>
            <div class="row g-4">
                <!-- Feature 1 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="mb-3">
                                <i class="bi bi-shield-check-fill text-success" style="font-size: 3rem;"></i>
                            </div>
                            <h5 class="card-title fw-bold">Quality Guaranteed</h5>
                            <p class="card-text text-muted">
                                All our products are sourced directly from manufacturers and come with 
                                full warranty protection.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Feature 2 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="mb-3">
                                <i class="bi bi-lightning-charge-fill text-warning" style="font-size: 3rem;"></i>
                            </div>
                            <h5 class="card-title fw-bold">Fast Shipping</h5>
                            <p class="card-text text-muted">
                                Quick processing and reliable shipping options to get your parts 
                                delivered when you need them.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Feature 3 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="mb-3">
                                <i class="bi bi-people-fill text-info" style="font-size: 3rem;"></i>
                            </div>
                            <h5 class="card-title fw-bold">Expert Support</h5>
                            <p class="card-text text-muted">
                                Our knowledgeable team is here to help you find the right parts 
                                for your specific needs.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics Section -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="p-3">
                        <h3 class="display-6 fw-bold text-primary">10K+</h3>
                        <p class="text-muted mb-0">Happy Customers</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="p-3">
                        <h3 class="display-6 fw-bold text-success">5K+</h3>
                        <p class="text-muted mb-0">Products Available</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="p-3">
                        <h3 class="display-6 fw-bold text-warning">15+</h3>
                        <p class="text-muted mb-0">Years Experience</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="p-3">
                        <h3 class="display-6 fw-bold text-info">24/7</h3>
                        <p class="text-muted mb-0">Customer Support</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mission Section -->
    <div class="container-fluid py-5 bg-primary text-white">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="display-5 fw-bold mb-4">Our Mission</h2>
                    <p class="lead mb-4">
                        To empower technology enthusiasts, gamers, and professionals with access to 
                        the latest and most reliable computer hardware at competitive prices.
                    </p>
                    <p class="mb-4">
                        We believe that everyone should have access to high-quality computer parts 
                        to build their dream systems, whether for gaming, content creation, or professional work.
                    </p>
                    <button class="btn btn-light btn-lg">
                        <i class="bi bi-arrow-right me-2"></i>Start Building Today
                    </button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
