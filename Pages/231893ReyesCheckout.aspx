<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesCheckout.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesCheckout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Checkout Section -->
    <div class="container-fluid py-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="display-6 fw-bold">
                    <i class="bi bi-credit-card me-2"></i>Checkout
                </h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="231893ReyesLandingPage.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="231893ReyesCart.aspx">Cart</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Order Success Panel (Hidden by default) -->
        <asp:Panel ID="pnlOrderSuccess" runat="server" Visible="false">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-success shadow-lg">
                        <div class="card-header bg-success text-white text-center py-4">
                            <i class="bi bi-check-circle-fill" style="font-size: 4rem;"></i>
                            <h3 class="mt-3 mb-0">Order Successfully Placed!</h3>
                        </div>
                        <div class="card-body text-center p-5">
                            <h4 class="text-success mb-3">Thank you for your purchase!</h4>
                            <p class="lead mb-4">
                                Your order has been confirmed and is being processed. 
                                You will receive an email confirmation shortly.
                            </p>
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <div class="border rounded p-3 mb-3">
                                        <h6 class="fw-bold text-muted">Order Number</h6>
                                        <asp:Label ID="lblOrderNumber" runat="server" CssClass="h5 text-primary"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="border rounded p-3 mb-3">
                                        <h6 class="fw-bold text-muted">Order Total</h6>
                                        <asp:Label ID="lblOrderTotal" runat="server" CssClass="h5 text-success"></asp:Label>
                                    </div>
                                </div>
                            </div>
                   
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Checkout Form Panel (Visible by default) -->
        <asp:Panel ID="pnlCheckoutForm" runat="server">
            <div class="row">
                <!-- Billing Information -->
                <div class="col-lg-8">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="bi bi-person-fill me-2"></i>Billing Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtFirstName" class="form-label fw-semibold">First Name</label>
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" 
                                               placeholder="Enter first name"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="txtLastName" class="form-label fw-semibold">Last Name</label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" 
                                               placeholder="Enter last name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="txtEmail" class="form-label fw-semibold">Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                           TextMode="Email" placeholder="Enter email address"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="txtPhone" class="form-label fw-semibold">Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" 
                                           placeholder="Enter phone number"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="txtAddress" class="form-label fw-semibold">Street Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" 
                                           placeholder="Enter street address"></asp:TextBox>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtCity" class="form-label fw-semibold">City</label>
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" 
                                               placeholder="Enter city"></asp:TextBox>
                                </div>
              
                                <div class="col-md-3 mb-3">
                                    <label for="txtZipCode" class="form-label fw-semibold">ZIP Code</label>
                                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" 
                                               placeholder="ZIP Code"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Information -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="bi bi-credit-card me-2"></i>Payment Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label for="txtCardNumber" class="form-label fw-semibold">Card Number</label>
                                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" 
                                           placeholder="1234 5678 9012 3456" MaxLength="19"></asp:TextBox>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtExpiryDate" class="form-label fw-semibold">Expiry Date</label>
                                    <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" 
                                               placeholder="MM/YY" MaxLength="5"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="txtCVV" class="form-label fw-semibold">CVV</label>
                                    <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" 
                                               placeholder="123" MaxLength="4"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="txtCardName" class="form-label fw-semibold">Name on Card</label>
                                <asp:TextBox ID="txtCardName" runat="server" CssClass="form-control" 
                                           placeholder="Enter name as on card"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="col-lg-4">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0"><i class="bi bi-list-check me-2"></i>Order Summary</h5>
                        </div>
                        <div class="card-body">
                            <!-- Order Items -->
                            <asp:Repeater ID="rptOrderItems" runat="server">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
                                        <img src='<%# Eval("ImageUrl") %>' 
                                             class="rounded me-3" 
                                             alt='<%# Eval("ProductName") %>'
                                             style="width: 50px; height: 50px; object-fit: cover;">
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1"><%# Eval("ProductName") %></h6>
                                            <small class="text-muted">Qty: <%# Eval("Quantity") %></small>
                                        </div>
                                        <div class="text-end">
                                            <span class="fw-bold">₱<%# Eval("TotalPrice", "{0:F2}") %></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <!-- Order Totals -->
                            <div class="mt-3">
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Subtotal:</span>
                                    <asp:Label ID="lblCheckoutSubtotal" runat="server" CssClass="fw-bold"></asp:Label>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Shipping:</span>
                                    <span class="text-success">Free</span>
                                </div>
                 
                                <hr>
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="h5">Total:</span>
                                    <asp:Label ID="lblCheckoutTotal" runat="server" CssClass="h5 text-primary fw-bold"></asp:Label>
                                </div>
                            </div>

                            <!-- Place Order Button -->
                            <div class="d-grid">
                                <asp:Button ID="btnPlaceOrder" runat="server" 
                                           CssClass="btn btn-success btn-lg" 
                                           Text="Place Order" 
                                           OnClick="btnPlaceOrder_Click" />
                            </div>
                            
                            <!-- Continue Shopping Link -->
                            <div class="text-center mt-3">
                                <asp:Button ID="btnBackToCart" runat="server" 
                                           CssClass="btn btn-link" 
                                           Text="← Back to Cart" 
                                           OnClick="btnBackToCart_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

    <!-- Message Area -->
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-dismissible fade show" 
               Visible="false" role="alert">
        <span id="messageText" runat="server"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Label>

</asp:Content>
