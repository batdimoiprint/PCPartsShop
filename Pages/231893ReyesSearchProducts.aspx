<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesSearchProducts.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesSearchProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Search Products Section -->
    <div class="container-fluid py-4">
        <!-- Page Header -->
        <div class="row mb-4">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="231893ReyesLandingPage.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Browse Products</li>
                    </ol>
                </nav>
                <h2 class="display-6 fw-bold">
                    <i class="bi bi-grid-3x3-gap me-2"></i>
                    <asp:Label ID="lblPageTitle" runat="server" Text="All Products"></asp:Label>
                </h2>
                <asp:Panel ID="pnlSearchInfo" runat="server" Visible="false">
                    <p class="text-muted">
                        Search results for: "<strong><asp:Label ID="lblSearchQuery" runat="server"></asp:Label></strong>"
                        - <asp:Label ID="lblResultCount" runat="server"></asp:Label> product(s) found
                    </p>
                </asp:Panel>
            </div>
        </div>

        <!-- Search and Filter Bar -->
        <div class="row mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row align-items-end">
                            <div class="col-md-6 mb-3">
                                <label for="txtSearch" class="form-label fw-semibold">🔍 Search Products</label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-lg" 
                                           placeholder="Search by name, category, or description..."></asp:TextBox>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="ddlCategory" class="form-label fw-semibold">📂 Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select form-select-lg">
                                    <asp:ListItem Value="" Text="All Categories"></asp:ListItem>
                                    <asp:ListItem Value="Graphics Cards" Text="Graphics Cards"></asp:ListItem>
                                    <asp:ListItem Value="Processors" Text="Processors"></asp:ListItem>
                                    <asp:ListItem Value="Memory" Text="Memory"></asp:ListItem>
                                    <asp:ListItem Value="Storage" Text="Storage"></asp:ListItem>
                                    <asp:ListItem Value="Motherboards" Text="Motherboards"></asp:ListItem>
                                    <asp:ListItem Value="Power Supplies" Text="Power Supplies"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3 mb-3">
                                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg w-100" 
                                           Text="🔎 Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h6 class="fw-bold mb-2">📊 Quick Stats</h6>
                        <div class="row">
                            <div class="col-6">
                                <span class="h5 text-primary"><asp:Label ID="lblTotalProducts" runat="server"></asp:Label></span><br>
                                <small class="text-muted">Total Products</small>
                            </div>
                            <div class="col-6">
                                <span class="h5 text-success"><asp:Label ID="lblDisplayedProducts" runat="server"></asp:Label></span><br>
                                <small class="text-muted">Showing</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search Results Section -->
        <asp:Panel ID="pnlSearchResults" runat="server">
            <div class="row mb-4">
                <div class="col-12">
                    <h4 class="fw-bold">
                        🎯 Search Results
                        <asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-outline-secondary btn-sm ms-2" 
                                   Text="❌ Clear Search" OnClick="btnClearSearch_Click" />
                    </h4>
                </div>
            </div>
            
            <div class="row g-4 mb-5">
                <asp:Repeater ID="rptSearchResults" runat="server" OnItemCommand="rptSearchResults_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card h-100 shadow-sm border-primary">
                                <div class="badge bg-warning text-dark position-absolute" style="top: 10px; right: 10px; z-index: 1;">
                                    🔍 Match
                                </div>
                                <asp:LinkButton ID="lnkProductImage" runat="server" 
                                               CommandName="ViewProduct" 
                                               CommandArgument='<%# Eval("ProductId") %>'
                                               CssClass="text-decoration-none">
                                    <img src='<%# Eval("ImageUrl") %>' 
                                         class="card-img-top" alt='<%# Eval("Name") %>' 
                                         style="height: 250px; object-fit: cover;">
                                </asp:LinkButton>
                                <div class="card-body d-flex flex-column">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <asp:LinkButton ID="lnkProductName" runat="server" 
                                                       CommandName="ViewProduct" 
                                                       CommandArgument='<%# Eval("ProductId") %>'
                                                       CssClass="text-decoration-none text-dark">
                                            <h5 class="card-title mb-0"><%# Eval("Name") %></h5>
                                        </asp:LinkButton>
                                        <span class="badge bg-<%# Eval("BadgeColor") %>"><%# Eval("Badge") %></span>
                                    </div>
                                    <p class="card-text flex-grow-1">
                                        <%# Eval("Description") %>
                                    </p>
                                    <div class="mb-3">
                                        <h4 class="text-primary fw-bold mb-0">$<%# Eval("Price", "{0:F2}") %></h4>
                                        <small class="text-muted"><%# Eval("Category") %></small>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex gap-1">
                                            <span class="badge bg-outline-primary"><%# Eval("Tag1") %></span>
                                            <span class="badge bg-outline-secondary"><%# Eval("Tag2") %></span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <asp:LinkButton ID="lnkViewProduct" runat="server" 
                                                           CssClass="btn btn-outline-primary btn-sm"
                                                           CommandName="ViewProduct" 
                                                           CommandArgument='<%# Eval("ProductId") %>'>
                                                👁️ View
                                            </asp:LinkButton>
                                            <asp:Button ID="btnAddToCart" runat="server" 
                                                       CssClass="btn btn-primary btn-sm"
                                                       Text="🛒 Add"
                                                       CommandName="AddToCart"
                                                       CommandArgument='<%# Eval("ProductId") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- No Search Results -->
            <asp:Panel ID="pnlNoSearchResults" runat="server" Visible="false">
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-8">
                        <div class="card border-warning shadow-sm">
                            <div class="card-body text-center py-5">
                                <i class="bi bi-search-heart text-warning" style="font-size: 4rem;"></i>
                                <h4 class="text-warning mt-3">No Search Results</h4>
                                <p class="text-muted mb-4">
                                    We couldn't find any products matching your search criteria.
                                    Try different keywords or browse all products below.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </asp:Panel>

        <!-- All Products Section -->
        <asp:Panel ID="pnlAllProducts" runat="server">
            <div class="row mb-4">
                <div class="col-12">
                    <h4 class="fw-bold">
                        <asp:Label ID="lblAllProductsTitle" runat="server" Text="🛍️ All Products"></asp:Label>
                    </h4>
                </div>
            </div>
            
            <div class="row g-4">
                <asp:Repeater ID="rptAllProducts" runat="server" OnItemCommand="rptAllProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card h-100 shadow-sm">
                                <asp:LinkButton ID="lnkProductImage" runat="server" 
                                               CommandName="ViewProduct" 
                                               CommandArgument='<%# Eval("ProductId") %>'
                                               CssClass="text-decoration-none">
                                    <img src='<%# Eval("ImageUrl") %>' 
                                         class="card-img-top" alt='<%# Eval("Name") %>' 
                                         style="height: 250px; object-fit: cover;">
                                </asp:LinkButton>
                                <div class="card-body d-flex flex-column">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <asp:LinkButton ID="lnkProductName" runat="server" 
                                                       CommandName="ViewProduct" 
                                                       CommandArgument='<%# Eval("ProductId") %>'
                                                       CssClass="text-decoration-none text-dark">
                                            <h5 class="card-title mb-0"><%# Eval("Name") %></h5>
                                        </asp:LinkButton>
                                        <span class="badge bg-<%# Eval("BadgeColor") %>"><%# Eval("Badge") %></span>
                                    </div>
                                    <p class="card-text flex-grow-1">
                                        <%# Eval("Description") %>
                                    </p>
                                    <div class="mb-3">
                                        <h4 class="text-primary fw-bold mb-0">$<%# Eval("Price", "{0:F2}") %></h4>
                                        <small class="text-muted"><%# Eval("Category") %></small>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex gap-1">
                                            <span class="badge bg-outline-primary"><%# Eval("Tag1") %></span>
                                            <span class="badge bg-outline-secondary"><%# Eval("Tag2") %></span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <asp:LinkButton ID="lnkViewProduct" runat="server" 
                                                           CssClass="btn btn-outline-primary btn-sm"
                                                           CommandName="ViewProduct" 
                                                           CommandArgument='<%# Eval("ProductId") %>'>
                                                👁️ View
                                            </asp:LinkButton>
                                            <asp:Button ID="btnAddToCart" runat="server" 
                                                       CssClass="btn btn-primary btn-sm"
                                                       Text="🛒 Add"
                                                       CommandName="AddToCart"
                                                       CommandArgument='<%# Eval("ProductId") %>' />
                                        </div>
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
