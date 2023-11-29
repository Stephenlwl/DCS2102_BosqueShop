<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Bouqs.Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bouqs - Shop Page</title>
    <style>
        body {
            font-family: 'Arial Rounded MT';
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            background-color: #F8E8EE;
            color: #252525;
        }

        .logoName {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 150px;
        }

        header {
            background-color: #131010;
            padding: 5px 0px 5px 30px;
            margin: -10px -8px 0px -10px;
            color: #ffffff;
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

        section {
            margin: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
            cursor: pointer;
        }

            li:hover {
                text-decoration: underline;
            }

        .row {
            display: flex;
            justify-content: space-between;
        }

        /* Add this style to make images smaller */
        .product-item img {
            max-width: 100px; /* Adjust the size as needed */
            height: auto;
        }

        /* Add this style to make images smaller */
        .product-item img {
            max-width: 100px; /* Adjust the size as needed */
            height: auto;
        }


        /* Style for the "Select" button */
        [id*="selectButton"] {
            display: block;
            margin: 20px auto; /* Center the button */
            padding: 10px;
            background-color: #252525;
            color: #f5f5f5;
            border: 2px solid #252525;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            height: 12%;
        }

            [id*="selectButton"]:hover {
                background-color: #B9B4C7;
                border-radius: 5px;
                color: #252525;
            }

        /* Style for the "Add to Cart" button */
        #addToCartButton {
            display: block;
            margin: 10px auto; /* Center the button */
            padding: 10px;
            text-align: center;
            background-color: #252525;
            color: #f5f5f5;
            border: 2px solid #252525;
            border-radius: 5px;
            cursor: pointer;
        }

            #addToCartButton:hover {
                background-color: #B9B4C7;
                border-radius: 5px;
                color: #252525;
            }

        footer {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 12px;
            color: #000000;
            text-align: center;
            margin-top: 15px 0px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const flowerTypes = ['rose', 'lavender', 'tulip', 'bluebell', 'carnation'];
            const accessories = ['No Accessories', 'Teddy Bear', 'Hello Kitty', 'Cinnamoroll', 'Kirby'];

            const flowerTypeList = document.getElementById('flowerTypeList');
            const accessoryList = document.getElementById('accessoryList');
            const productListItems = document.getElementById('productListItems');

            // Populate Flower Types
            flowerTypes.forEach(type => {
                const li = document.createElement('li');
                li.textContent = type;
                li.addEventListener('click', () => showProducts(type, 'flower_type'));
                flowerTypeList.appendChild(li);
            });

            // Populate Accessories
            accessories.forEach(accessory => {
                const li = document.createElement('li');
                li.textContent = accessory;
                li.addEventListener('click', () => showProducts(accessory, 'accessory'));
                accessoryList.appendChild(li);
            });

            // Function to show products based on category and type
            function showProducts(type, category) {
                // You'll need to fetch data from your MySQL database here
                // Use ASP.NET to query the database and retrieve the relevant products
                // For simplicity, let's assume you have a function getProductsFromDatabase(category, type)
                const products = getProductsFromDatabase(category, type);

                // Clear previous product list
                productListItems.innerHTML = '';

                // Populate product list
                products.forEach(product => {
                    const li = document.createElement('li');
                    li.textContent = `${product.flower_name} - $${product.flower_unit_price}`;
                    productListItems.appendChild(li);
                });
            }

            // Mock function for fetching products from the database
            function getProductsFromDatabase(category, type) {
                // You'll need to implement the actual database query here using ASP.NET
                // For now, let's return a dummy array of products
                return [
                    { flower_name: 'Rose A', flower_unit_price: 10.99 },
                    { flower_name: 'Rose B', flower_unit_price: 12.99 },
                    // Add more products based on your database structure
                ];
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
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

        <section>
            <div class="row">
                <h2>Flower Types</h2>
                <asp:Repeater ID="flowerTypeRepeater" runat="server">
                    <ItemTemplate>
                        <div class="product-item">
                            <img src='<%# Eval("Picture") %>' alt='<%# Eval("Name") %>' />
                            <p><%# Eval("Name") %></p>
                            <p>Price: RM<%# Eval("UnitPrice") %></p>
                            <asp:Button ID="selectButton" runat="server" Text="Select" CommandArgument='<%# Eval("Name") %>' OnClick="SelectProduct" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <br />
            <div class="row">
                <h2>Accessories</h2>
                <asp:Repeater ID="accessoryRepeater" runat="server">
                    <ItemTemplate>
                        <div class="product-item">
                            <img src='<%# Eval("Picture") %>' alt='<%# Eval("Name") %>' />
                            <p><%# Eval("Name") %></p>
                            <p>Price: RM<%# Eval("UnitPrice") %></p>
                            <asp:Button ID="selectButton" runat="server" Text="Select" CommandArgument='<%# Eval("Name") %>' OnClick="SelectProduct" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>

        <section>
            <h2>Custom Bouquet</h2>
            <asp:Repeater ID="selectedProductRepeater" runat="server">
                <ItemTemplate>
                    <li><%# Container.DataItem %></li>
                </ItemTemplate>
            </asp:Repeater>
        </section>

        <!-- Add to Cart button at the end of the page -->
        <asp:Button ID="addToCartButton" runat="server" Text="Add to Cart" OnClick="AddToCart" />
        <footer>
            <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
        </footer>
    </form>
</body>
</html>
