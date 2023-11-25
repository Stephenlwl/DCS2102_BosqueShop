<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="DCS2102_GroupAssignment2.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="HomePage.css" />
    <title>The Flower Shop-Login</title>
    <style>
        
        .back_icon {
            height: 50px;
            width: 50px;
            margin-right: 20px;
            display: block;
            margin: -50px 0px; 

        }


        .container {
            background-color: #B9B4C7;
            display: flex;
            flex-direction: row; /* Updated to row */
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            min-height: calc(100vh - 100px); /* Minimize the bottom space */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            opacity: 0.9;
        }

        .form {
            background-color: #f0f0f0;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            text-align: center;
            height: 90%;
        }

            .form .input-container {
                display: flex;
                align-items: center; /* Align icon and input vertically */
                margin-bottom: 50px;
                justify-content: center; /* Center the image horizontally */
            }

                .form .input-container img {
                    width: 30px;
                    height: auto;
                    margin-right: 10px; /* Add spacing between icon and input */
                }

            .form input {
                flex: 1; /* Take up remaining space */
                padding: 10px;
                border: none; /* Remove border */
                border-bottom: 1px solid #000; /* Add a bottom border */
                outline: none; /* Remove input outline */
            }

        #Button1 {
            width: 45%;
            background-color: #131010;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
    <script>
        function togglePassword() {
            var passwordInput = document.getElementById('<%= TextBox2.ClientID %>');
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }

        function validateLogin() {
            var username = document.getElementById('<%= TextBox1.ClientID %>').value;
            var password = document.getElementById('<%= TextBox2.ClientID %>').value;
            var isValid = validateOnServer(username, password);

            if (isValid) {
                // No need to display an error message here, as server-side validation will handle it
                return true;  // Return true to allow the server-side event to execute
            } else {
                // Display an error message if needed (this is optional)
                var errorMessage = document.getElementById("errorMessage");
                errorMessage.style.display = "block";
                errorMessage.innerHTML = "Invalid username or password. Please try again.";
                return false; // Return false to prevent the server-side event from executing
            }
        }
    </script>
</head>
<body >

        <img class="logoName" src="Images/FlowerShopLogo.png" />
     <form id="form1" runat="server" style="background-image: url(../Images/bgImage2.jpeg); background-size: cover; margin: -10px -10px -10px -10px; padding: 2%;" >        
        <div class="container">
            <!-- Login on the center -->
            <div class="form">
                <a href="HomePage.aspx">
                    <img src="Images/arrow-left.png" class="back_icon" alt="arrow-left" /></a>
                    <h2>Log in</h2>
            <div class="input-container">
                <img src="Images/user.png" alt="Username Icon" height="30" width="30" />&nbsp;
                <asp:TextBox runat="server" ID="TextBox1" required />
            </div>
            <div class="input-container">
                <img src="Images/password.png" alt="Password Icon" height="30" width="30" />&nbsp;
                <asp:TextBox runat="server" ID="TextBox2" TextMode="Password" required />
                <input type="checkbox" id="showPassword" onclick="togglePassword()" />
                Show Password
            </div>
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" OnClientClick="validateLogin(); return false;" />
            <br />
            <p>Not registered? <a href="RegistrationPage.aspx"><u style="font-family: 'Arial Rounded MT';">Sign up</u></a></p>
            <br />
            </div>
        </div>
        <br />
        <div id="errorMessage" class="error-message" style="display: none; color: #f94f4f"></div>
   
    </form> 
    <footer>
            <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
        </footer>
</body>
</html>