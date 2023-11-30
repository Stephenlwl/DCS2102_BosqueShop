<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DCS2102_GroupAssignment2.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>The Flower Shop</title>
    <link rel="stylesheet" href="HomePage.css" />

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
        <asp:HyperLink ID="Login" runat="server"></asp:HyperLink>
        </nav>
        <header>
            <div class="header_container">
                <h3>Birthday Shopping Made Easy.</h3>
                <h1>Happy Bouqsday!</h1>
                <p>
                    Order Now for November Birthsays and save 25%<br />
                    sitewide. Use the promo code: BOUQSDAY
                </p>
                <button id="shopNow_button" onclick="shopPage()" value="Shop Now">Shop Now</button>
            </div>
        </header>
        <br />
        <div class="row">
            <div class="column1">
        <image src="Images/bgImage4.jpg" class="bgImage" float="left"></image>
        </div>
            <div class="column2"></div>
            <div class="intro_section">
            <h3>Making Bouquets with Passion</h3>
            <h1>We bring Spring freshness to your home!</h1>
            <p>
                We often take for granted the beauty of this world:<br />
                the flowers, the trees, the birds, the clouds – even those we love.<br />
                Because we see things so often, we see them less and less.
            </p>
            <button id="aboutUs_button" onclick="aboutUs()" value="What We Do?">What We Do?</button>
        </div>
       </div>
    </form> 
    <footer>
            <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
        </footer>
</body>
</html>
