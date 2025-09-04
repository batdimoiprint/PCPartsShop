using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCPartsShop.Pages
{
    public partial class _231893ReyesOrderTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            if (!isLoggedIn)
            {
                Response.Redirect("231893ReyesLogin.aspx?ReturnUrl=" + Server.UrlEncode("231893ReyesOrderTracking.aspx"));
                return;
            }

            if (!IsPostBack)
            {
                // Check if we have an order number from query string (from checkout success)
                string orderNumber = Request.QueryString["orderNumber"];
                if (!string.IsNullOrEmpty(orderNumber))
                {
                    txtOrderNumber.Text = orderNumber;
                    TrackSpecificOrder(orderNumber);
                }
                else
                {
                    LoadAllUserOrders();
                }
            }
        }

        protected void btnTrackOrder_Click(object sender, EventArgs e)
        {
            string orderNumber = txtOrderNumber.Text.Trim();
            if (string.IsNullOrEmpty(orderNumber))
            {
                ShowErrorMessage("Please enter an order number to track.");
                return;
            }

            TrackSpecificOrder(orderNumber);
        }

        protected void btnShowAllOrders_Click(object sender, EventArgs e)
        {
            LoadAllUserOrders();
        }

        private void TrackSpecificOrder(string orderNumber)
        {
            var orders = GetUserOrders();
            var specificOrder = orders.FirstOrDefault(o => o.OrderNumber.Equals(orderNumber, StringComparison.OrdinalIgnoreCase));

            if (specificOrder != null)
            {
                // Update order status for demo purposes
                UpdateOrderStatus(specificOrder);
                
                var orderList = new List<Order> { specificOrder };
                DisplayOrders(orderList);
            }
            else
            {
                pnlOrdersList.Visible = false;
                pnlNoOrders.Visible = true;
                noOrdersMessage.InnerText = $"Order number '{orderNumber}' not found. Please check the order number and try again.";
            }
        }

        private void LoadAllUserOrders()
        {
            var orders = GetUserOrders();
            
            if (orders.Count > 0)
            {
                // Update order statuses for demo purposes
                foreach (var order in orders)
                {
                    UpdateOrderStatus(order);
                }
                
                // Sort orders by date (newest first)
                orders = orders.OrderByDescending(o => o.OrderDate).ToList();
                DisplayOrders(orders);
            }
            else
            {
                pnlOrdersList.Visible = false;
                pnlNoOrders.Visible = true;
                noOrdersMessage.InnerText = "You haven't placed any orders yet.";
            }
        }

        private List<Order> GetUserOrders()
        {
            var allOrders = Session["CustomerOrders"] as List<Order> ?? new List<Order>();
            var userEmail = Session["UserEmail"]?.ToString();
            
            if (string.IsNullOrEmpty(userEmail))
            {
                return new List<Order>();
            }

            // Filter orders for current user
            return allOrders.Where(o => o.CustomerEmail.Equals(userEmail, StringComparison.OrdinalIgnoreCase)).ToList();
        }

        private void DisplayOrders(List<Order> orders)
        {
            pnlNoOrders.Visible = false;
            pnlOrdersList.Visible = true;
            rptOrders.DataSource = orders;
            rptOrders.DataBind();
        }

        private void UpdateOrderStatus(Order order)
        {
            // Demo logic to simulate order progression based on time elapsed
            var timeElapsed = DateTime.Now - order.OrderDate;
            
            if (timeElapsed.TotalMinutes < 5)
            {
                order.Status = "Confirmed";
            }
            else if (timeElapsed.TotalMinutes < 15)
            {
                order.Status = "Processing";
            }
            else if (timeElapsed.TotalMinutes < 30)
            {
                order.Status = "Shipped";
            }
            else
            {
                order.Status = "Delivered";
            }
        }

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string orderNumber = e.CommandArgument.ToString();
                // The JavaScript function will handle the toggle
                ClientScript.RegisterStartupScript(this.GetType(), "toggleDetails", 
                    $"toggleOrderDetails({e.Item.ItemIndex});", true);
            }
        }

        protected void btnStartShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("231893ReyesLandingPage.aspx");
        }

        // Helper method for status badge colors
        protected string GetStatusColor(string status)
        {
            switch (status?.ToLower())
            {
                case "confirmed":
                    return "primary";
                case "processing":
                    return "warning";
                case "shipped":
                    return "info";
                case "delivered":
                    return "success";
                case "cancelled":
                    return "danger";
                default:
                    return "secondary";
            }
        }

        // Helper method for timeline status
        protected string GetTimelineStatus(string timelineStep, string currentStatus)
        {
            var statusOrder = new Dictionary<string, int>
            {
                { "Confirmed", 1 },
                { "Processing", 2 },
                { "Shipped", 3 },
                { "Delivered", 4 }
            };

            var currentOrder = statusOrder.ContainsKey(currentStatus) ? statusOrder[currentStatus] : 0;
            var stepOrder = statusOrder.ContainsKey(timelineStep) ? statusOrder[timelineStep] : 0;

            if (stepOrder < currentOrder)
            {
                return "completed";
            }
            else if (stepOrder == currentOrder)
            {
                return "active";
            }
            else
            {
                return "";
            }
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