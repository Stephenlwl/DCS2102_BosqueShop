using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bouqs
{
    public partial class Cart : System.Web.UI.Page
    {
        public class CartItem
        {
            public string ProductName { get; set; }
            public decimal UnitPrice { get; set; }
            public string Description { get; set; }
            public string Category { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    Login.Text = "Profile";
                    Login.NavigateUrl = "UserProfilePage.aspx";
                }
                else
                {
                    // If not logged in, set the default values
                    Login.Text = "Login";
                    Login.NavigateUrl = "LoginPage.aspx";
                }

                // Retrieve data from the flower_table in bouqsDB database
                List<CartItem> cartItems = GetCartItemsFromDatabase();

                if (cartItems != null && cartItems.Count > 0)
                {
                    // Bind the selected products to your cart view
                    cartGridView.DataSource = cartItems;
                    cartGridView.DataBind();
                }
                else
                {
                    // Display a message or handle the case where no items are selected
                    cartEmptyMessage.Visible = true;
                }
            }
        }

        private List<CartItem> GetCartItemsFromDatabase()
        {
            try
            {
                string connectionString = "Data Source=LAPTOP-BUK2PHJG\\SQLEXPRESS;Initial Catalog=BouqsBD;Integrated Security=True";
                string selectQuery = "SELECT product_name, product_unit_price, product_picture, product_desc, product_category FROM product_table";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(selectQuery, connection))
                    {
                        DataTable cartDataTable = new DataTable();
                        adapter.Fill(cartDataTable);

                        // If you have a DataTable, you can convert it to a list of CartItems
                        List<CartItem> cartItems = cartDataTable.AsEnumerable()
                            .Select(row => new CartItem
                            {
                                ProductName = row.Field<string>("product_name"),
                                Description = row.Field<string>("product_desc"),
                                Category = row.Field<string>("product_category"),
                                UnitPrice = GetDecimalValue(row, "product_unit_price")
                            })
                            .ToList();

                        return cartItems;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (log or display an error message)
                Response.Write($"Error: {ex.Message}");
                return null;
            }
        }

        private decimal GetDecimalValue(DataRow row, string columnName)
        {
            if (row.IsNull(columnName))
            {
                return 0; // or set it to some default value
            }

            decimal result;
            if (decimal.TryParse(row[columnName].ToString(), out result))
            {
                return result;
            }
            else
            {
                // Handle the case where the conversion fails
                return 0; // or set it to some default value
            }
        }

        public static string SaveOrderDetails(string userName, string telNo, string userEmail, string shippingAddress, string paymentMethod)
        {
            try
            {
                string connectionString = "Data Source=LAPTOP-BUK2PHJG\\SQLEXPRESS;Initial Catalog=BouqsBD;Integrated Security=True";
                string insertQuery = "INSERT INTO purchase_table (user_name, telNo, user_email, shipping_address, payment_method) " +
                                     "VALUES (@UserName, @TelNo, @UserEmail, @ShippingAddress, @PaymentMethod)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@UserName", userName);
                        command.Parameters.AddWithValue("@TelNo", telNo);
                        command.Parameters.AddWithValue("@UserEmail", userEmail);
                        command.Parameters.AddWithValue("@ShippingAddress", shippingAddress);
                        command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                        command.ExecuteNonQuery();
                    }
                }

                // Return a success message
                return "Order details saved successfully";
            }
            catch (Exception ex)
            {
                // Log the exception for further investigation
                Console.WriteLine("Exception: " + ex.Message);
                // Return an error message
                return "Error saving order details. Please try again.";
            }
        }
    }
}
