using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesCheckout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            if (!isLoggedIn)
            {
                Response.Redirect("231893ReyesLogin.aspx?ReturnUrl=" + Server.UrlEncode("231893ReyesCheckout.aspx"));
                return;
            }

            // Check if cart has items
            var cart = Session["ShoppingCart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                Response.Redirect("231893ReyesCart.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserInformation();
                LoadOrderSummary();
            }
        }

        private void LoadUserInformation()
        {
            // Pre-fill user information from session if available
            var currentUser = Session["CurrentUser"] as UserInfo;
            if (currentUser != null)
            {
                txtFirstName.Text = currentUser.FirstName;
                txtLastName.Text = currentUser.LastName;
                txtEmail.Text = currentUser.Email;
                txtPhone.Text = currentUser.Phone;
            }
            else
            {
                // Fallback to session variables
                if (Session["UserEmail"] != null)
                {
                    txtEmail.Text = Session["UserEmail"].ToString();
                }
            }
        }

        private void LoadOrderSummary()
        {
            var cart = Session["ShoppingCart"] as List<CartItem>;
            if (cart == null || cart.Count == 0) return;

            // Bind cart items to repeater
            rptOrderItems.DataSource = cart;
            rptOrderItems.DataBind();

            // Calculate totals
            decimal subtotal = cart.Sum(c => c.TotalPrice);
            decimal taxRate = 0.08m; // 8% tax
            decimal tax = subtotal * taxRate;
            decimal total = subtotal + tax;

            lblCheckoutSubtotal.Text = $"${subtotal:F2}";
            lblCheckoutTax.Text = $"${tax:F2}";
            lblCheckoutTotal.Text = $"${total:F2}";
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate form data
                if (!ValidateCheckoutForm())
                {
                    return;
                }

                // Get cart data
                var cart = Session["ShoppingCart"] as List<CartItem>;
                if (cart == null || cart.Count == 0)
                {
                    ShowErrorMessage("Your cart is empty.");
                    return;
                }

                // Calculate order total
                decimal subtotal = cart.Sum(c => c.TotalPrice);
                decimal tax = subtotal * 0.08m;
                decimal total = subtotal + tax;

                // Generate order number
                string orderNumber = GenerateOrderNumber();

                // Create order (in a real app, this would save to database)
                var order = new Order
                {
                    OrderNumber = orderNumber,
                    OrderDate = DateTime.Now,
                    CustomerEmail = txtEmail.Text.Trim(),
                    CustomerName = $"{txtFirstName.Text.Trim()} {txtLastName.Text.Trim()}",
                    ShippingAddress = GetShippingAddress(),
                    OrderItems = cart.ToList(),
                    Subtotal = subtotal,
                    Tax = tax,
                    Total = total,
                    Status = "Confirmed"
                };

                // Store order in session (in real app, save to database)
                var orders = Session["CustomerOrders"] as List<Order> ?? new List<Order>();
                orders.Add(order);
                Session["CustomerOrders"] = orders;

                // Clear the cart
                Session["ShoppingCart"] = null;
                Session["CartItemCount"] = 0;

                // Show success panel
                ShowOrderSuccess(orderNumber, total);
            }
            catch (Exception ex)
            {
                ShowErrorMessage("An error occurred while processing your order. Please try again.");
            }
        }

        private bool ValidateCheckoutForm()
        {
            bool isValid = true;
            string errorMessage = "";

            // Validate required fields
            if (string.IsNullOrWhiteSpace(txtFirstName.Text))
            {
                errorMessage += "First name is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtLastName.Text))
            {
                errorMessage += "Last name is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                errorMessage += "Email is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                errorMessage += "Address is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtCity.Text))
            {
                errorMessage += "City is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtCardNumber.Text))
            {
                errorMessage += "Card number is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtExpiryDate.Text))
            {
                errorMessage += "Expiry date is required. ";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtCVV.Text))
            {
                errorMessage += "CVV is required. ";
                isValid = false;
            }

            if (!isValid)
            {
                ShowErrorMessage(errorMessage.Trim());
            }

            return isValid;
        }

        private string GenerateOrderNumber()
        {
            return "ORD-" + DateTime.Now.ToString("yyyyMMdd") + "-" + new Random().Next(1000, 9999);
        }

        private string GetShippingAddress()
        {
            return $"{txtAddress.Text.Trim()}, {txtCity.Text.Trim()}, {ddlState.SelectedValue} {txtZipCode.Text.Trim()}";
        }

        private void ShowOrderSuccess(string orderNumber, decimal total)
        {
            lblOrderNumber.Text = orderNumber;
            lblOrderTotal.Text = $"${total:F2}";
            
            pnlCheckoutForm.Visible = false;
            pnlOrderSuccess.Visible = true;
        }

        protected void btnBackToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesCart.aspx");
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        protected void btnTrackOrder_Click(object sender, EventArgs e)
        {
            string orderNumber = lblOrderNumber.Text;
            Response.Redirect($"231893ReyesOrderTracking.aspx?orderNumber={orderNumber}");
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

    // Order class to represent completed orders
    [Serializable]
    public class Order
    {
        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerName { get; set; }
        public string ShippingAddress { get; set; }
        public List<CartItem> OrderItems { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }
        public string Status { get; set; }
    }
}