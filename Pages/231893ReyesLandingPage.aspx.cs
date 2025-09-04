using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PCPartsShop.MasterPage;

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
                    ImageUrl = "https://dlcdnwebimgs.asus.com/gain/c0ba3131-118a-4ab8-8898-f744c4bdfd56/w692",
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
                    ImageUrl = "https://m.media-amazon.com/images/I/41BmX5xpFrL.jpg_BO30,255,255,255_UF900,850_SR1910,1000,0,C_QL100_.jpg",
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
                    ImageUrl = "https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_2.625,f_auto,h_214,q_auto,w_380/c_pad,h_214,w_380/Y2662086-01?pgw=1",
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
                    ImageUrl = "https://shop.villman.com/cdn/shop/files/MZ-V9P2T0B-AM_004_L-Perspective_Black-Gallery-1600x1200_800x.webp?v=1686924461",
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
                    ImageUrl = "https://easypc.com.ph/cdn/shop/files/AsusROGSTRIXZ890-AGAMINGWIFILGA1851UltraProcessorDDR5Motherboard_2_2048x.png?v=1732600544",
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
                    ImageUrl = "https://www.jumbo-computer.com/cdn/shop/files/1024_d0a9e63e-b5a9-4067-9109-56e1ddb9e3d7_800x.png?v=1711020805",
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

                // Update cart count in session and get new total
                int newCartCount = cart.Sum(c => c.Quantity);
                Session["CartItemCount"] = newCartCount;

                // Get master page and call the new method
                var masterPage = this.Master as _231893ReyesMaster;
                if (masterPage != null)
                {
                    masterPage.UpdateCartCountAndShowMessage(product.Name, newCartCount);
                }
            }
            catch (Exception ex)
            {
                // Handle error - show error message in header
                var masterPage = this.Master as _231893ReyesMaster;
                if (masterPage != null)
                {
                    masterPage.ShowSuccessMessage("Error adding product to cart. Please try again.");
                }
            }
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