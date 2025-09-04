<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesSignUp.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Registration Section -->
    <div class="container-fluid py-4">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-8">
                <!-- Header -->
                <div class="text-center mb-4">
                    <h3 class="fw-bold">Create Your AccountPCPartsShop</h3>
                    
                </div>

                <!-- Registration Content -->
                <div class="row g-4">
                    <!-- Left Column - Personal Information -->
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3 text-primary">
                                    <i class="bi bi-person-circle me-2"></i>Personal Information
                                </h5>
                                
                                <!-- Name Fields -->
                                <div class="row g-3 mb-3">
                                    <div class="col-sm-6">
                                        <label class="form-label fw-semibold small">First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" 
                                                   placeholder="John"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-semibold small">Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" 
                                                   placeholder="Doe"></asp:TextBox>
                                    </div>
                                </div>

                                <!-- Email Field -->
                                <div class="mb-3">
                                    <label class="form-label fw-semibold small">
                                        <i class="bi bi-envelope me-1"></i>Email Address
                                    </label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                               TextMode="Email" placeholder="john.doe@example.com"></asp:TextBox>
                                </div>

                                <!-- Phone Field -->
                                <div class="mb-3">
                                    <label class="form-label fw-semibold small">
                                        <i class="bi bi-telephone me-1"></i>Phone Number
                                    </label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" 
                                               placeholder="(+63) "></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column - Account Security -->
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3 text-success">
                                    <i class="bi bi-shield-lock me-2"></i>Account Security
                                </h5>

                                <!-- Password Fields -->
                                <div class="mb-3">
                                    <label class="form-label fw-semibold small">
                                        <i class="bi bi-lock me-1"></i>Password
                                    </label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                               TextMode="Password" placeholder="Create a strong password"></asp:TextBox>
                                    
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-semibold small">
                                        <i class="bi bi-lock-fill me-1"></i>Confirm Password
                                    </label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" 
                                               TextMode="Password" placeholder="Repeat your password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Success/Error Message -->
                <div class="row justify-content-center mt-3">
                    <div class="col-md-8">
                        <asp:Label ID="lblMessage" runat="server" CssClass="alert d-block" 
                                 Visible="false" role="alert"></asp:Label>
                    </div>
                </div>

                <!-- Action Section -->
                <div class="text-center mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-success btn-lg w-100 mb-3" 
                                      Text="Create My Account" OnClick="btnSignUp_Click" />
                            
                

                            <div class="border-top pt-3">
                                <p class="mb-0">Already have an account? 
                                    <a href="231893ReyesLogin.aspx" class="text-decoration-none fw-semibold">
                                        Sign In
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
