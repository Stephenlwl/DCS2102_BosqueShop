using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCS2102_GroupAssignment2
{
    public partial class AboutUs : System.Web.UI.Page
    {
        // Enable to replace the default label text and url to the userProfilePage
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
            }
        }
    }
}
