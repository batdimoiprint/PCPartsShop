using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesSearchProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchQuery = Request.QueryString["q"];
                string category = Request.QueryString["category"];
                
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    txtSearch.Text = searchQuery;
                    if (!string.IsNullOrEmpty(category))
                    {
                        ddlCategory.SelectedValue = category;
                    }
                    PerformSearch();
                }
                else
                {
                    LoadAllProducts();
                }
                
                UpdateProductStats();
            }
        }

        private void LoadAllProducts()
        {
            var allProducts = GetAllProducts();
            
            // Hide search results section
            pnlSearchResults.Visible = false;
            pnlSearchInfo.Visible = false;
            
            // Show all products
            pnlAllProducts.Visible = true;
            lblPageTitle.Text = "All Products";
            lblAllProductsTitle.Text = "🛍️ All Products";
            
            rptAllProducts.DataSource = allProducts;
            rptAllProducts.DataBind();
        }

        private void PerformSearch()
        {
            string searchQuery = txtSearch.Text.Trim();
            string selectedCategory = ddlCategory.SelectedValue;
            
            if (string.IsNullOrEmpty(searchQuery) && string.IsNullOrEmpty(selectedCategory))
            {
                LoadAllProducts();
                return;
            }

            var allProducts = GetAllProducts();
            var searchResults = FilterProducts(allProducts, searchQuery, selectedCategory);

            // Show search results section
            pnlSearchResults.Visible = true;
            pnlSearchInfo.Visible = true;
            
            // Update search info
            lblPageTitle.Text = "Search Results";
            lblSearchQuery.Text = !string.IsNullOrEmpty(searchQuery) ? searchQuery : "All categories";
            lblResultCount.Text = searchResults.Count.ToString();

            if (searchResults.Count > 0)
            {
                pnlNoSearchResults.Visible = false;
                rptSearchResults.DataSource = searchResults;
                rptSearchResults.DataBind();
            }
            else
            {
                pnlNoSearchResults.Visible = true;
                rptSearchResults.DataSource = null;
                rptSearchResults.DataBind();
            }

            // Show remaining products as "Other Products"
            var otherProducts = allProducts.Except(searchResults).ToList();
            if (otherProducts.Count > 0)
            {
                pnlAllProducts.Visible = true;
                lblAllProductsTitle.Text = "🔍 Other Products You Might Like";
                rptAllProducts.DataSource = otherProducts;
                rptAllProducts.DataBind();
            }
            else
            {
                pnlAllProducts.Visible = false;
            }
        }

        private List<Product> FilterProducts(List<Product> products, string searchQuery, string category)
        {
            var filteredProducts = products.AsEnumerable();

            // Filter by search query
            if (!string.IsNullOrEmpty(searchQuery))
            {
                filteredProducts = filteredProducts.Where(p =>
                    p.Name.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Description.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Category.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Tag1.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Tag2.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0
                );
            }

            // Filter by category
            if (!string.IsNullOrEmpty(category))
            {
                filteredProducts = filteredProducts.Where(p =>
                    p.Category.Equals(category, StringComparison.OrdinalIgnoreCase)
                );
            }

            return filteredProducts.ToList();
        }

        private void UpdateProductStats()
        {
            var allProducts = GetAllProducts();
            lblTotalProducts.Text = allProducts.Count.ToString();
            
            // Count displayed products
            int displayedCount = 0;
            if (pnlSearchResults.Visible && rptSearchResults.Items.Count > 0)
            {
                displayedCount += rptSearchResults.Items.Count;
            }
            if (pnlAllProducts.Visible && rptAllProducts.Items.Count > 0)
            {
                displayedCount += rptAllProducts.Items.Count;
            }
            if (displayedCount == 0)
            {
                displayedCount = allProducts.Count;
            }
            
            lblDisplayedProducts.Text = displayedCount.ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            PerformSearch();
            UpdateProductStats();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlCategory.SelectedIndex = 0;
            LoadAllProducts();
            UpdateProductStats();
        }

        protected void rptSearchResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HandleProductCommand(e);
        }

        protected void rptAllProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HandleProductCommand(e);
        }

        private void HandleProductCommand(RepeaterCommandEventArgs e)
        {
            string productId = e.CommandArgument.ToString();

            if (e.CommandName == "ViewProduct")
            {
                Response.Redirect($"231893ReyesViewProduct.aspx?id={productId}");
            }
            else if (e.CommandName == "AddToCart")
            {
                var products = GetAllProducts();
                var product = products.FirstOrDefault(p => p.ProductId == productId);
                if (product != null)
                {
                    AddToCart(product);
                }
            }
        }

        private void AddToCart(Product product)
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
                    existingItem.Quantity++;
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
                        Quantity = 1
                    });
                }

                // Update cart count in session
                Session["CartItemCount"] = cart.Sum(c => c.Quantity);

                // Show success message
                ShowSuccessMessage($"{product.Name} added to cart!");
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error adding product to cart. Please try again.");
            }
        }

        private List<Product> GetAllProducts()
        {
            return new List<Product>
            {
                new Product
                {
                    ProductId = "GPU001",
                    Name = "RTX 4080 Graphics Card",
                    Description = "High-performance graphics card perfect for gaming and professional workloads with excellent price-to-performance ratio. Features the latest RTX architecture with ray tracing capabilities.",
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
                    Description = "Latest generation processor with multiple cores and high clock speeds for superior computing performance. 16 cores with up to 5.4 GHz boost clock.",
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
                    Description = "High-speed DDR5 memory modules for improved system responsiveness and multitasking capabilities. 32GB kit running at 5600 MHz.",
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
                    Description = "Ultra-fast solid state drives with large capacity and excellent reliability for all your storage needs. PCIe 4.0 interface with 7,000 MB/s read speeds.",
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
                    Description = "Premium motherboards with advanced features, multiple expansion slots, and excellent build quality. Supports latest Intel processors and DDR5 memory.",
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
                    Description = "Efficient and reliable power supplies with modular cables and 80+ certification for energy savings. 80+ Gold efficiency with 10-year warranty.",
                    Price = 149.99m,
                    Category = "Power Supplies",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "ECO",
                    BadgeColor = "success",
                    Tag1 = "80+ Gold",
                    Tag2 = "Modular"
                },
                new Product
                {
                    ProductId = "CPU002",
                    Name = "AMD Ryzen 9 7900X",
                    Description = "High-performance AMD processor with 12 cores and 24 threads. Perfect for gaming, content creation, and professional workloads.",
                    Price = 549.99m,
                    Category = "Processors",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "POWERFUL",
                    BadgeColor = "danger",
                    Tag1 = "AMD",
                    Tag2 = "Ryzen 9"
                },
                new Product
                {
                    ProductId = "GPU002",
                    Name = "RTX 4060 Graphics Card",
                    Description = "Mid-range graphics card perfect for 1080p and 1440p gaming. Great price-to-performance ratio with modern features.",
                    Price = 329.99m,
                    Category = "Graphics Cards",
                    ImageUrl = "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp",
                    Badge = "VALUE",
                    BadgeColor = "info",
                    Tag1 = "1440p",
                    Tag2 = "Budget"
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