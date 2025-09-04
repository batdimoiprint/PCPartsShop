<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesViewProduct.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesViewProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Product Details Section -->
    <div class="container-fluid py-4">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="231893ReyesLandingPage.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="231893ReyesLandingPage.aspx">Products</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <asp:Label ID="lblBreadcrumbProduct" runat="server"></asp:Label>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Product Not Found Panel -->
        <asp:Panel ID="pnlProductNotFound" runat="server" Visible="false">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-warning shadow-sm">
                        <div class="card-body text-center py-5">
                            <i class="bi bi-exclamation-triangle text-warning" style="font-size: 4rem;"></i>
                            <h4 class="text-warning mt-3">Product Not Found</h4>
                            <p class="text-muted mb-4">
                                The product you're looking for doesn't exist or has been removed.
                            </p>
                            <asp:Button ID="btnBackToProducts" runat="server" CssClass="btn btn-primary btn-lg" 
                                       Text="🛍️ Back to Products" OnClick="btnBackToProducts_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Product Details Panel -->
        <asp:Panel ID="pnlProductDetails" runat="server">
            <div class="row">
                <!-- Product Image -->
                <div class="col-lg-6 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body p-0">
                            <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid w-100 rounded" 
                                      style="height: 500px; object-fit: cover;" />
                        </div>
                    </div>
                    
                    <!-- Product Features -->
                    <div class="card shadow-sm mt-3">
                        <div class="card-header bg-info text-white">
                            <h6 class="mb-0">📋 Product Features</h6>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>High Performance</li>
                                <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>Latest Technology</li>
                                <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>Warranty Included</li>
                                <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>Free Shipping</li>
                                <li class="mb-0"><i class="bi bi-check-circle text-success me-2"></i>24/7 Support</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Product Information -->
                <div class="col-lg-6">
                    <div class="card shadow-sm">
                        <div class="card-body p-4">
                            <!-- Product Header -->
                            <div class="mb-3">
                                <div class="d-flex justify-content-between align-items-start mb-2">
                                    <h2 class="fw-bold mb-0">
                                        <asp:Label ID="lblProductName" runat="server"></asp:Label>
                                    </h2>
                                    <asp:Label ID="lblProductBadge" runat="server" CssClass="badge fs-6"></asp:Label>
                                </div>
                                <p class="text-muted mb-0">
                                    Category: <asp:Label ID="lblProductCategory" runat="server" CssClass="fw-semibold"></asp:Label>
                                </p>
                            </div>

                            <!-- Product Price -->
                            <div class="mb-4">
                                <h3 class="text-primary fw-bold mb-2">
                                    $<asp:Label ID="lblProductPrice" runat="server"></asp:Label>
                                </h3>
                                <div class="d-flex gap-2">
                                    <asp:Label ID="lblTag1" runat="server" CssClass="badge bg-outline-primary"></asp:Label>
                                    <asp:Label ID="lblTag2" runat="server" CssClass="badge bg-outline-secondary"></asp:Label>
                                </div>
                            </div>

                            <!-- Product Description -->
                            <div class="mb-4">
                                <h5 class="fw-bold mb-3">📄 Product Description</h5>
                                <p class="text-muted">
                                    <asp:Label ID="lblProductDescription" runat="server"></asp:Label>
                                </p>
                            </div>

                            <!-- Quantity and Add to Cart -->
                            <div class="mb-4">
                                <h5 class="fw-bold mb-3">🛒 Add to Cart</h5>
                                <div class="row align-items-end">
                                    <div class="col-md-4 mb-3">
                                        <label for="ddlQuantity" class="form-label fw-semibold">Quantity</label>
                                        <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="form-select form-select-lg">
                                            <asp:ListItem Value="1" Text="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-lg w-100" 
                                                   Text="🛒 Add to Cart" OnClick="btnAddToCart_Click" />
                                    </div>
                                </div>
                            </div>

                            <!-- Additional Actions -->
                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <asp:Button ID="btnBuyNow" runat="server" CssClass="btn btn-success w-100" 
                                               Text="⚡ Buy Now" OnClick="btnBuyNow_Click" />
                                </div>
                                <div class="col-md-6 mb-2">
                                    <asp:Button ID="btnBackToProducts2" runat="server" CssClass="btn btn-outline-secondary w-100" 
                                               Text="← Back to Products" OnClick="btnBackToProducts_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Specifications -->
                    <div class="card shadow-sm mt-3">
                        <div class="card-header bg-secondary text-white">
                            <h6 class="mb-0">⚙️ Specifications</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <strong>Product ID:</strong><br>
                                    <span class="text-muted">
                                        <asp:Label ID="lblProductId" runat="server"></asp:Label>
                                    </span>
                                </div>
                                <div class="col-6">
                                    <strong>Availability:</strong><br>
                                    <span class="text-success fw-bold">In Stock</span>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-6">
                                    <strong>Shipping:</strong><br>
                                    <span class="text-success">Free Shipping</span>
                                </div>
                                <div class="col-6">
                                    <strong>Warranty:</strong><br>
                                    <span class="text-info">2 Years</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Related Products Section -->
        <asp:Panel ID="pnlRelatedProducts" runat="server">
            <div class="row mt-5">
                <div class="col-12">
                    <h3 class="fw-bold mb-4">🔗 Related Products</h3>
                </div>
            </div>
            
            <div class="row g-4">
                <asp:Repeater ID="rptRelatedProducts" runat="server" OnItemCommand="rptRelatedProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm">
                                <img src='<%# Eval("ImageUrl") %>' 
                                     class="card-img-top" alt='<%# Eval("Name") %>' 
                                     style="height: 200px; object-fit: cover;">
                                <div class="card-body d-flex flex-column">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="card-title mb-0"><%# Eval("Name") %></h6>
                                        <span class="badge bg-<%# Eval("BadgeColor") %>"><%# Eval("Badge") %></span>
                                    </div>
                                    <p class="card-text small text-muted flex-grow-1">
                                        <%# Eval("Description").ToString().Length > 80 ? 
                                            Eval("Description").ToString().Substring(0, 80) + "..." : 
                                            Eval("Description") %>
                                    </p>
                                    <div class="mb-2">
                                        <span class="h6 text-primary fw-bold">$<%# Eval("Price", "{0:F2}") %></span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <asp:Button ID="btnViewProduct" runat="server" 
                                                   CssClass="btn btn-outline-primary btn-sm"
                                                   Text="👁️ View"
                                                   CommandName="ViewProduct"
                                                   CommandArgument='<%# Eval("ProductId") %>' />
                                        <asp:Button ID="btnQuickAdd" runat="server" 
                                                   CssClass="btn btn-primary btn-sm"
                                                   Text="🛒 Add"
                                                   CommandName="QuickAdd"
                                                   CommandArgument='<%# Eval("ProductId") %>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>
    </div>

    <!-- Success Message -->
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success alert-dismissible fade show" 
               Visible="false" role="alert">
        <span id="messageText" runat="server"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Label>

</asp:Content>
