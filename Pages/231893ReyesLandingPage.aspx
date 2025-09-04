<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/231893ReyesMaster.Master" AutoEventWireup="true" CodeBehind="231893ReyesLandingPage.aspx.cs" Inherits="PCPartsShop.Pages._231893ReyesLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <!-- Product Cards Section -->
    <div class="py-4">
        <div class="container-fluid">
            <div class="row g-4">
                <!-- Product Card 1 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Graphics Card" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">Graphics Card</h5>
                                <span class="badge bg-success">NEW</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                High-performance graphics card perfect for gaming and professional workloads with excellent price-to-performance ratio.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-primary">Gaming</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 2 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Processor" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">CPU Processor</h5>
                                <span class="badge bg-warning text-dark">HOT</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                Latest generation processor with multiple cores and high clock speeds for superior computing performance.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-info">Performance</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 3 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Memory RAM" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">Memory RAM</h5>
                                <span class="badge bg-info">FAST</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                High-speed DDR4/DDR5 memory modules for improved system responsiveness and multitasking capabilities.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-success">Speed</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 4 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Storage SSD" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">SSD Storage</h5>
                                <span class="badge bg-primary">SALE</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                Ultra-fast solid state drives with large capacity and excellent reliability for all your storage needs.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-warning">Storage</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 5 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Motherboard" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">Motherboard</h5>
                                <span class="badge bg-secondary">POPULAR</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                Premium motherboards with advanced features, multiple expansion slots, and excellent build quality.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-danger">Premium</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Card 6 -->
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <img src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp" 
                             class="card-img-top" alt="Power Supply" style="height: 250px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0">Power Supply</h5>
                                <span class="badge bg-success">ECO</span>
                            </div>
                            <p class="card-text flex-grow-1">
                                Efficient and reliable power supplies with modular cables and 80+ certification for energy savings.
                            </p>
                            <div class="d-flex justify-content-end gap-2 mt-auto">
                                <span class="badge bg-outline-success">Efficient</span>
                                <span class="badge bg-outline-secondary">Hardware</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
