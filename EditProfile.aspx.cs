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
    public partial class EditProfile : System.Web.UI.Page
    {
        // connect with the RecipeHelp Sql database server
        SqlConnection connection = new SqlConnection("Data Source=HP\\SQLEXPRESS;Initial Catalog=BouqsDB;Integrated Security=True");

        //Happen went the page is loaded
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get the current username (success login user info)
                string currentUsername = GetCurrentUsername();


                // Set the current username in TextBox1
                TextBox1.Text = currentUsername;

                // detect whether success login or not
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    // Get the username from the session
                    string username = Session["Username"].ToString();

                    // Check if the user has about me data in the database
                    string aboutMe = GetCurrentAboutMe(username);
                    if (!string.IsNullOrEmpty(aboutMe))
                    {
                        // If a user picture exists, set the src attribute
                        TextArea1.Text = aboutMe;
                    }
                    else
                    {
                        // If no user picture exists, set it to the default image path
                        TextArea1.Text = "Hi ! Welcome to my page, Write something to intro yourself !!";
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

        private bool IsUsernameDuplicate(string user_name)
        {
            // Check if the user_name already exists in the database
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM user_table WHERE user_name = @user_name", connection);
            command.Parameters.AddWithValue("@user_name", user_name);
            int count = (int)command.ExecuteScalar();
            connection.Close();

            // If count > 0, it means the user_name is already in the database
            return count > 0;
        }

        // user profile upload and about me update
        protected void Button2_Click(object sender, EventArgs e)
        {
            String about_me = TextArea1.Text;
            string user_name = GetCurrentUsername(); //to modify the actual user data
            Session["aboutMe"] = about_me;

            // if user has upload the image file then will save and display the latest user picture
            if (FileUpload1.HasFile)
            {
                // Convert the image file to a Base64-encoded string
                string base64Image = Convert.ToBase64String(FileUpload1.FileBytes);

                // store and update the 'base64Image' in the RecipeHelp database for record
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE user_table SET about_me = @about_me, user_picture = @user_picture WHERE user_name = @user_name", connection);
                command.Parameters.AddWithValue("@about_me", about_me);
                command.Parameters.AddWithValue("@user_picture", base64Image);
                command.Parameters.AddWithValue("@user_name", user_name);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);

                // Display the uploaded image
                profilePicture.Src = "data:image/jpeg;base64," + base64Image;

                // Store the Base64-encoded string in the hidden field
                ImagePathHiddenField.Value = "data:image/jpeg;base64," + base64Image;
            }

            // if user no upload the image file the system will only save the about me info
            else
            {
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE user_table SET about_me = @about_me WHERE user_name = @user_name", connection);
                command.Parameters.AddWithValue("@about_me", about_me);
                command.Parameters.AddWithValue("@user_name", user_name);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);

            }

        }

        //update the username 
        protected void Button4_Click(object sender, EventArgs e)
        {
            String user_name = TextBox1.Text,
                    user_new_name = TextBox2.Text;

            if (IsUsernameDuplicate(user_new_name))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Username already exists. Try Another Username!');", true);
            }

            else
            {
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE user_table SET user_name = @user_new_name WHERE user_name = @user_name", connection);
                // Add parameters and provide values
                command.Parameters.AddWithValue("@user_name", user_name);
                command.Parameters.AddWithValue("@user_new_name", user_new_name);

                // include the try catch to detect the error and display the error massage
                try
                {
                    command.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Saved and Changed!');", true);
                    Session["Username"] = user_new_name;
                    TextBox1.Text = user_new_name;

                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error: " + ex.Message + "');", true);


                }
                connection.Close();

            }
        }

        //update the user password
        protected void Button6_Click(object sender, EventArgs e)
        {
            String user_name = TextBox1.Text,
                   user_password = TextBox3.Text,
                   user_new_password = TextBox4.Text,
                   confirmPassword = TextBox5.Text;

            //checking for the similarity between new password and confirm password
            if (user_new_password != confirmPassword)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Your new password and confirm password are NOT Match!');", true);

            }

            connection.Open();
            //update the user password data where the current password meets with the current password 
            SqlCommand command = new SqlCommand("UPDATE user_table SET user_password = @user_new_password WHERE user_name = @user_name AND user_password = @user_password", connection);

            // Add parameters and provide values
            command.Parameters.AddWithValue("@user_password", user_password);
            command.Parameters.AddWithValue("@user_new_password", user_new_password);
            command.Parameters.AddWithValue("@user_name", user_name);

            // use try catch to filter out the error when the system have problem pop up 
            try
            {
                command.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Password Successfully Saved and Changed!');", true);
                Session["Password"] = user_password;

            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error: " + ex.Message + "');", true);


            }
            connection.Close();
        }

    }
}