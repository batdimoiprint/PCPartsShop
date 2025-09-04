using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If user is already logged in, redirect to landing page
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                Response.Redirect("231893ReyesLandingPage.aspx");
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Get form values
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string role = "Customer"; // Default role for all public registrations
            string phone = txtPhone.Text.Trim();

            // Basic validation
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) || 
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("Please fill in all required fields.");
                return;
            }

            if (password != confirmPassword)
            {
                ShowErrorMessage("Passwords do not match.");
                return;
            }

            if (password.Length < 6)
            {
                ShowErrorMessage("Password must be at least 6 characters long.");
                return;
            }

            // Check if email already exists in session storage
            if (IsEmailAlreadyRegistered(email))
            {
                ShowErrorMessage("An account with this email already exists.");
                return;
            }

            // Create user account and store in session
            if (RegisterUser(firstName, lastName, email, password, role, phone))
            {
                ShowSuccessMessage("Account created successfully! You can now log in.");
                ClearForm();
            }
            else
            {
                ShowErrorMessage("Registration failed. Please try again.");
            }
        }

        private bool IsEmailAlreadyRegistered(string email)
        {
            // Get existing users from session
            var registeredUsers = Session["RegisteredUsers"] as Dictionary<string, UserInfo>;
            if (registeredUsers == null)
            {
                return false;
            }

            return registeredUsers.ContainsKey(email.ToLower());
        }

        private bool RegisterUser(string firstName, string lastName, string email, string password, string role, string phone)
        {
            try
            {
                // Get or create registered users dictionary
                var registeredUsers = Session["RegisteredUsers"] as Dictionary<string, UserInfo>;
                if (registeredUsers == null)
                {
                    registeredUsers = new Dictionary<string, UserInfo>();
                }

                // Create new user
                var newUser = new UserInfo
                {
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Password = password,
                    Role = role,
                    Phone = phone,
                    RegistrationDate = DateTime.Now
                };

                // Add to dictionary
                registeredUsers[email.ToLower()] = newUser;

                // Store back in session
                Session["RegisteredUsers"] = registeredUsers;

                return true;
            }
            catch
            {
                return false;
            }
        }

        private void ShowErrorMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-danger d-block";
            lblMessage.Text = "<i class='bi bi-exclamation-triangle-fill me-2'></i>" + message;
        }

        private void ShowSuccessMessage(string message)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "alert alert-success d-block";
            lblMessage.Text = "<i class='bi bi-check-circle-fill me-2'></i>" + message;
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtPhone.Text = "";
        }
    }

    // User info class to store user details
    [Serializable]
    public class UserInfo
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Phone { get; set; }
        public DateTime RegistrationDate { get; set; }
        
        public string FullName => $"{FirstName} {LastName}";
        public string DisplayName => FirstName;
    }
}