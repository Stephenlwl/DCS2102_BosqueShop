<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="DCS2102_GroupAssignment2.ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Flower Shop-contact page</title>
    <style type="text/css">
        body {
            background-color: #F8E8EE;
            overflow-x: hidden;
            font-family: 'Arial Rounded MT';
            color: #252525;
        }

        .logoName {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 150px;
        }

        nav {
            background-color: #F9F5F6;
            padding: 30px 22%;
            margin: -10px;
            white-space: nowrap;
            overflow: hidden;
        }

        a {
            text-decoration: none;
            color: #252525;
            font-size: 24px;
            font-family: Pristina, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: bold;
            margin: 20px;
            padding: 20px;
            text-align: center;
        }

            a:hover {
                color: #F2BED1;
            }

        h2 {
            text-align: center;
            margin: 10px; 
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .row {
            margin: 10px -10px;
        }

        .container_contactImage {
            width: 50%;
            float: left;
            height: 580px;
        }

        .container_contactform {
            width: 50%;
            height: 580px;
            float: right;
            background-color: #ded7dc;
            font-size: 24px;
        }

        #user_name, #user_email, #phone_no, #message {
            padding: 10px;
            margin: 5px 0px 20px 0px;
            border-radius: 2px;
            border: 3px solid #60dfd4;
        }


        #submit, #reset {
            background-color: #252525;
            border: 2px solid #f5f5f5;
            padding: 20px;
            margin: 5px auto;
            border-radius: 5px;
            color: #f5f5f5;
        }

            #submit:hover, #reset:hover {
                background-color: #f5f5f5;
                border: 2px solid #252525;
                padding: 20px;
                margin: 5px auto;
                border-radius: 5px;
                color: #252525;
            }

        .form {
            padding-left: 10%;
        }

        @media only screen and (max-width: 800px) {
            h2{
                margin: 10px; 
            }

            .container_contactImage {
                width: 100%;
                background-size: cover;
                position: relative; 
                height: 650px;
            }

            .container_contactform {
                width: 90%;
                position: absolute;
                opacity: 0.9;
                padding: 2% 0%;
                margin: 4% 5%;
                height: 80%;
                }

             #user_name, #user_email, #phone_no, #message {
                 padding: 10px;
                 margin: 5px 0px 15px 0px;
                 border-radius: 2px;
                 border: 3px solid #60dfd4;
             }


            .form {
                padding-left: 10%;
            }


        }
        footer {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 12px;
            color: #000000;
            text-align: center;
            margin-top: 15px 0px;
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
            <a href="ShopPage.aspx">Shop</a>
            <a href="#">Cart</a>
            <!-- Update the login button with an ID and a data attribute to store the default href
            once the user success login the label text will change to Profile-->
            <asp:HyperLink ID="Login" runat="server"></asp:HyperLink>
        </nav>
        <br />
        <div class="row">
            <img src="Images/bgImage5.jpg" class="container_contactImage" />
            <div class="container_contactform">
                <h2>~ Contact Form ~</h2>
                <div class="form">
                    <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
                    <br />
                    <asp:TextBox runat="server" ID="user_name"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Email: "></asp:Label>
                    <br />
                    <asp:TextBox runat="server" ID="user_email"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Phone Number: " ></asp:Label>
                    <br />
                    <asp:TextBox runat="server" ID="phone_no" ></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Your Query/Question: " ></asp:Label>
                    <br />
                    <asp:TextBox runat="server" ID="message" placeholder="Place Your Question..." Height="85px" Width="321px" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:Button runat="server" OnClick="submit_button" ID="submit" Text="Submit" ValidationGroup="ContactForm"/>
                    <asp:Button runat="server" OnClick="reset_button" ID="reset" Text="Reset" />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        DisplayMode="BulletList" ForeColor="Red" ShowSummary="true"
                        HeaderText="Errors:" ValidationGroup="ContactForm" />
                </div>

            </div>
        </div>
        <footer>
            <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
        </footer>
    </form>
</body>
</html>
