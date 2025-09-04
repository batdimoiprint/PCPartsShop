<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesSignUp.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Registration Section -->
    <div class="container-fluid py-5" style="min-height: 80vh;">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-lg border-0">
                    <div class="card-header bg-success text-white text-center py-4">
                        <h4 class="mb-0">
                            <i class="bi bi-person-plus-fill me-2"></i>Create Account
                        </h4>
                    </div>
                    <div class="card-body p-4">
                        <!-- First Name Field -->
                        <div class="mb-3">
                            <label for="txtFirstName" class="form-label fw-semibold">
                                <i class="bi bi-person me-1"></i>First Name
                            </label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-lg" 
                                       placeholder="Enter your first name"></asp:TextBox>
                        </div>

                        <!-- Last Name Field -->
                        <div class="mb-3">
                            <label for="txtLastName" class="form-label fw-semibold">
                                <i class="bi bi-person me-1"></i>Last Name
                            </label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-lg" 
                                       placeholder="Enter your last name"></asp:TextBox>
                        </div>

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
                                       TextMode="Password" placeholder="Create a password"></asp:TextBox>
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="mb-3">
                            <label for="txtConfirmPassword" class="form-label fw-semibold">
                                <i class="bi bi-lock-fill me-1"></i>Confirm Password
                            </label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-lg" 
                                       TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                        </div>

                        <!-- Phone Number Field -->
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label fw-semibold">
                                <i class="bi bi-telephone me-1"></i>Phone Number
                            </label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control form-control-lg" 
                                       placeholder="Enter your phone number"></asp:TextBox>
                        </div>

                        <!-- Success/Error Message -->
                        <div class="mb-3">
                            <asp:Label ID="lblMessage" runat="server" CssClass="alert d-block" 
                                     Visible="false" role="alert"></asp:Label>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="form-check mb-4">
                            <input class="form-check-input" type="checkbox" id="chkTerms">
                            <label class="form-check-label" for="chkTerms">
                                I agree to the <a href="#" class="text-decoration-none">Terms and Conditions</a> and 
                                <a href="#" class="text-decoration-none">Privacy Policy</a>
                            </label>
                        </div>

                        <!-- Sign Up Button -->
                        <div class="d-grid mb-3">
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-success btn-lg" 
                                      Text="Create Account" OnClick="btnSignUp_Click" />
                        </div>

                        <!-- Divider -->
                        <hr class="my-4">

                        <!-- Login Link -->
                        <div class="text-center">
                            <p class="mb-0">Already have an account? 
                                <a href="231893ReyesLogin.aspx" class="text-decoration-none fw-semibold">
                                    <i class="bi bi-box-arrow-in-right me-1"></i>Sign In
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
