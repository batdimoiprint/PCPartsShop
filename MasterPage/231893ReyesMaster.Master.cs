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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session data
            Session["IsLoggedIn"] = false;
            Session["UserName"] = null;
            Session["UserEmail"] = null;
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
}