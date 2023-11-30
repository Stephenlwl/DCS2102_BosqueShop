using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bouqs
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate Flower Types
                flowerTypeRepeater.DataSource = GetFlowerTypes();
                flowerTypeRepeater.DataBind();

                // Populate Accessories
                accessoryRepeater.DataSource = GetAccessories();
                accessoryRepeater.DataBind();

                // Initialize the ViewState["SelectedProducts"]
                ViewState["SelectedProducts"] = new List<string>();
            }
        }

        protected void SelectProduct(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var selectedProduct = button.CommandArgument;

            // Add the selected product to the repeater
            List<string> selectedProducts = ViewState["SelectedProducts"] as List<string> ?? new List<string>();
            selectedProducts.Add(selectedProduct);
            ViewState["SelectedProducts"] = selectedProducts;

            // Bind the updated list to the repeater
            selectedProductRepeater.DataSource = selectedProducts;
            selectedProductRepeater.DataBind();
        }

        protected void AddToCart(object sender, EventArgs e)
        {
            List<string> selectedProducts = ViewState["SelectedProducts"] as List<string>;

            if (selectedProducts != null && selectedProducts.Count > 0)
            {
                // Store selected products in session
                Session["SelectedProducts"] = selectedProducts;

                // Perform the logic to add products to the database
                SaveSelectedProductsToDatabase(selectedProducts);

                // Redirect to the Cart page after successfully saving items
                Response.Redirect("Cart.aspx");
            }
            else
            {
                // Display a message if no items are selected
                ScriptManager.RegisterStartupScript(this, GetType(), "emptyCartAlert", "alert('No items selected!');", true);
            }
        }

        private void SaveSelectedProductsToDatabase(List<string> selectedProducts)
        {
            try
            {
                // Connection string with the database connection string
                string connectionString = "Data Source=LAPTOP-BUK2PHJG\\SQLEXPRESS;Initial Catalog=BouqsBD;Integrated Security=True;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    foreach (string productName in selectedProducts)
                    {
                        // Retrieve product details based on the product name
                        ProductDetails productDetails = GetProductDetailsByName(productName);

                        // Use parameterized query to prevent SQL injection
                        string insertQuery = "INSERT INTO product_table (product_name, product_unit_price, product_picture, product_desc, product_category) " +
                                             "VALUES (@ProductName, @UnitPrice, @Picture, @Description, @Category)";

                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            // Add parameters for each column
                            command.Parameters.AddWithValue("@ProductName", productDetails.Name);
                            command.Parameters.AddWithValue("@UnitPrice", productDetails.UnitPrice);
                            command.Parameters.AddWithValue("@Picture", productDetails.Picture);
                            command.Parameters.AddWithValue("@Description", productDetails.Description);
                            command.Parameters.AddWithValue("@Category", productDetails.Category);

                            command.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception message
                ScriptManager.RegisterStartupScript(this, GetType(), "dbErrorAlert", $"alert('Database Error: {ex.Message}');", true);
            }
        }

        // You need to implement this method to retrieve product details based on the product name
        private ProductDetails GetProductDetailsByName(string productName)
        {
            return new ProductDetails
            {
                Name = productName,
                UnitPrice = 0.00M,  // You need to fetch the actual price from your data source
                Picture = "custom_image.jpg",  // You need to fetch the actual picture from your data source
                Description = "Custom Bouquet",  // You can customize this as needed
                Category = "Custom"  // This can be used to distinguish custom products
            };
        }

        // Define a class to hold product details
        public class ProductDetails
        {
            public string Name { get; set; }
            public decimal UnitPrice { get; set; }
            public string Picture { get; set; }
            public string Description { get; set; }
            public string Category { get; set; }

            // Add other details as needed
        }

        private List<Product> GetFlowerTypes()
        {
            return new List<Product>
    {
        new Product("Rose", 10.99M, "images/rose.png", "Rose description", "FlowerType"),
        new Product("Lavender", 12.99M, "images/lavender.png", "Lavender description", "FlowerType"),
        new Product("Tulip", 8.99M, "images/tulip.png", "Tulip description", "FlowerType"),
        new Product("Bluebell", 9.99M, "images/bluebell.png", "Bluebell description", "FlowerType"),
        new Product("Carnation", 11.99M, "images/carnation.png", "Carnation description", "FlowerType"),
    };
        }

        private List<Product> GetAccessories()
        {
            return new List<Product>
    {
        new Product("No Accessories", 0.00M, "images/skip.png", "No Accessories description", "Accessory"),
        new Product("Teddy Bear", 15.99M, "images/teddyBear.jpg", "Teddy Bear description", "Accessory"),
        new Product("Hello Kitty", 12.99M, "images/helloKitty.jpg", "Hello Kitty description", "Accessory"),
        new Product("Cinnamoroll", 11.99M, "images/cinnamoroll.png", "Cinnamoroll description", "Accessory"),
        new Product("Kirby", 14.99M, "images/kirby.jpeg", "Kirby description", "Accessory")
    };
        }

        public class Product
        {
            public string Name { get; set; }
            public decimal UnitPrice { get; set; }
            public string Picture { get; set; }
            public string Description { get; set; }
            public string Category { get; set; }

            public Product(string name, decimal price, string picture, string description, string category)
            {
                Name = name;
                UnitPrice = price;
                Picture = picture;
                Description = description;
                Category = category;
            }
        }
    }
}
