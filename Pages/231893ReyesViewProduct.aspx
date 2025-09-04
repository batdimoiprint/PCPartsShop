<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesViewProduct.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesViewProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Product Details Section -->
    <div class="container-fluid py-4">


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
                                       Text="🛍️ Back to Products" />
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
                                      style="height: 400px; object-fit: cover;" />
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
                            <div class="mb-3">
                                <h3 class="text-primary fw-bold mb-2">
                                    $<asp:Label ID="lblProductPrice" runat="server"></asp:Label>
                                </h3>
                                <div class="d-flex gap-2">
                                    <asp:Label ID="lblTag1" runat="server" CssClass="badge bg-outline-primary"></asp:Label>
                                    <asp:Label ID="lblTag2" runat="server" CssClass="badge bg-outline-secondary"></asp:Label>
                                </div>
                            </div>

                            <!-- Product Description -->
                            <div class="mb-3">
                                <h5 class="fw-bold mb-2">Product Description</h5>
                                <p class="text-muted">
                                    <asp:Label ID="lblProductDescription" runat="server"></asp:Label>
                                </p>
                            </div>

                            <!-- Quantity and Add to Cart -->
                            <div class="mb-3">
                                <div class="row align-items-center">
                                    <div class="col-sm-4 mb-2">
                                        <label class="form-label fw-semibold mb-1">Quantity</label>
                                        <div class="input-group">
                                            <asp:Button ID="btnDecreaseQty" runat="server" CssClass="btn btn-outline-secondary" 
                                                       Text="−" OnClick="btnDecreaseQty_Click" />
                                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control text-center fw-bold" 
                                                        Text="1" ReadOnly="true" style="background-color: white;" />
                                            <asp:Button ID="btnIncreaseQty" runat="server" CssClass="btn btn-outline-secondary" 
                                                       Text="+" OnClick="btnIncreaseQty_Click" />
                                        </div>
                                    </div>
                                    <div class="col-sm-8 mb-2">
                                        <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-lg w-100" 
                                                   Text="🛒 Add to Cart" OnClick="btnAddToCart_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Related Products Section -->
        <asp:Panel ID="pnlRelatedProducts" runat="server">
            <div class="row mt-4">
                <div class="col-12">
                    <h4 class="fw-bold mb-3">Related Products</h4>
                </div>
            </div>
            
            <div class="row g-3">
                <asp:Repeater ID="rptRelatedProducts" runat="server" OnItemCommand="rptRelatedProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm">
                                <img src='<%# Eval("ImageUrl") %>' 
                                     class="card-img-top" alt='<%# Eval("Name") %>' 
                                     style="height: 180px; object-fit: cover;">
                                <div class="card-body d-flex flex-column">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="card-title mb-0"><%# Eval("Name") %></h6>
                                        <span class="badge bg-<%# Eval("BadgeColor") %>"><%# Eval("Badge") %></span>
                                    </div>
                                    <p class="card-text small text-muted flex-grow-1">
                                        <%# Eval("Description").ToString().Length > 60 ? 
                                            Eval("Description").ToString().Substring(0, 60) + "..." : 
                                            Eval("Description") %>
                                    </p>
                                    <div class="mb-2">
                                        <span class="h6 text-primary fw-bold">$<%# Eval("Price", "{0:F2}") %></span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <asp:Button ID="btnViewProduct" runat="server" 
                                                   CssClass="btn btn-outline-primary btn-sm"
                                                   Text="View"
                                                   CommandName="ViewProduct"
                                                   CommandArgument='<%# Eval("ProductId") %>' />
                                        <asp:Button ID="btnQuickAdd" runat="server" 
                                                   CssClass="btn btn-primary btn-sm"
                                                   Text="Add"
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

</asp:Content>
