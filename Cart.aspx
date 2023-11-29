<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Bouqs.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bouqs - Cart Page</title>
    <style>
        body {
            font-family: 'Arial Rounded MT';
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
                background-color: #f5f5f5;
            }


        form {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        .gridview {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

            .gridview th,
            .gridview td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

        .cart-empty-message {
            color: #999;
            margin-top: 20px;
        }

        #orderButton {
            display: block;
            margin: 10px auto; /* Center the button */
            padding: 10px;
            text-align: center;
            background-color: #252525;
            color: #f5f5f5;
            border: 2px solid #252525;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            height: 15%;
        }

            #orderButton:hover {
                background-color: #B9B4C7;
                border-radius: 5px;
                color: #252525;
            }

        /* Additional styles for the form */
        .order-form {
            margin-top: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        footer {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 12px;
            color: #000000;
            text-align: center;
            margin-top: 15px 0px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function orderButtonClick() {
            // Retrieve form values
            var userName = document.getElementById("userName").value;
            var telNo = document.getElementById("telNo").value;
            var userEmail = document.getElementById("userEmail").value;
            var shippingAddress = document.getElementById("shippingAddress").value;

            // Retrieve selected payment method
            var paymentMethod;
            var paymentMethodRadios = document.getElementsByName("paymentMethod");
            for (var i = 0; i < paymentMethodRadios.length; i++) {
                if (paymentMethodRadios[i].checked) {
                    paymentMethod = paymentMethodRadios[i].value;
                    break;
                }
            }

            // Check if a payment method is selected
            if (!paymentMethod) {
                alert("Please select a payment method.");
                return;
            }

            // AJAX request to save data to the database
            $.ajax({
                type: "POST",
                url: "Cart.aspx/SaveOrderDetails",
                data: JSON.stringify({
                    userName: userName,
                    telNo: telNo,
                    userEmail: userEmail,
                    shippingAddress: shippingAddress,
                    paymentMethod: paymentMethod
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Order successful!");
                },
                error: function (response) {
                    alert("Error saving order details. Please try again.");
                }
            });
        }
    </script>
</head>
<body>
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
    <form id="form1" runat="server">
        <div>
            <h2>Your Shopping Cart</h2>
            <asp:GridView ID="cartGridView" runat="server" AutoGenerateColumns="False" EmptyDataText="No items in the cart." CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                </Columns>
            </asp:GridView>

            <!-- Add a placeholder or label for an empty cart message -->
            <asp:Label ID="cartEmptyMessage" runat="server" Visible="false" CssClass="cart-empty-message" Text="Your cart is empty." />

            <br />
            <br />
            <!-- Order Form -->
            <div class="order-form">
                <h3>Order Information</h3>
                <label for="userName" class="form-label">User Name:</label>
                <input type="text" id="userName" class="form-input" />

                <label for="telNo" class="form-label">Telephone Number:</label>
                <input type="text" id="telNo" class="form-input" />

                <label for="userEmail" class="form-label">User Email:</label>
                <input type="text" id="userEmail" class="form-input" />

                <label for="shippingAddress" class="form-label">Shipping Address:</label>
                <input type="text" id="shippingAddress" class="form-input" />

                <label class="form-label">Payment Method:</label>
                <div class="payment-method">
                    <input type="radio" id="touchNGo" name="paymentMethod" value="Touch N Go" />
                    <label for="touchNGo">Touch N Go</label>

                    <input type="radio" id="onlineBanking" name="paymentMethod" value="Online Banking" />
                    <label for="onlineBanking">Online Banking</label>

                    <input type="radio" id="cashOnDelivery" name="paymentMethod" value="Cash on Delivery" />
                    <label for="cashOnDelivery">Cash on Delivery</label>
                </div>

                <button id="orderButton" type="button" onclick="orderButtonClick()">Order Now</button>
            </div>
        </div>
    </form>
    <br />
    <br />
    <footer>
        <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
    </footer>
</body>
</html>
