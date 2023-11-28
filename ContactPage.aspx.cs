using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCS2102_GroupAssignment2
{
    public partial class ContactPage : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");
        // Enable to replace the default label text and url to the userProfilePage
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // get the current username (success login user info)
            string currentUsername = GetCurrentUsername();


            // Set the current username in TextBox1
            user_name.Text = currentUsername;

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
            }
        }

        // to get the current username
        private string GetCurrentUsername()
        {
            //Retrieve the username from user session
            return Session["Username"] as string ?? "Visitor";
        }


        protected void submit_button(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string currentUserName = GetCurrentUsername();

                if (string.IsNullOrEmpty(currentUserName) || string.IsNullOrEmpty(user_email.Text) || string.IsNullOrEmpty(phone_no.Text) || string.IsNullOrEmpty(message.Text))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Please Fill Up All The Sections!');", true);
                }
                else
                {
                    try
                    {
                        using (SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True"))
                        {
                            connection.Open();
                            SqlCommand command = new SqlCommand("INSERT INTO contact_table (user_name, user_email, phone_no, message) VALUES (@user_name, @user_email, @phone_no, @message)", connection);
                            command.Parameters.AddWithValue("@user_name", currentUserName);
                            command.Parameters.AddWithValue("@user_email", user_email.Text);
                            command.Parameters.AddWithValue("@phone_no", phone_no.Text);
                            command.Parameters.AddWithValue("@message", message.Text);
                            command.ExecuteNonQuery();
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Successfully Submitted');", true);
                        }
                    }
                    catch (SqlException ex)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Error: " + ex.Message + "');", true);
                    }
                    finally
                    {
                        connection.Close();
                    }

                    user_email.Text = string.Empty;
                    phone_no.Text = string.Empty;
                    message.Text = string.Empty;
                }
            }
        }

        protected void reset_button(object sender, EventArgs e)
        {
            user_email.Text = string.Empty;
            phone_no.Text = string.Empty;
            message.Text = string.Empty;
        }

    }
}