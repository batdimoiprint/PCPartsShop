<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesLogin.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Login Section -->
    <div class="container-fluid py-5" style="min-height: 80vh;">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <div class="card shadow-lg border-0">
                    <div class="card-header bg-primary text-white text-center py-4">
                        <h4 class="mb-0">
                            <i class="bi bi-person-circle me-2"></i>Member Login
                        </h4>
                    </div>
                    <div class="card-body p-4">
                        <!-- Email Field -->
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label fw-semibold">
                                <i class="bi bi-envelope me-1"></i>Email Address
                            </label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" 
                                       TextMode="Email" placeholder="Enter your email address"></asp:TextBox>
                        </div>

                        <!-- Password Field -->
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label fw-semibold">
                                <i class="bi bi-lock me-1"></i>Password
                            </label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" 
                                       TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        </div>

                        <!-- Error Message -->
                        <div class="mb-3">
                            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger d-block" 
                                     Visible="false" role="alert"></asp:Label>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="row mb-4">
                            <div class="col-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">
                                        Remember me
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 text-end">
                                <a href="#" class="text-decoration-none small">
                                    <i class="bi bi-question-circle me-1"></i>Forgot password?
                                </a>
                            </div>
                        </div>

                        <!-- Login Button -->
                        <div class="d-grid mb-3">
                            <asp:Button ID="btnLoginSubmit" runat="server" CssClass="btn btn-primary btn-lg" 
                                      Text="Login" OnClick="btnLoginSubmit_Click" />
                        </div>

                        <!-- Divider -->
                        <hr class="my-4">

                        <!-- Sign Up Link -->
                        <div class="text-center">
                            <p class="mb-0">Don't have an account? 
                                <a href="231893ReyesSignUp.aspx" class="text-decoration-none fw-semibold">
                                    <i class="bi bi-person-plus me-1"></i>Create Account
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
