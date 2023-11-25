using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCS2102_GroupAssignment2
{
    public partial class UserProfilePage : System.Web.UI.Page
    {
        // Connect with the RecipeHelp Database
        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");

        //Happen went the page is loaded
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get the current username (success login user info)
                string currentUsername = GetCurrentUsername();


                // Set the current username in TextBox1
                user_name.InnerText = currentUsername;

                // detect whether success login or not
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    // Get the username from the session
                    string username = Session["Username"].ToString();
                    string email = GetUserEmail(username);
                    // Check if the user has about me data in the database
                    string aboutMe = GetCurrentAboutMe(username);
                    if (!string.IsNullOrEmpty(email))
                    {
                        user_email.InnerText = email;
                    }
                    else
                    {
                        user_email.InnerText = "User Email No Exist!";
                    }

                    if (!string.IsNullOrEmpty(aboutMe))
                    {
                        // If a user picture exists, set the src attribute
                        about_me.InnerText = aboutMe;
                    }
                    else
                    {
                        // If no user picture exists, set it to the default image path
                        about_me.InnerText = "Hi ! Welcome to my page, Write something to intro yourself !!";
                    }

                    // Check if the user has a profile picture in the database
                    string userPicture = GetUserPicture(username);

                    if (!string.IsNullOrEmpty(userPicture))
                    {
                        // If a user picture exists, set the src attribute
                        profilePicture.Src = "data:image/jpeg;base64," + userPicture;
                    }
                    else
                    {
                        // If no user picture exists, set it to the default image path
                        profilePicture.Src = "Images/profile_pic_unknown.jpg";
                    }
                }

                else
                {
                    // If the user is not logged in, redirect to the login page
                    Response.Redirect("LoginPage.aspx");
                }
            }

        }

        // to get the current username
        private string GetCurrentUsername()
        {
            //Retrieve the username from user session
            return Session["Username"] as string ?? "DefaultUsername";
        }

        //get the current user's about me data
        private string GetCurrentAboutMe(string username)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT about_me FROM user_table WHERE user_name = @user_name", connection);
            command.Parameters.AddWithValue("@user_name", username);
            string about_me = command.ExecuteScalar() as string;
            connection.Close();

            return about_me;
        }

        // Method to get the user picture from the database
        private string GetUserPicture(string username)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT user_picture FROM user_table WHERE user_name = @user_name", connection);
            command.Parameters.AddWithValue("@user_name", username);
            string userPicture = command.ExecuteScalar() as string;
            connection.Close();

            return userPicture;
        }

        // Method to get the user picture from the database
        private string GetUserEmail(string username)
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT user_email FROM user_table WHERE user_name = @user_name", connection);
            command.Parameters.AddWithValue("@user_name", username);
            string userEmail = command.ExecuteScalar() as string;
            connection.Close();

            return userEmail;
        }

       

        protected void Logout_Button_Click(object sender, EventArgs e)
        {
            // Clear the authentication cookie
            FormsAuthentication.SignOut();

            // Clear the session variables
            Session.Clear();

            // Redirect to the homepage
            Response.Redirect("HomePage.aspx");
        }
    }
}