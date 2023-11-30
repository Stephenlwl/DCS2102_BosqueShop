<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfilePage.aspx.cs" Inherits="DCS2102_GroupAssignment2.UserProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Flower Shop-Profile</title>
    <link rel="stylesheet" href="UserProfile.css" />

    <style type="text/css">
        .column_profile {
            float: left;
            width: 35%;
            padding: 0px 20px 20px 20px;
            display: block;
            background-color: #B9B4C7;
        }

        @media screen and (max-width: 780px) {
            .column_profile {
                width: 100%;
                margin-top: 10px;
            }

            .column_changePassword {
                width: 100%;
                margin: 0;
            }

            .column_recipe {
                width: 100%;
                margin: 0;
            }

            #content_section{
                width: 100%;
            }
        }

        #Button2 {
            padding: 10px;
            border: 2px solid #252525;
            height: 30%;
            width: 30%;
            margin: 10px auto;
            text-align: center;
            background-color: #252525;
            border-radius: 5px;
            color: #f5f5f5;
            cursor: pointer;
        }

            #Button2:hover {
                background-color: #B9B4C7;
                border-radius: 5px;
                color: #252525;
            }

        #FileUpload1 {
            font-size: 16px;
            padding: 10px;
            width: 60%;
            height: 60%;
            border-radius: 10px;
            display: block;
            margin: 0 auto;
            background-color: #B9B4C7;
            border: 3px solid #f5f5f5;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <img class="logoName" src="Images/FlowerShopLogo.png" />
        <hr style="border: 3px solid #808080; border-radius: 5px;" />
        <nav>
            <a href="HomePage.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="ContactPage.aspx">Contact US</a>
            <a href="Shop.aspx">Shop</a>
            <a href="Cart.aspx">Cart</a>

            <!-- Update the login button with an ID and a data attribute to store the default href
            once the user success login the label text will change to Profile-->
            <asp:LinkButton ID="logout" runat="server" OnClick="Logout_Button_Click">Logout</asp:LinkButton>

        </nav>
        <div class="row">
            <div class="column_profile">

                <!-- Displaying the success login user information here -->
                <h1>Profile</h1>
                <div class="profile_section">

                    <!-- User Info -->
                    <label for="profilePictureInput">
                        <img id="profilePicture" runat="server" src="Images\profile_pic_unknown.jpg" alt="Profile Profile Image" />
                    </label>

                    <p>Username: <span id="user_name" runat="server"></span></p>
                    <p>Email: <span id="user_email" runat="server"></span></p>

                    <label for="user_info">About Me:</label>
                    <p id="about_me" runat="server"></p>

                </div>

            </div>

            <!-- Edit/ Upload / View Purchase History -->
            <div class="column_view">
                <nav class="view_edit_bar">
                    <ul>
                        <li><a href="#" onclick="loadContent('HistoryPurchase')">Purchase History</a></li>
                        <li><a href="#" onclick="loadContent('EditProfile')">Edit Profile</a></li>
                    </ul>
                </nav>
                <div id="contentSection">
                    <iframe id="content_section" src="EditProfile.aspx" width="62%" height="500" frameborder="0"></iframe>
                </div>
            </div>
        </div>
        </form>
        <script>
            function loadContent(contentType) {
                // Hide all sections
                document.getElementById("contentSection").style.display = "none";

                // Determine which section to display based on the contentType
                switch (contentType) {
                    case 'EditProfile':
                        displayEditSection();
                        break;
                    case 'HistoryPurchase':
                        displayHistorySection();
                        break;
                    default:
                        // Default to display edit section
                        displayEditSection();
                        break;
                }
            }

            function displayHistorySection() {
                document.getElementById("content_section").src = "HistoryPurchase.aspx";
                document.getElementById("contentSection").style.display = "block";
            }

            function displayEditSection() {
                document.getElementById("content_section").src = "EditProfile.aspx";
                document.getElementById("contentSection").style.display = "block";
            }

}
        </script>
</body>
</html>
