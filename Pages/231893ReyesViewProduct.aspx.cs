using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesViewProduct : System.Web.UI.Page
    {
        private Product currentProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["id"];
                LoadProductDetails(productId);
            }
        }

        private void LoadProductDetails(string productId)
        {
            if (string.IsNullOrEmpty(productId))
            {
                ShowProductNotFound();
                return;
            }

            // Get product from the featured products list
            var products = GetFeaturedProducts();
            currentProduct = products.FirstOrDefault(p => p.ProductId.Equals(productId, StringComparison.OrdinalIgnoreCase));

            if (currentProduct == null)
            {
                ShowProductNotFound();
                return;
            }

            DisplayProductDetails();
            LoadRelatedProducts(productId);
        }

        private void DisplayProductDetails()
        {
            pnlProductNotFound.Visible = false;
            pnlProductDetails.Visible = true;
            pnlRelatedProducts.Visible = true;

            // Set product information
            lblBreadcrumbProduct.Text = currentProduct.Name;
            lblProductName.Text = currentProduct.Name;
            lblProductDescription.Text = currentProduct.Description;
            lblProductPrice.Text = currentProduct.Price.ToString("F2");
            lblProductCategory.Text = currentProduct.Category;
            lblProductId.Text = currentProduct.ProductId;
            lblTag1.Text = currentProduct.Tag1;
            lblTag2.Text = currentProduct.Tag2;

            // Set product image
            imgProduct.ImageUrl = currentProduct.ImageUrl;
            imgProduct.AlternateText = currentProduct.Name;

            // Set badge
            lblProductBadge.Text = currentProduct.Badge;
            lblProductBadge.CssClass = $"badge bg-{currentProduct.BadgeColor} fs-6";

            // Store current product in ViewState for postback events
            ViewState["CurrentProduct"] = currentProduct;
        }

        private void LoadRelatedProducts(string currentProductId)
        {
            var allProducts = GetFeaturedProducts();
            var relatedProducts = allProducts.Where(p => !p.ProductId.Equals(currentProductId, StringComparison.OrdinalIgnoreCase))
                                             .Take(4)
                                             .ToList();

            rptRelatedProducts.DataSource = relatedProducts;
            rptRelatedProducts.DataBind();
        }

        private void ShowProductNotFound()
        {
            pnlProductNotFound.Visible = true;
            pnlProductDetails.Visible = false;
            pnlRelatedProducts.Visible = false;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentProduct"] is Product product)
            {
                int quantity = int.Parse(ddlQuantity.SelectedValue);
                AddToCart(product, quantity);
            }
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentProduct"] is Product product)
            {
                int quantity = int.Parse(ddlQuantity.SelectedValue);
                AddToCart(product, quantity);
                
                // Redirect to cart page for immediate checkout
                Response.Redirect("231893ReyesCart.aspx");
            }
        }

        protected void btnBackToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        protected void rptRelatedProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string productId = e.CommandArgument.ToString();

            if (e.CommandName == "ViewProduct")
            {
                Response.Redirect($"231893ReyesViewProduct.aspx?id={productId}");
            }
            else if (e.CommandName == "QuickAdd")
            {
                var products = GetFeaturedProducts();
                var product = products.FirstOrDefault(p => p.ProductId == productId);
                if (product != null)
                {
                    AddToCart(product, 1);
                }
            }
        }

        private void AddToCart(Product product, int quantity)
        {
            try
            {
                // Get or create cart from session
                var cart = Session["ShoppingCart"] as List<CartItem>;
                if (cart == null)
                {
                    cart = new List<CartItem>();
                    Session["ShoppingCart"] = cart;
                }

                // Check if product already exists in cart
                var existingItem = cart.FirstOrDefault(c => c.ProductId == product.ProductId);
                if (existingItem != null)
                {
                    existingItem.Quantity += quantity;
                }
                else
                {
                    cart.Add(new CartItem
                    {
                        ProductId = product.ProductId,
                        ProductName = product.Name,
                        Price = product.Price,
                        ImageUrl = product.ImageUrl,
                        Category = product.Category,
                        Quantity = quantity
                    });
                }

                // Update cart count in session
                Session["CartItemCount"] = cart.Sum(c => c.Quantity);

                // Show success message
                ShowSuccessMessage($"{quantity} x {product.Name} added to cart!");
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error adding product to cart. Please try again.");
            }
        }

        private List<Product> GetFeaturedProducts()
        {
            return new List<Product>
            {
                new Product
                {
                    ProductId = "GPU001",
                    Name = "RTX 4080 Graphics Card",
                    Description = "High-performance graphics card perfect for gaming and professional workloads with excellent price-to-performance ratio. Features the latest RTX architecture with ray tracing capabilities, DLSS 3.0 support, and 16GB GDDR6X memory for ultra-smooth 4K gaming experience.",
                    Price = 899.99m,
                    Category = "Graphics Cards",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "NEW",
                    BadgeColor = "success",
                    Tag1 = "Gaming",
                    Tag2 = "4K Ready"
                },
                new Product
                {
                    ProductId = "CPU001",
                    Name = "Intel Core i7-13700K",
                    Description = "Latest generation processor with multiple cores and high clock speeds for superior computing performance. 16 cores (8P + 8E), up to 5.4 GHz boost clock, and support for DDR5 memory and PCIe 5.0 for future-proof performance.",
                    Price = 449.99m,
                    Category = "Processors",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "HOT",
                    BadgeColor = "warning",
                    Tag1 = "Performance",
                    Tag2 = "13th Gen"
                },
                new Product
                {
                    ProductId = "RAM001",
                    Name = "32GB DDR5 Memory Kit",
                    Description = "High-speed DDR5 memory modules for improved system responsiveness and multitasking capabilities. 32GB (2x16GB) kit running at 5600 MHz with optimized timings for maximum performance in gaming and professional applications.",
                    Price = 299.99m,
                    Category = "Memory",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "FAST",
                    BadgeColor = "info",
                    Tag1 = "DDR5",
                    Tag2 = "High Speed"
                },
                new Product
                {
                    ProductId = "SSD001",
                    Name = "2TB NVMe SSD",
                    Description = "Ultra-fast solid state drives with large capacity and excellent reliability for all your storage needs. PCIe 4.0 interface with sequential read speeds up to 7,000 MB/s and write speeds up to 6,500 MB/s.",
                    Price = 199.99m,
                    Category = "Storage",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "SALE",
                    BadgeColor = "primary",
                    Tag1 = "NVMe",
                    Tag2 = "2TB"
                },
                new Product
                {
                    ProductId = "MB001",
                    Name = "ASUS ROG Motherboard",
                    Description = "Premium motherboards with advanced features, multiple expansion slots, and excellent build quality. Supports latest Intel processors, DDR5 memory, PCIe 5.0, WiFi 6E, and comprehensive RGB lighting ecosystem.",
                    Price = 349.99m,
                    Category = "Motherboards",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "POPULAR",
                    BadgeColor = "secondary",
                    Tag1 = "ROG",
                    Tag2 = "Premium"
                },
                new Product
                {
                    ProductId = "PSU001",
                    Name = "850W Modular PSU",
                    Description = "Efficient and reliable power supplies with modular cables and 80+ certification for energy savings. 80+ Gold efficiency rating, fully modular design, and 10-year warranty for peace of mind.",
                    Price = 149.99m,
                    Category = "Power Supplies",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "ECO",
                    BadgeColor = "success",
                    Tag1 = "80+ Gold",
                    Tag2 = "Modular"
                }
            };
        }

        private void ShowSuccessMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-success alert-dismissible fade show";
            messageText.InnerText = message;
        }

        private void ShowErrorMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-danger alert-dismissible fade show";
            messageText.InnerText = message;
        }
    }
}