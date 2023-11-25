using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCS2102_GroupAssignment2
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            // Check if textboxes are not empty
            if (string.IsNullOrWhiteSpace(username.Text) || string.IsNullOrWhiteSpace(email.Text) || string.IsNullOrWhiteSpace(password.Text) || string.IsNullOrWhiteSpace(confirmPassword.Text))
            {
                // Display an error message or take appropriate action
                passwordError.InnerText = "Please fill in all the fields";
                return;
            }

            if (!validatePassword())
            {
                // Password validation failed
                return;
            }

            connection.Open();

            // Check if the username already exists
            using (SqlCommand checkUserCmd = new SqlCommand("SELECT COUNT(*) FROM user_table WHERE user_name = @Username", connection))
            {
                checkUserCmd.Parameters.AddWithValue("@Username", username.Text);
                int userCount = (int)checkUserCmd.ExecuteScalar();

                if (userCount > 0)
                {
                    // Username already exists, display an error message or take appropriate action
                    passwordError.InnerText = "Username already exists";
                    connection.Close();
                    return;
                }
            }

            // Proceed with the registration
            using (SqlCommand cmd = new SqlCommand("INSERT INTO user_table (user_name, user_email, user_password) VALUES (@Username, @Email, @PasswordHash)", connection))
            {
                cmd.Parameters.AddWithValue("@Username", username.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                // Hash the password before storing it
                string hashedPassword = HashPassword(password.Text);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                cmd.ExecuteNonQuery();
            }

            connection.Close();

            // Redirect to login page or do something else after successful registration
            Response.Redirect("LoginPage.aspx", true);
        }

        private string HashPassword(string password)
        {
            // Implement a secure password hashing algorithm (e.g., using bcrypt or Argon2)
            // This is a simplified example, not suitable for production
            return password;
        }

        private bool validatePassword()
        {
            if (password.Text != confirmPassword.Text)
            {
                passwordError.InnerText = "Password and Confirm Password do not match";
                return false;
            }
            else
            {
                passwordError.InnerText = "";
                return true;
            }
        }
    }
}