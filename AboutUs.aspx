<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="DCS2102_GroupAssignment2.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Flower Shop</title>
    <link rel="stylesheet" href="HomePage.css" />
    <style type="text/css">
        .container_aboutUs {
            background-image: url(../Images/bgImage3.jpg);
            background-size: cover;
            margin: -10px;
            padding-top: 2%;
            padding-bottom: 2%;
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
            <a href="#">Contact US</a>
            <a href="#">Shop</a>
            <a href="#">Cart</a>
            <!-- Update the login button with an ID and a data attribute to store the default href
            once the user success login the label text will change to Profile-->
            <asp:HyperLink ID="Login" runat="server"></asp:HyperLink>
        </nav>
        <br />
        <div class="container_aboutUs">
            <div class="header_container">
                <h1>The Bouqs Difference</h1>
                <h3>Tooted In Kindness</h3>
                <p>We're more than just a pretty vase. Learn more about out flower, our value, and our commitmenr to the planet.</p>
            </div>
        </div>
        <footer>
            <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
        </footer>
    </form>
</body>
</html>
