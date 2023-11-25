<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="DCS2102_GroupAssignment2.RegistrationPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="HomePage.css" />
    <title>The Flower Shop-Registration</title>
    <style>
        .container {
            background-color: #B9B4C7;
            display: flex;
            flex-direction: row; /* Updated to row */
            width: 60%;
            margin: 0 auto;
            padding: 30px;
            // min-height: calc(100vh - 100px); /* Minimize the bottom space */
            opacity: 0.9;
        }

        .left-side{
            float: left;
            width: 60%;
        }
        
        
        .right-side {
                float: right;
                width: 50%;
                height: 50%;
                margin: auto;
        }

        .back_icon {
            height: 50px;
            width: 50px;
            margin-right: 20px;
            display: block;
            margin: -70px 0px;
        }

        .form {
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 40%;
            margin: 0 auto;
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

        #Button1, #Button2 {
            width: 45%;
            background-color: #131010;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin: 10px auto 0px auto;
        }

        #showPassword {
            margin-right: 50%;
        }

        @media only screen and (max-width: 1300px) {

            .left-side {
                width: 100%;
            }

            .right-side {
                width: 80%;
                margin-left: -20%;
                margin-right: -20%;
            }

            .container{
                width: 90%;
            }
        }

        row::after {
            content: "";
            display: table;
            clear: both;
        }

    </style>
    <script>
        var isPasswordVisible = false;

        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var passwordError = document.getElementById("passwordError");

            if (!isPasswordVisible && password !== confirmPassword) {
                passwordError.textContent = "Password and Confirm Password do not match";
                passwordError.style.color = "red"; // Set the color to red
                return false;
            } else {
                passwordError.textContent = "";
                return true;
            }
        }

        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("password");
            var confirmPasswordInput = document.getElementById("confirmPassword");
            var showPasswordCheckbox = document.getElementById("showPassword");

            isPasswordVisible = showPasswordCheckbox.checked;

            passwordInput.type = isPasswordVisible ? "text" : "password";
            confirmPasswordInput.type = isPasswordVisible ? "text" : "password";
        }
    </script>
</head>
<body>
    <img class="logoName" src="Images/FlowerShopLogo.png" />
    <row>
        <form id="form1" runat="server" style="background-image: url(../Images/bgImage3.jpg); background-size: cover; margin: -10px -10px -10px -10px; padding: 2%;">
        
        <div class="container">

            <!-- Sign Up on the left side -->
            <div class="form" id="registration-form">
                <div class="left-side">
                    <h1><a href="HomePage.aspx">
                        <img src="Images/arrow-left.png" class="back_icon" alt="arrow-left" /></a></h1>
                    <h2 style="text-align: left;">Sign Up</h2>
                    <div class="input-container">
                        <img src="Images/user.png" alt="Username Icon" height="30" width="30" />&nbsp;
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-container">
                        <img src="Images/email.png" alt="Email Icon" height="30" width="30" />&nbsp;
                        <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="input-container">
                        <img src="Images/password.png" alt="Password Icon" height="30" width="30" />
                        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;
                    </div>
                    <div class="input-container">
                        <img src="Images/password.png" alt="Password Icon" height="30" width="30" />
                        <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;
                    </div>
                    <div class="input-container">
                        <label for="showPassword">Show Password</label>
                        <input type="checkbox" id="showPassword" onchange="togglePasswordVisibility()" />

                        &nbsp;
                    </div>
                    <!-- Add this div for displaying password error -->
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClientClick="return validatePassword();" OnClick="SignupButton_Click" />
                    <div>
                        <p id="passwordError" class="error-message" runat="server" style="color: #f94f4f"></p>
                    </div>
                    <br />
                </div>
            </div>
            <div class="right-side">
                <!-- Login on the right side -->
                <div class="form">
                    <img class="logoName" src="Images/FlowerShopLogo.png" />

                    <h2>Already have an account?</h2>
                    <asp:Button ID="Button2" runat="server" Text="Login" PostBackUrl="LoginPage.aspx" />
                    <br />
                    <br />

                </div>
            </div>
        </div>
    </form>
    </row>
    <footer>
        <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
    </footer>
</body>
</html>
