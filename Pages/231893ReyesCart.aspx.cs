using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
                UpdateCartSummary();
            }
        }

        private void LoadCartItems()
        {
            var cart = Session["ShoppingCart"] as List<CartItem>;
            
            if (cart == null || cart.Count == 0)
            {
                pnlEmptyCart.Visible = true;
                pnlCartItems.Visible = false;
            }
            else
            {
                pnlEmptyCart.Visible = false;
                pnlCartItems.Visible = true;
                rptCartItems.DataSource = cart;
                rptCartItems.DataBind();
            }
        }

        private void UpdateCartSummary()
        {
            var cart = Session["ShoppingCart"] as List<CartItem>;
            
            if (cart == null || cart.Count == 0)
            {
     
                lblTotal.Text = "₱0.00";
                return;
            }

            decimal subtotal = cart.Sum(c => c.TotalPrice);
            decimal taxRate = 0.08m; // 8% tax
            decimal tax = subtotal * taxRate;
            decimal total = subtotal + tax;

         
            lblTotal.Text = $"₱{total:F2}";

            // Update cart count in session
            Session["CartItemCount"] = cart.Sum(c => c.Quantity);
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string productId = e.CommandArgument.ToString();
            var cart = Session["ShoppingCart"] as List<CartItem>;
            
            if (cart == null) return;

            var item = cart.FirstOrDefault(c => c.ProductId == productId);
            if (item == null) return;

            switch (e.CommandName)
            {
                case "IncreaseQuantity":
                    item.Quantity++;
                    ShowSuccessMessage("Quantity updated!");
                    break;

                case "DecreaseQuantity":
                    if (item.Quantity > 1)
                    {
                        item.Quantity--;
                        ShowSuccessMessage("Quantity updated!");
                    }
                    else
                    {
                        cart.Remove(item);
                        ShowSuccessMessage("Item removed from cart!");
                    }
                    break;

                case "RemoveItem":
                    cart.Remove(item);
                    ShowSuccessMessage("Item removed from cart!");
                    break;
            }

            // Update session
            Session["ShoppingCart"] = cart;
            
            // Refresh the page
            LoadCartItems();
            UpdateCartSummary();
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        protected void btnShopNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var cart = Session["ShoppingCart"] as List<CartItem>;
            
            if (cart == null || cart.Count == 0)
            {
                ShowErrorMessage("Your cart is empty. Add some items before checkout.");
                return;
            }

            // Check if user is logged in
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            
            if (!isLoggedIn)
            {
                // Redirect to login with return URL
                Response.Redirect("231893ReyesLogin.aspx?ReturnUrl=" + Server.UrlEncode("231893ReyesCheckout.aspx"));
                return;
            }

            // Redirect to checkout page
            Response.Redirect("231893ReyesCheckout.aspx");
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