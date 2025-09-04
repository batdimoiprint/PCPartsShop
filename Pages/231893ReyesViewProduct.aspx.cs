using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PCPartsShop.MasterPage;

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
            
            lblProductName.Text = currentProduct.Name;
            lblProductDescription.Text = currentProduct.Description;
            lblProductPrice.Text = currentProduct.Price.ToString("F2");
            lblProductCategory.Text = currentProduct.Category;
   
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

        protected void btnIncreaseQty_Click(object sender, EventArgs e)
        {
            int currentQty = int.Parse(txtQuantity.Text);
            if (currentQty < 99) // Set maximum limit
            {
                txtQuantity.Text = (currentQty + 1).ToString();
            }
        }

        protected void btnDecreaseQty_Click(object sender, EventArgs e)
        {
            int currentQty = int.Parse(txtQuantity.Text);
            if (currentQty > 1) // Set minimum limit
            {
                txtQuantity.Text = (currentQty - 1).ToString();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentProduct"] is Product product)
            {
                int quantity = int.Parse(txtQuantity.Text);
                AddToCart(product, quantity);
            }
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

                // Update cart count in session and get new total
                int newCartCount = cart.Sum(c => c.Quantity);
                Session["CartItemCount"] = newCartCount;

                // Get master page and call the new method
                var masterPage = this.Master as _231893ReyesMaster;
                if (masterPage != null)
                {
                    string message = quantity > 1 ? 
                        $"{quantity} x {product.Name} added to cart!" : 
                        $"{product.Name} added to cart!";
                    masterPage.UpdateCartCountAndShowMessage(message, newCartCount);
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

        private List<Product> GetFeaturedProducts()
        {
            {
                return new List<Product>
            {
                new Product
                {
                    ProductId = "GPU001",
                    Name = "RTX 4080 Graphics Card",
                    Description = "High-performance graphics card perfect for gaming and professional workloads with excellent price-to-performance ratio.",
                    Price = 50599.99m,
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
                    Price = 25295m,
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
                    Price = 16847m,
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
                    Price = 11239m,
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
                    Price = 19659m,
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
                    Price = 8427m,
                    Category = "Power Supplies",
                    ImageUrl = "https://www.jumbo-computer.com/cdn/shop/files/1024_d0a9e63e-b5a9-4067-9109-56e1ddb9e3d7_800x.png?v=1711020805",
                    Badge = "ECO",
                    BadgeColor = "success",
                    Tag1 = "80+ Gold",
                    Tag2 = "Modular"
                }
            };
            }
        }
    }
}