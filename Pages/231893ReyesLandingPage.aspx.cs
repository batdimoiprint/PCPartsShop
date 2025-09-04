using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesLandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            var products = GetFeaturedProducts();
            rptProducts.DataSource = products;
            rptProducts.DataBind();
        }

        private List<Product> GetFeaturedProducts()
        {
            return new List<Product>
            {
                new Product
                {
                    ProductId = "GPU001",
                    Name = "RTX 4080 Graphics Card",
                    Description = "High-performance graphics card perfect for gaming and professional workloads with excellent price-to-performance ratio.",
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
                    Description = "Latest generation processor with multiple cores and high clock speeds for superior computing performance.",
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
                    Description = "High-speed DDR5 memory modules for improved system responsiveness and multitasking capabilities.",
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
                    Description = "Ultra-fast solid state drives with large capacity and excellent reliability for all your storage needs.",
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
                    Description = "Premium motherboards with advanced features, multiple expansion slots, and excellent build quality.",
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
                    Description = "Efficient and reliable power supplies with modular cables and 80+ certification for energy savings.",
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

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string productId = e.CommandArgument.ToString();
                AddToCart(productId);
            }
        }

        private void AddToCart(string productId)
        {
            try
            {
                // Get the product details
                var product = GetFeaturedProducts().FirstOrDefault(p => p.ProductId == productId);
                if (product == null) return;

                // Get or create cart from session
                var cart = Session["ShoppingCart"] as List<CartItem>;
                if (cart == null)
                {
                    cart = new List<CartItem>();
                    Session["ShoppingCart"] = cart;
                }

                // Check if product already exists in cart
                var existingItem = cart.FirstOrDefault(c => c.ProductId == productId);
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
                // Handle error
                ShowErrorMessage("Error adding product to cart. Please try again.");
            }
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

        protected void lnkProduct_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewProduct")
            {
                string productId = e.CommandArgument.ToString();
                Response.Redirect($"231893ReyesViewProduct.aspx?id={productId}");
            }
        }

        protected void btnBrowseParts_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesSearchProducts.aspx");
        }
    }

    // Product class to represent product data
    [Serializable]
    public class Product
    {
        public string ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
        public string ImageUrl { get; set; }
        public string Badge { get; set; }
        public string BadgeColor { get; set; }
        public string Tag1 { get; set; }
        public string Tag2 { get; set; }
    }

    // Cart item class to represent items in shopping cart
    [Serializable]
    public class CartItem
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
        public string Category { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice => Price * Quantity;
    }
}