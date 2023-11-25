<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Florist.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'poppins', sans-serif;
            font-size: 18px;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
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

        .header {
            height: 80px;
            width: 70%;
            background-color: #F8E8EE;
            border-radius: 3px;
            margin: 30px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
        }

            .header .logo {
                font-size: 30px;
                font-weight: bold;
                color: black;
            }

        .cart {
            display: flex;
            background-color: #B9B4C7;
            justify-content: space-between;
            align-items: center;
            padding: 7px 10px;
            border-radius: 3px;
            width: 80px;
        }

        .fa-solid {
            color: black;
        }

        .cart p {
            height: 22px;
            width: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 22px;
            background-color: black;
            color: white;
        }

        .container {
            display: flex;
            width: 70%;
            margin-bottom: 30px;
        }

        #root {
            width: 60%;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
        }

        .sidebar {
            width: 40%;
            border-radius: 5px;
            background-color: #f0f0f0;
            margin-left: 20px;
            padding: 15px;
            text-align: center;
            opacity: 0.9;
        }

        .head {
            background-color: #B9B4C7;
            border-radius: 3px;
            height: 40px;
            padding: 10px;
            margin-bottom: 20px;
            color: black;
            display: flex;
            align-items: center;
            opacity: 0.9;
        }

        .foot {
            display: flex;
            justify-content: space-between;
            margin: 20px 0px;
            padding: 10px 0px;
            border-top: 1px solid #333;
        }

        .box {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            border: 3px solid #B9B4C7;
            border-radius: 5px;
            padding: 15px;
        }

        .img-box {
            width: 100%;
            height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .images {
            max-width: 90%;
            max-height: 90%;
            object-fit: cover;
            object-position: center;
        }

        .bottom {
            margin-top: 20px;
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            height: 110px;
        }

        h2 {
            font-size: 20px;
            color: red;
        }

        button {
            width: 100%;
            position: relative;
            border: 2px solid #252525;
            border-radius: 5px;
            background-color: #F8E8EE;
            padding: 7px 25px;
            cursor: pointer;
            color: black;
        }

            button:hover {
                margin: 20px auto 0px auto;
                padding: 10px 20px;
                border-radius: 3px;
                border: 2px solid #252525;
                background-color: #808080;
                color: #f5f5f5;
                opacity: 1;
            }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: white;
            border-bottom: 1px solid #aaa;
            border-radius: 3px;
            margin: 10px 10px;
        }

        .row-img {
            width: 50px;
            height: 50px;
            border-radius: 50px;
            border: 1px solid #B9B4C7;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .rowimg {
            max-width: 43px;
            max-height: 43px;
            border-radius: 50%;
        }

        .fa-trash:hover {
            cursor: pointer;
            color: #B9B4C7;
        }

        footer {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 12px;
            color: #000000;
            text-align: center;
            margin-top: 15px 0px;
        }
    </style>
    <script src="https://kit.fontawesome.com/92d70a2fd8.js" crossorigin="anonymous"></script>

    <script>
        const product = [
            {
                id: 0,
                image: 'images/bouquet1.png',
                title: 'Graduation Bouquet with Teddy Bear',
                options: 'Customizable options for bouquet 1',
                price: 80,
            },
            {
                id: 1,
                image: 'images/bouquet2.png',
                title: 'Graduation Bouquet with Hello Kitty',
                options: 'Customizable options for bouquet 2',
                price: 101,
            },
            {
                id: 2,
                image: 'images/bouquet3.png',
                title: 'Graduation Bouquet with Teddy Bear Ver2',
                options: 'Customizable options for bouquet 3',
                price: 80,
            },
            {
                id: 3,
                image: 'images/bouquet4.png',
                title: 'Graduation Bouquet',
                options: 'Customizable options for bouquet 4',
                price: 60,
            }
        ];

        const categories = [...product];
        var cart = [];

        function addtocart(event, a) {
            event.preventDefault();
            cart.push({ ...categories[a] });
            displaycart();
        }

        function delElement(a) {
            cart.splice(a, 1);
            displaycart();
        }

        function purchase() {
            // Handle purchase logic here (e.g., show confirmation, clear cart, etc.)
            alert('Purchase successful!');
            cart = [];
            displaycart();
        }

        function displaycart() {
            let j = 0, total = 0;
            document.getElementById("count").innerHTML = cart.length;
            if (cart.length == 0) {
                document.getElementById('cartItem').innerHTML = "Your cart is empty";
                document.getElementById("total").innerHTML = "RM " + 0 + ".00";
            } else {
                document.getElementById('root').innerHTML = categories.map((item, i) => {
                    var { image, title, options, price } = item;
                    total += price;
                    return (
                        `<div class='box'>
                    <div class='img-box'>
                        <img class='images' src=${image}></img>
                    </div>
                    <div class='bottom'>
                        <p>${title}</p>
                        <p>${options}</p>
                        <h2>RM ${price.toFixed(2)}</h2>` +
                        `<button onclick='addtocart(event, ${i})'>Add to cart</button>` +
                        `</div>
                </div>`
                    );
                }).join('');

                document.getElementById("total").innerHTML = "RM " + total.toFixed(2);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Add this input for the hidden field -->
        <input type="hidden" id="hfCounter" runat="server" />
        <img class="logoName" src="Images/FlowerShopLogo.png" />
        <hr style="border: 3px solid #808080; border-radius: 5px;" />
        <nav>
            <a href="#">Home</a>
            <a href="#">About Us</a>
            <a href="#">Contact US</a>
            <a href="Product.aspx">Shop</a>
            <a href="#">Cart</a>
            <!-- Update the login button with an ID and a data attribute to store the default href
            once the user success login the label text will change to Profile-->
            <asp:HyperLink ID="Login" runat="server"></asp:HyperLink>
        </nav>
        <div class="header">
            <p class="logo">Shop</p>
            <div class="cart">
                <i class="fa-solid fa-cart-shopping"></i>
                <p id="count">0</p>
            </div>
        </div>
        <div class="container">
            <div id="root" runat="server"></div>
            <div class="sidebar">
                <div class="head">
                    <p>My Cart</p>
                </div>
                <div id="cartItem" runat="server">Your cart is empty</div>
                <div class="foot">
                    <h3>Total</h3>
                    <h2 id="total">$ 0.00</h2>
                </div>
            </div>
        </div>
    </form>
    <footer>
        <p>COPYRIGHT 2023, THE BOUQS COMPANY</p>
    </footer>
</body>
</html>
