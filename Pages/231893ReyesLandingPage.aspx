<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesLandingPage.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Products Section -->
    <div>
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <h2 class="display-5 fw-bold">Welcome to PC Parts Shop</h2>
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
                                                View
                                            </asp:LinkButton>
                                            <asp:Button ID="btnAddToCart" runat="server" 
                                                       CssClass="btn btn-primary btn-sm"
                                                       Text="Add"
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

</asp:Content>
