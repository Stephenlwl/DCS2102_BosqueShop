using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCS2102_GroupAssignment2
{
    public partial class LoginPage : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user_name = TextBox1.Text;
            string user_password = TextBox2.Text;

            if (ValidateLogin(user_name, user_password))
            {

                // Successful login, store user information in session
                Session["LoggedIn"] = true;
                Session["Username"] = user_name;
                Session["Password"] = user_password;

                // Store success message in session
                Session["SuccessMessage"] = "Login Successful! Welcome Back";

                // Add this line for debugging
                Response.Write("Login successful");

                // Successful login, redirect to the home page
                Response.Redirect("UserProfilePage.aspx");
            }
            else
            {
                // Display an error message for unsuccessful login
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Invalid credentials');", true);
            }

        }

        private bool ValidateLogin(string userName, string password)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM user_table WHERE user_name = @user_name AND user_password = @user_password", connection);

            // Add parameters and provide values
            command.Parameters.AddWithValue("@user_name", userName);
            command.Parameters.AddWithValue("@user_password", password);

            int count = (int)command.ExecuteScalar();
            connection.Close();

            return count > 0;
        }
    }
}