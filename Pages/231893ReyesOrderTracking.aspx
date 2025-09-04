<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesOrderTracking.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesOrderTracking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Order Tracking Section -->
    <div class="container-fluid py-4">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="display-6 fw-bold">
                    <i class="bi bi-truck me-2"></i>Order Tracking
                </h2>
            </div>
        </div>

        <!-- Order Search -->
        <div class="row mb-4">
            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-search me-2"></i>Track Your Order</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtOrderNumber" class="form-label fw-semibold">Order Number</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtOrderNumber" runat="server" CssClass="form-control" 
                                           placeholder="Enter order number (e.g., ORD-20250101-1234)"></asp:TextBox>
                                <asp:Button ID="btnTrackOrder" runat="server" CssClass="btn btn-primary" 
                                           Text="Track" OnClick="btnTrackOrder_Click" />
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnShowAllOrders" runat="server" CssClass="btn btn-outline-primary" 
                                       Text="Show All My Orders" OnClick="btnShowAllOrders_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- No Orders Panel -->
        <asp:Panel ID="pnlNoOrders" runat="server" Visible="false">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-info">
                        <div class="card-body text-center py-5">
                            <i class="bi bi-inbox text-muted" style="font-size: 4rem;"></i>
                            <h4 class="text-muted mt-3">No Orders Found</h4>
                            <p class="text-muted mb-4">
                                <span id="noOrdersMessage" runat="server">You haven't placed any orders yet.</span>
                            </p>
                            <asp:Button ID="btnStartShopping" runat="server" CssClass="btn btn-primary btn-lg" 
                                       Text="Start Shopping" OnClick="btnStartShopping_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Orders List -->
        <asp:Panel ID="pnlOrdersList" runat="server" Visible="false">
            <div class="row">
                <div class="col-12">
                    <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand">
                        <ItemTemplate>
                            <div class="card shadow-sm mb-4">
                                <div class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-md-3">
                                            <h6 class="mb-0 fw-bold">Order #<%# Eval("OrderNumber") %></h6>
                                            <small class="text-muted"><%# Eval("OrderDate", "{0:MMM dd, yyyy}") %></small>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="badge bg-<%# GetStatusColor(Eval("Status").ToString()) %> fs-6">
                                                <%# Eval("Status") %>
                                            </span>
                                        </div>
                                        <div class="col-md-2">
                                            <strong>Total: ₱<%# Eval("Total", "{0:F2}") %></strong>
                                        </div>
                                        <div class="col-md-3">
                                            <small class="text-muted"><%# Eval("CustomerName") %></small><br>
                                            <small class="text-muted"><%# Eval("CustomerEmail") %></small>
                                        </div>
                                        <div class="col-md-2 text-end">
                                            <asp:Button ID="btnViewDetails" runat="server" CssClass="btn btn-outline-primary btn-sm" 
                                                       Text="View Details" CommandName="ViewDetails" 
                                                       CommandArgument='<%# Eval("OrderNumber") %>' />
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Order Details Panel (Initially Hidden) -->
                                <div class="card-body" id="orderDetails_<%# Container.ItemIndex %>" style="display: none;">
                                    <div class="row">
                                        <!-- Order Items -->
                                        <div class="col-md-8">
                                            <h6 class="fw-bold mb-3">Order Items</h6>
                                            <asp:Repeater ID="rptOrderItems" runat="server" DataSource='<%# Eval("OrderItems") %>'>
                                                <ItemTemplate>
                                                    <div class="d-flex align-items-center mb-3 p-3 bg-light rounded">
                                                        <img src='<%# Eval("ImageUrl") %>' 
                                                             class="rounded me-3" 
                                                             alt='<%# Eval("ProductName") %>'
                                                             style="width: 60px; height: 60px; object-fit: cover;">
                                                        <div class="flex-grow-1">
                                                            <h6 class="mb-1"><%# Eval("ProductName") %></h6>
                                                            <small class="text-muted"><%# Eval("Category") %></small>
                                                            <div class="mt-1">
                                                                <span class="fw-bold">$<%# Eval("Price", "{0:F2}") %></span>
                                                                <span class="text-muted"> × <%# Eval("Quantity") %></span>
                                                                <span class="text-primary fw-bold ms-2">= $<%# Eval("TotalPrice", "{0:F2}") %></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        
                                        <!-- Order Summary & Shipping -->
                                        <div class="col-md-4">
                                            <h6 class="fw-bold mb-3">Order Summary</h6>
                                            <div class="card bg-light">
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between mb-2">
                                                        <span>Subtotal:</span>
                                                        <span>₱<%# Eval("Subtotal", "{0:F2}") %></span>
                                                    </div>
                                                    <div class="d-flex justify-content-between mb-2">
                                                        <span>Shipping:</span>
                                                        <span class="text-success">Free</span>
                                                    </div>
                                               
                                                    <hr>
                                                    <div class="d-flex justify-content-between">
                                                        <strong>Total:</strong>
                                                        <strong class="text-primary">₱<%# Eval("Total", "{0:F2}") %></strong>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <h6 class="fw-bold mt-4 mb-3">Shipping Address</h6>
                                            <div class="card bg-light">
                                                <div class="card-body">
                                                    <address class="mb-0">
                                                        <%# Eval("CustomerName") %><br>
                                                        <%# Eval("ShippingAddress") %>
                                                    </address>
                                                </div>
                                            </div>

                                            <!-- Order Status Timeline -->
                                            <h6 class="fw-bold mt-4 mb-3">Order Status</h6>
                                            <div class="timeline">
                                                <div class="timeline-item <%# GetTimelineStatus("Confirmed", Eval("Status").ToString()) %>">
                                                    <i class="bi bi-check-circle-fill"></i>
                                                    <span>Order Confirmed</span>
                                                </div>
                                                <div class="timeline-item <%# GetTimelineStatus("Processing", Eval("Status").ToString()) %>">
                                                    <i class="bi bi-gear-fill"></i>
                                                    <span>Processing</span>
                                                </div>
                                                <div class="timeline-item <%# GetTimelineStatus("Shipped", Eval("Status").ToString()) %>">
                                                    <i class="bi bi-truck"></i>
                                                    <span>Shipped</span>
                                                </div>
                                                <div class="timeline-item <%# GetTimelineStatus("Delivered", Eval("Status").ToString()) %>">
                                                    <i class="bi bi-house-check-fill"></i>
                                                    <span>Delivered</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
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

    <!-- Custom CSS for Timeline -->
    <style>
        .timeline {
            position: relative;
            padding: 1rem 0;
        }
        
        .timeline-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            opacity: 0.4;
        }
        
        .timeline-item.active {
            opacity: 1;
            color: #0d6efd;
            font-weight: 600;
        }
        
        .timeline-item.completed {
            opacity: 1;
            color: #198754;
            font-weight: 600;
        }
        
        .timeline-item i {
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }
    </style>

    <!-- JavaScript for Toggle Details -->
    <script>
        function toggleOrderDetails(index) {
            var details = document.getElementById('orderDetails_' + index);
            if (details.style.display === 'none') {
                details.style.display = 'block';
            } else {
                details.style.display = 'none';
            }
        }
    </script>

</asp:Content>
