using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            if (!isLoggedIn)
            {
                Response.Redirect("231893ReyesLogin.aspx?ReturnUrl=" + Server.UrlEncode("231893ReyesProfile.aspx"));
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
                LoadAccountStats();
            }
        }

        private void LoadUserProfile()
        {
            try
            {
                // Try to get user info from registered users first
                var currentUser = GetCurrentUserInfo();
                
                if (currentUser != null)
                {
                    // Display registered user information
                    DisplayUserInfo(currentUser);
                    pnlRegisteredInfo.Visible = true;
                    pnlDemoInfo.Visible = false;
                }
                else
                {
                    // Display demo user information
                    DisplayDemoUserInfo();
                    pnlDemoInfo.Visible = true;
                    pnlRegisteredInfo.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error loading profile information. Please try again.");
            }
        }

        private UserInfo GetCurrentUserInfo()
        {
            var userEmail = Session["UserEmail"]?.ToString();
            if (string.IsNullOrEmpty(userEmail))
                return null;

            var registeredUsers = Session["RegisteredUsers"] as Dictionary<string, UserInfo>;
            if (registeredUsers != null && registeredUsers.ContainsKey(userEmail.ToLower()))
            {
                return registeredUsers[userEmail.ToLower()];
            }

            return null;
        }

        private void DisplayUserInfo(UserInfo user)
        {
            lblFirstName.Text = user.FirstName;
            lblLastName.Text = user.LastName;
            lblEmail.Text = user.Email;
            lblPhone.Text = !string.IsNullOrEmpty(user.Phone) ? user.Phone : "Not provided";
            lblRole.Text = user.Role;
            lblRegistrationDate.Text = user.RegistrationDate.ToString("MMM dd, yyyy");
            lblFullName.Text = user.FullName;
            lblAccountType.Text = $"{user.Role} Account";
        }

        private void DisplayDemoUserInfo()
        {
            // Get basic info from session
            string userEmail = Session["UserEmail"]?.ToString() ?? "demo@pcparts.com";
            string userName = Session["UserName"]?.ToString() ?? "Demo";
            string userRole = Session["UserRole"]?.ToString() ?? "Customer";

            lblFirstName.Text = userName;
            lblLastName.Text = "User";
            lblEmail.Text = userEmail;
            lblPhone.Text = "Not provided";
            lblRole.Text = userRole;
            lblRegistrationDate.Text = DateTime.Now.ToString("MMM dd, yyyy");
            lblFullName.Text = $"{userName} User";
            lblAccountType.Text = $"{userRole} Account";
        }

        private void LoadAccountStats()
        {
            try
            {
                // Get order count
                var userEmail = Session["UserEmail"]?.ToString();
                var orders = Session["CustomerOrders"] as List<Order>;
                int orderCount = 0;
                
                if (!string.IsNullOrEmpty(userEmail) && orders != null)
                {
                    orderCount = orders.Count(o => o.CustomerEmail.Equals(userEmail, StringComparison.OrdinalIgnoreCase));
                }
                lblOrderCount.Text = orderCount.ToString();

                // Get cart count
                var cart = Session["ShoppingCart"] as List<CartItem>;
                int cartCount = 0;
                if (cart != null)
                {
                    cartCount = cart.Sum(c => c.Quantity);
                }
                lblCartCount.Text = cartCount.ToString();
            }
            catch (Exception ex)
            {
                lblOrderCount.Text = "0";
                lblCartCount.Text = "0";
            }
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesOrderTracking.aspx");
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesCart.aspx");
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session data
            Session["IsLoggedIn"] = false;
            Session["UserName"] = null;
            Session["UserEmail"] = null;
            Session["UserRole"] = null;
            Session["CurrentUser"] = null;
            Session.Clear();
            Session.Abandon();
            
            // Redirect to landing page
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        private void ShowErrorMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-danger alert-dismissible fade show";
            messageText.InnerText = message;
        }

        private void ShowSuccessMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-success alert-dismissible fade show";
            messageText.InnerText = message;
        }
    }
}