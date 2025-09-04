<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesLandingPage.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Hero Section -->
    <div class="py-5">
        <div class="position-relative overflow-hidden rounded-3 shadow-lg" style="min-height: 500px; background-image: url('https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp'); background-size: cover; background-position: center;">
            <!-- Hero Overlay -->
            <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-50"></div>
            
            <!-- Hero Content -->
            <div class="position-relative d-flex align-items-center justify-content-center h-100 text-white text-center p-5" style="min-height: 500px;">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-8 col-lg-6">
                            <h1 class="display-4 fw-bold mb-4">Looking for an upgrade?</h1>
                            <p class="lead mb-4">
                                Choose from our most powerful but affordable computer parts for your needs.
                            </p>
                            <asp:Button ID="btnBrowseParts" runat="server" CssClass="btn btn-primary btn-lg px-4 py-2" 
                                       Text="🔍 Browse Parts" OnClick="btnBrowseParts_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Section -->
    <div class="py-4">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <h2 class="display-5 fw-bold">Featured Products</h2>
                    <p class="lead text-muted">Discover our latest computer parts and components</p>
                </div>
            </div>
            
            <!-- Dynamic Product Cards -->
            <div class="row g-4">
                <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card h-100 shadow-sm">
                                <asp:LinkButton ID="lnkProductImage" runat="server" 
                                               CommandName="ViewProduct" 
                                               CommandArgument='<%# Eval("ProductId") %>'
                                               OnCommand="lnkProduct_Command"
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
                                                       OnCommand="lnkProduct_Command"
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
                                                           CommandArgument='<%# Eval("ProductId") %>'
                                                           OnCommand="lnkProduct_Command">
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
        </div>
    </div>

    <!-- Success Message -->
    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success alert-dismissible fade show" 
               Visible="false" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>
        <span id="messageText" runat="server"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Label>

</asp:Content>
