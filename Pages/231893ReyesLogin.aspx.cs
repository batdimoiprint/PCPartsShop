using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If user is already logged in, redirect to landing page
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                Response.Redirect("231893ReyesLandingPage.aspx");
            }
        }

        protected void btnLoginSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Simple authentication logic - no validation, just check if fields have values
            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                UserInfo user = ValidateUser(email, password);
                if (user != null)
                {
                    // Set session variables with user details and role
                    Session["IsLoggedIn"] = true;
                    Session["UserName"] = user.DisplayName;
                    Session["UserEmail"] = user.Email;
                    Session["UserRole"] = user.Role;
                    Session["UserFullName"] = user.FullName;
                    Session["CurrentUser"] = user;

                    // Redirect to landing page or the page they came from
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl);
                    }
                    else
                    {
                        Response.Redirect("231893ReyesLandingPage.aspx");
                    }
                }
                else
                {
                    ShowErrorMessage("Invalid email or password. Please try again.");
                }
            }
            else
            {
                ShowErrorMessage("Please enter both email and password.");
            }
        }

        private UserInfo ValidateUser(string email, string password)
        {
            // First check demo users
            var demoUsers = new Dictionary<string, string>
            {
                { "admin@pcparts.com", "admin123" },
                { "user@pcparts.com", "user123" },
                { "kenny@pcparts.com", "kenny123" },
                { "test@test.com", "password123" }
            };

            // Check demo users first
            if (demoUsers.ContainsKey(email.ToLower()) && demoUsers[email.ToLower()] == password)
            {
                return new UserInfo
                {
                    FirstName = GetUserNameFromEmail(email),
                    LastName = "Demo",
                    Email = email,
                    Role = email.ToLower().Contains("admin") ? "Admin" : "Customer",
                    Phone = "N/A",
                    RegistrationDate = DateTime.Now
                };
            }

            // Then check registered users from session
            var registeredUsers = Session["RegisteredUsers"] as Dictionary<string, UserInfo>;
            if (registeredUsers != null && registeredUsers.ContainsKey(email.ToLower()))
            {
                var user = registeredUsers[email.ToLower()];
                if (user.Password == password)
                {
                    return user;
                }
            }

            return null;
        }

        private string GetUserNameFromEmail(string email)
        {
            // Extract username from email (part before @)
            if (!string.IsNullOrEmpty(email) && email.Contains("@"))
            {
                return email.Substring(0, email.IndexOf("@"));
            }
            return "User";
        }

        private void ShowErrorMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<i class='bi bi-exclamation-triangle-fill me-2'></i>" + message;
        }
    }
}