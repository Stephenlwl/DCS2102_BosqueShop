using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Florist
{
    public partial class ShopPage : System.Web.UI.Page
    {
        public class Flower
        {
            public int FlowerId { get; set; }
            public string FlowerName { get; set; }
            public decimal FlowerUnitPrice { get; set; }
            public string FlowerPicture { get; set; }
            public string FlowerDesc { get; set; }
            public string FlowerCategory { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFlowerData();
                BindAccessoriesData();
            }
        }

        private void BindFlowerData()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["BouqsBDConnectionString"].ConnectionString;
            var flowers = new List<Flower>();

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                var query = "SELECT * FROM flower_table";
                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var flower = new Flower
                            {
                                FlowerId = reader["flower_id"] == DBNull.Value ? 0 : Convert.ToInt32(reader["flower_id"]),
                                FlowerName = reader["flower_name"] == DBNull.Value ? string.Empty : reader["flower_name"].ToString(),
                                FlowerUnitPrice = reader["flower_unit_price"] == DBNull.Value ? 0 : Convert.ToDecimal(reader["flower_unit_price"]),
                                FlowerPicture = reader["flower_picture"] == DBNull.Value ? string.Empty : reader["flower_picture"].ToString(),
                                FlowerDesc = reader["flower_desc"] == DBNull.Value ? string.Empty : reader["flower_desc"].ToString(),
                                FlowerCategory = reader["flower_category"] == DBNull.Value ? string.Empty : reader["flower_category"].ToString()
                            };

                            flowers.Add(flower);
                        }
                    }
                }
            }

            var serializer = new JavaScriptSerializer();
            var flowerJson = serializer.Serialize(flowers);
            ScriptManager.RegisterStartupScript(this, GetType(), "BindFlowerData", $"updateFlowerData({flowerJson});", true);
        }

        private void BindAccessoriesData()
        {
            // Similar logic as BindFlowerData but for accessories data
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            var selectedFlowers = GetSelectedItems("flower-checkbox");
            var selectedAccessories = GetSelectedItems("accessory-checkbox");

            // Process the selected items (add to cart logic)
            // You can use the selectedFlowers and selectedAccessories lists as needed
            // Example: Save the selections in the database or session for further processing

            // Redirect to the cart page or display a confirmation message
            Response.Redirect("CartPage.aspx");
        }

        private List<int> GetSelectedItems(string checkboxClass)
        {
            var selectedItems = new List<int>();
            var selectedCheckboxes = Request.Form.Cast<string>().Where(key => key.EndsWith(checkboxClass) && Request.Form[key] == "on");

            foreach (var key in selectedCheckboxes)
            {
                var itemId = Convert.ToInt32(key.Split('_')[1]);
                selectedItems.Add(itemId);
            }

            return selectedItems;
        }
    }
}