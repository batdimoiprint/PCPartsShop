<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesProfile.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Profile Section -->
    <div class="container-fluid py-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="display-6 fw-bold">
                    <i class="bi bi-person-circle me-2"></i>My Profile
                </h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="231893ReyesLandingPage.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Profile</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Profile Content -->
        <div class="row">
            <!-- Profile Information -->
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-person-fill me-2"></i>Personal Information</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">First Name</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <asp:Label ID="lblFirstName" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">Last Name</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <asp:Label ID="lblLastName" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">Email Address</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <i class="bi bi-envelope me-2 text-primary"></i>
                                    <asp:Label ID="lblEmail" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">Phone Number</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <i class="bi bi-telephone me-2 text-success"></i>
                                    <asp:Label ID="lblPhone" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">Account Type</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <i class="bi bi-shield-check me-2 text-info"></i>
                                    <asp:Label ID="lblRole" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold text-muted">Member Since</label>
                                <div class="form-control-plaintext border rounded p-2 bg-light">
                                    <i class="bi bi-calendar-check me-2 text-warning"></i>
                                    <asp:Label ID="lblRegistrationDate" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="card shadow-sm mt-4">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0"><i class="bi bi-lightning-fill me-2"></i>Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Button ID="btnViewOrders" runat="server" CssClass="btn btn-outline-primary w-100" 
                                           Text="📦 View My Orders" OnClick="btnViewOrders_Click" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Button ID="btnViewCart" runat="server" CssClass="btn btn-outline-info w-100" 
                                           Text="🛒 View Shopping Cart" OnClick="btnViewCart_Click" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Button ID="btnContinueShopping" runat="server" CssClass="btn btn-outline-success w-100" 
                                           Text="🛍️ Continue Shopping" OnClick="btnContinueShopping_Click" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-outline-danger w-100" 
                                           Text="🚪 Logout" OnClick="btnLogout_Click" 
                                           OnClientClick="return confirm('Are you sure you want to logout?');" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Profile Stats & Summary -->
            <div class="col-lg-4">
                <!-- Profile Stats -->
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0"><i class="bi bi-graph-up me-2"></i>Account Summary</h5>
                    </div>
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <div class="rounded-circle bg-primary d-inline-flex align-items-center justify-content-center" 
                                 style="width: 80px; height: 80px;">
                                <i class="bi bi-person-fill text-white" style="font-size: 2.5rem;"></i>
                            </div>
                            <h4 class="mt-3 mb-1">
                                <asp:Label ID="lblFullName" runat="server" CssClass="fw-bold"></asp:Label>
                            </h4>
                            <small class="text-muted">
                                <asp:Label ID="lblAccountType" runat="server"></asp:Label>
                            </small>
                        </div>
                        
                        <div class="row text-center">
                            <div class="col-6 border-end">
                                <h4 class="text-primary mb-0">
                                    <asp:Label ID="lblOrderCount" runat="server" Text="0"></asp:Label>
                                </h4>
                                <small class="text-muted">Total Orders</small>
                            </div>
                            <div class="col-6">
                                <h4 class="text-success mb-0">
                                    <asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>
                                </h4>
                                <small class="text-muted">Items in Cart</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Demo Account Info -->
                <asp:Panel ID="pnlDemoInfo" runat="server" Visible="false">
                    <div class="card border-warning shadow-sm">
                        <div class="card-header bg-warning text-dark">
                            <h6 class="mb-0"><i class="bi bi-info-circle me-2"></i>Demo Account</h6>
                        </div>
                        <div class="card-body">
                            <p class="mb-2">
                                <small>
                                    This is a demo account. In a real application, you would be able to 
                                    edit your profile information and manage your account settings.
                                </small>
                            </p>
                            <div class="text-center">
                                <small class="text-muted">
                                    <i class="bi bi-shield-check me-1"></i>
                                    Account secured with demo credentials
                                </small>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- Registration Info -->
                <asp:Panel ID="pnlRegisteredInfo" runat="server" Visible="false">
                    <div class="card border-success shadow-sm">
                        <div class="card-header bg-success text-white">
                            <h6 class="mb-0"><i class="bi bi-check-circle me-2"></i>Registered Account</h6>
                        </div>
                        <div class="card-body">
                            <p class="mb-2">
                                <small>
                                    Thank you for registering with PCPartsShop! Your account information 
                                    is stored securely in our system.
                                </small>
                            </p>
                            <div class="text-center">
                                <small class="text-muted">
                                    <i class="bi bi-shield-fill me-1"></i>
                                    Account verified and secure
                                </small>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <!-- Message Area -->
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-dismissible fade show" 
               Visible="false" role="alert">
        <span id="messageText" runat="server"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Label>

</asp:Content>
