using System;
using System.Data;
using System.Data.SqlClient;

namespace DCS2102_GroupAssignment2
{
    public partial class HistoryPurchase : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = GetCurrentUsername();

                // Fetch purchase history data for the specific user
                DataTable dt = GetPurchaseHistory(username);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private DataTable GetPurchaseHistory(string username)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PurchaseId");
            dt.Columns.Add("ItemName");
            dt.Columns.Add("PurchaseDate");
            dt.Columns.Add("PricePerUnit");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("TotalPrice");

            connection.Open();
            SqlCommand command = new SqlCommand("SELECT purchase_id, flower_name, purchase_date, flower_unit_price, flower_quantity, flower_total_price FROM purchase_table WHERE user_name = @user_name", connection);
            command.Parameters.AddWithValue("@user_name", username);

            SqlDataReader reader = command.ExecuteReader();

            string currentPurchaseId = null;

            while (reader.Read())
            {
                string purchaseId = reader["purchase_id"].ToString();

                if (purchaseId != currentPurchaseId)
                {
                    // Add a row for each purchase
                    dt.Rows.Add(
                        purchaseId,
                        reader["flower_name"], 
                        reader["purchase_date"], 
                        reader["flower_unit_price"],
                        reader["flower_quantity"], 
                        reader["flower_total_price"] 
                    );

                    currentPurchaseId = purchaseId;
                }
                else
                {
                    // Add additional rows for the same purchase (different products)
                    dt.Rows.Add(
                        null, // or string.Empty depending on your needs
                        reader["flower_name"], 
                        reader["purchase_date"], 
                        reader["flower_unit_price"], 
                        reader["flower_quantity"], 
                        reader["flower_total_price"] 
                    );
                }
            }

            connection.Close();

            return dt;
        }

        // to get the current username
        private string GetCurrentUsername()
        {
            // Retrieve the username from the user session
            return Session["Username"] as string ?? "DefaultUsername";
        }
    }
}
