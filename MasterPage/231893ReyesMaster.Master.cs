using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.MasterPage
{
    public partial class _231893ReyesMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserSession();
                UpdateCartCount();
            }
        }

        private void CheckUserSession()
        {
            // Check if user is logged in through session
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            
            if (isLoggedIn)
            {
                // Show user profile dropdown
                userProfileSection.Visible = true;
                loginSection.Visible = false;
                
                // Display username if available
                if (Session["UserName"] != null)
                {
                    lblUserName.Text = Session["UserName"].ToString();
                }
                else
                {
                    lblUserName.Text = "Profile";
                }
            }
            else
            {
                // Show login button
                userProfileSection.Visible = false;
                loginSection.Visible = true;
            }
        }

        public void UpdateCartCount()
        {
            int cartCount = 0;
            if (Session["CartItemCount"] != null)
            {
                cartCount = (int)Session["CartItemCount"];
            }
            else
            {
                // Calculate from cart items if CartItemCount is not set
                var cart = Session["ShoppingCart"] as List<CartItem>;
                if (cart != null)
                {
                    cartCount = cart.Sum(c => c.Quantity);
                    Session["CartItemCount"] = cartCount;
                }
            }
            
            lblCartCount.Text = cartCount.ToString();
        }

        public void ShowSuccessMessage(string message)
        {
            string script = $"showHeaderMessage('{HttpUtility.JavaScriptStringEncode(message)}');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMessage", script, true);
        }

        public void UpdateCartCountAndShowMessage(string productName, int newCount)
        {
            lblCartCount.Text = newCount.ToString();
            Session["CartItemCount"] = newCount;
            
            string script = $"addToCartSuccess('{HttpUtility.JavaScriptStringEncode(productName)}', {newCount});";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "AddToCartSuccess", script, true);
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesLandingPage.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesLogin.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesCart.aspx");
        }

        protected void btnAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesAbout.aspx");
        }

        protected void btnOrderTracking_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesOrderTracking.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session data
            Session["IsLoggedIn"] = false;
            Session["UserName"] = null;
            Session["UserEmail"] = null;
            Session["ShoppingCart"] = null;
            Session["CartItemCount"] = 0;
            Session.Clear();
            Session.Abandon();
            
            // Redirect to landing page
            Response.Redirect("~/Pages/231893ReyesLandingPage.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/231893ReyesProfile.aspx");
        }

        protected void btnSearchMaster_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearchMaster.Text.Trim();
            if (!string.IsNullOrEmpty(searchQuery))
            {
                Response.Redirect($"~/Pages/231893ReyesSearchProducts.aspx?q={Server.UrlEncode(searchQuery)}");
            }
            else
            {
                Response.Redirect("~/Pages/231893ReyesSearchProducts.aspx");
            }
        }
    }

    // Cart item class (if not already defined elsewhere)
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