<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesCart.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Shopping Cart Section -->
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="display-6 fw-bold">
                        <i class="bi bi-cart3 me-2"></i>Shopping Cart
                    </h2>
                    <asp:Button ID="btnContinueShopping" runat="server" 
                               CssClass="btn btn-outline-primary" 
                               Text="Continue Shopping" 
                               OnClick="btnContinueShopping_Click" />
                </div>
            </div>
        </div>

        <!-- Cart Items -->
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                            <div class="text-center py-5">
                                <i class="bi bi-cart-x text-muted" style="font-size: 4rem;"></i>
                                <h4 class="text-muted mt-3">Your cart is empty</h4>
                                <p class="text-muted">Add some products to your cart to see them here.</p>
                                <asp:Button ID="btnShopNow" runat="server" 
                                           CssClass="btn btn-primary btn-lg" 
                                           Text="Shop Now" 
                                           OnClick="btnShopNow_Click" />
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlCartItems" runat="server">
                            <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                                <ItemTemplate>
                                    <div class="row align-items-center border-bottom py-3">
                                        <div class="col-md-2">
                                            <img src='<%# Eval("ImageUrl") %>' 
                                                 class="img-fluid rounded" 
                                                 alt='<%# Eval("ProductName") %>'
                                                 style="height: 80px; object-fit: cover;">
                                        </div>
                                        <div class="col-md-4">
                                            <h6 class="fw-bold mb-1"><%# Eval("ProductName") %></h6>
                                            <small class="text-muted"><%# Eval("Category") %></small>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="fw-bold">$<%# Eval("Price", "{0:F2}") %></span>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="d-flex align-items-center">
                                                <asp:Button ID="btnDecrease" runat="server" 
                                                           CssClass="btn btn-outline-secondary btn-sm" 
                                                           Text="-" 
                                                           CommandName="DecreaseQuantity"
                                                           CommandArgument='<%# Eval("ProductId") %>' />
                                                <span class="mx-2 fw-bold"><%# Eval("Quantity") %></span>
                                                <asp:Button ID="btnIncrease" runat="server" 
                                                           CssClass="btn btn-outline-secondary btn-sm" 
                                                           Text="+" 
                                                           CommandName="IncreaseQuantity"
                                                           CommandArgument='<%# Eval("ProductId") %>' />
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <span class="fw-bold text-primary">$<%# Eval("TotalPrice", "{0:F2}") %></span>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Button ID="btnRemove" runat="server" 
                                                       CssClass="btn btn-outline-danger btn-sm" 
                                                       Text="×" 
                                                       CommandName="RemoveItem"
                                                       CommandArgument='<%# Eval("ProductId") %>'
                                                       OnClientClick="return confirm('Remove this item from cart?');" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </div>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Order Summary</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal:</span>
                            <asp:Label ID="lblSubtotal" runat="server" CssClass="fw-bold"></asp:Label>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Shipping:</span>
                            <asp:Label ID="lblShipping" runat="server" Text="Free" CssClass="text-success"></asp:Label>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Tax:</span>
                            <asp:Label ID="lblTax" runat="server" CssClass="fw-bold"></asp:Label>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-3">
                            <span class="h5">Total:</span>
                            <asp:Label ID="lblTotal" runat="server" CssClass="h5 text-primary fw-bold"></asp:Label>
                        </div>
                        <div class="d-grid">
                            <asp:Button ID="btnCheckout" runat="server" 
                                       CssClass="btn btn-primary btn-lg" 
                                       Text="Proceed to Checkout" 
                                       OnClick="btnCheckout_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Success/Error Messages -->
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-dismissible fade show" 
               Visible="false" role="alert">
        <span id="messageText" runat="server"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Label>

</asp:Content>
