<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopPage.aspx.cs" Inherits="Florist.ShopPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shop Page</title>
    <link rel="stylesheet" href="RecipeMain.css" />
    <link href="https://fonts.googleapis.com/css?family=Bebas Neue" rel="stylesheet" />

    <style>
        body {
            height: 100vh;
            background-color: #F8E8EE;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }




        /*fonts*/

        p.tagline {
            color: white;
            float: right;
            margin-top: 0;
            font-family: 'Baskerville Old Face';
            font-size: 16px;
        }

        p.recipe {
            font-size: 30px;
            margin-top: 40px;
            font-family: 'Bebas Neue';
            margin-left: 25px;
        }

        p.cuisine {
            font-size: 28px;
            margin-bottom: 0px;
            font-family: 'Bebas Neue';
            margin-left: 25px;
            width: 30px;
        }

        p.meal {
            font-size: 28px;
            font-family: 'Bebas Neue';
            margin-top: 1px;
            margin-left: 25px;
            margin-bottom: 2px;
            width: 30px;
            height: 40px;
        }


        p.dessert {
            font-size: 28px;
            margin-top: 0px;
            margin-bottom: 10px;
            font-family: 'Bebas Neue';
            margin-left: 25px;
            width: 30px;
            height: 40px;
        }

        p.occasion {
            font-size: 30px;
            margin-top: 10px;
            font-family: 'Bebas Neue';
            margin-left: 25px;
            width: 30px;
            height: 40px;
        }


        h1 {
            font-size: 28px;
            font-family: 'Baskerville Old Face';
            float: left;
            margin-top: -15px;
            color: white;
        }

        p {
            text-align: center;
            font-family: 'Lucida Bright';
            font-size: 16px;
            font-weight: bold;
        }

            p.type {
                font-family: 'Bebas Neue';
                font-size: 35px;
                text-align: center;
                margin: 0px 110px 30px 0px;
                float: left;
                font-weight: normal;
            }





        /*buttons*/

        button {
            background-color: lavender;
            margin-left: -6px;
            border-color: dimgrey;
            width: 33px;
            height: 32px;
        }

            button:hover {
                background-color: #B9B4C7;
            }

        /*input*/

        input {
            height: 28px;
            background-color: #F0EFFA;
            margin-left: 15px;
            margin-top: 4px;
            margin-right: 0;
        }



        .cui, .meal, .des {
            float: left;
            width: 25%;
        }

        .occ {
            float: right;
            width: 25%;
        }



        /*top right navigation div*/

        .home, .recipe, .sup {
            float: left;
            width: 25%;
        }

        .login {
            float: right;
            width: 25%;
        }


        /*scroll*/
        div.scroll {
            overflow-x: scroll;
            width: 60%;
        }



        div.container {
            display: inline-flex;
            width: 100%;
        }


        div.section {
            margin-left: 5%;
            overflow-x: hidden;
            margin-bottom: 55px;
        }



        div.header {
            padding: 50px;
            background-color: black;
            margin: -10px -8px 10px -8px;
        }



        div.nav_container {
            overflow: hidden;
            font-size: 18px;
            font-weight: bold;
            font-family: Arial Rounded MT;
            margin: 25px 0px 20px 0px;
            padding: 15px;
            text-align: center;
            white-space: nowrap;
        }


            div.nav_container a {
                color: black;
                margin: 15px 0px 15px 10px;
                padding: 15px;
                text-decoration: none;
                text-align: center;
            }

                div.nav_container a:hover {
                    background-color: #B9B4C7;
                    border-radius: 4px;
                    color: #252525;
                }


        div.rec {
            background-color: #B9B4C7;
            width: 200px;
            height: 255px;
            border-radius: 4px;
            margin-right: 20px;
            border: 2px solid #F5F5F5;
            margin-bottom: 10px;
        }

            div.rec:hover {
                border: 2px solid #F5F5F5;
                box-shadow: 2px 2px 2px grey;
            }

            div.rec a {
                color: black;
            }

        /*left side navigation*/
        div.sidebar {
            background-color: #B9B4C7;
            float: left;
            height: 560px;
            margin-top: 20px;
            margin-left: 6px;
            border-radius: 4px;
        }

        /*right side contents*/
        div.contents {
            float: right;
            width: 80%;
            margin-left: 30px;
        }


        div.container {
            //display: inline-flex;
            width: 100%;
        }




        /*img*/
        img {
            width: 170px;
            height: 170px;
            margin: 15px;
            margin-bottom: -5px;
            border-radius: 4px;
        }

            img.drpdwn {
                width: 45px;
                height: 45px;
                margin-left: 5px;
                margin-top: 10px;
            }



            img.logo {
                width: 70px;
                height: 70px;
                float: left;
                margin-top: -19px;
                margin-right: 1px;
            }


            img.caticon {
                width: 50px;
                height: auto;
                margin-top: 5px;
                margin-left: -50px;
            }




        /*scroll*/

        .scrollable-content {
            overflow-y: auto;
            overflow-x: hidden;
            max-height: 380px;
            margin-top: 10px;
            width: 87%;
        }

        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }

        ::-webkit-scrollbar-track {
            background: #E4E2F7;
            border-radius: 8px;
        }

        ::-webkit-scrollbar-thumb {
            background: #9180BB;
            border-radius: 4px;
        }


        a {
            text-decoration: none;
        }

        div.sidebar a {
            color: black;
        }


            div.sidebar a:hover {
                color: #5C3FA2;
            }


        #korean, #japanese, #chinese {
        }



        .dropdownbtn {
            background-color: #F5F5F5;
            height: 50px;
            width: 170px;
            font-family: 'Bebas Neue';
            font-size: 50px;
            margin-bottom: 25px;
            text-align: left;
            font-weight: bold;
            border: none;
            display: flex;
        }

        .drpdwn-content {
            display: none;
            position: absolute;
            background-color: #E8E8E8;
            min-width: 115px;
            box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.2);
            margin-left: -10px;
            margin-top: 1px;
            border: 2px solid black;
            font-size: 18px;
        }



            .drpdwn-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                font-family: 'Bebas Neue';
            }

        .dropdown:hover .dropdownbtn {
            background-color: #F5F5F5;
        }

        .drpdwn-content a:hover {
            background-color: #B9B4C7;
        }

        div.arrow:hover .drpdwn-content {
            display: block;
        }

        div.arrow {
            width: 50px;
            height: 50px;
        }



        div.dropdown {
            margin-top: 10px;
            margin-left: 80px;
            display: inline-flex;
        }

        .auto-style1 {
            width: 105px;
        }
    </style>
    <script>
        function updateFlowerData(flowersJson) {
            var flowers = JSON.parse(flowersJson);

            // Update the HTML elements with the flower data
            // For example, you can use jQuery to update the content of the flower containers
            // Note: Make sure to adjust the selector and HTML structure based on your actual design
            $.each(flowers, function (index, flower) {
                var flowerContainer = $(`#containerFlower #${flower.FlowerId}`);
                flowerContainer.find('img').attr('src', flower.FlowerPicture);
                flowerContainer.find('p').text(flower.FlowerName);
                // Add similar code to update other properties as needed
            });

            // Attach click event to flower checkboxes
            $(".flower-checkbox").change(function () {
                // Get the selected flower ID
                var flowerId = $(this).attr("id").split("_")[1];

                // You can send the selected flowerId to the server using AJAX
                // Example: ajaxFunctionToSendSelection(flowerId);
            });
        }

        // Add a similar function for accessories checkboxes
        function updateAccessoriesData(accessoriesJson) {
            var accessories = JSON.parse(accessoriesJson);

            // Update the HTML elements with the accessory data
            // Add code to update the content of the accessory containers

            // Attach click event to accessory checkboxes
            $(".accessory-checkbox").change(function () {
                // Get the selected accessory ID
                var accessoryId = $(this).attr("id").split("_")[1];

                // You can send the selected accessoryId to the server using AJAX
                // Example: ajaxFunctionToSendSelection(accessoryId);
            });

            $(document).ready(function () {
                // Moved the addToCart function outside the updateAccessoriesData function
                function addToCart() {
                    // Get selected flower options
                    var selectedFlowers = $(".flower-checkbox:checked").map(function () {
                        return this.id.split("_")[1];
                    }).get();

                    // Get selected accessory options
                    var selectedAccessories = $(".accessory-checkbox:checked").map(function () {
                        return this.id.split("_")[1];
                    }).get();

                    // Check if at least one flower or one accessory is selected
                    if (selectedFlowers.length > 0 && selectedAccessories.length > 0) {
                        // You can send the selected options to the server using AJAX for further processing
                        // Example: ajaxFunctionToAddToCart(selectedFlowers, selectedAccessories);

                        // Display a confirmation message (you can customize this part)
                        alert("Added to Cart! Continue shopping or go to the cart.");
                    } else {
                        // Display an error message if no options are selected
                        alert("Please select at least one flower or one accessory.");
                    }
                }

                // Bind click event to Add to Cart button
                $("#addToCartBtn").on("click", function () {
                    addToCart();
                });
            });


        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--dropdown menu-->
        <div class="dropdown">
            <button class="dropdownbtn">Customize</button>

        </div>
        <!--right contents(scrollable)-->

        <div class="scrollable-content" style="width: 1150px; margin-top: 110px; padding-right: 89px;">

            <!--Next option-->
            <p class="type" id="flower" style="text-align: center; margin-left: 45%;">
                Flower
                <br />
                *Max 3 option
            </p>

            <div class="section" style="width: 97%">
                <div class="scroll" style="width: 100%">
                    <div class="container" id="containerFlower" runat="server" style="width: auto;">



                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_1" />
                            <img src="images/rose.png" />
                            <p>Rose</p>
                        </div>

                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_2" />
                            <img src="images/lavender.png" />
                            <p>Lanvender</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_3" />
                            <img src="images/tulip.png" />
                            <p>Tulip</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_4" />
                            <img src="images/bluebell.png" />
                            <p>Bluebell</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_5" />
                            <img src="images/carnation.png" />
                            <p>Carnation</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="flower-checkbox" id="flower_6" />
                            <img src="images/iris.png" />
                            <p>Iris</p>
                        </div>
                    </div>
                </div>
            </div>


            <!--Next option-->
            <p class="type" id="accessories" style="text-align: center; margin-left: 45%;">
                Accessories
                <br />
                *Choose 1 option
            </p>

            <div class="section" style="width: 97%">
                <div class="scroll" style="width: 100%">
                    <div class="container" id="containerAccessories" runat="server" style="width: auto;">


                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="accessory-checkbox" id="accessory_1" />
                            <img src="images/skip.png" />
                            <p>No Accessories</p>
                        </div>

                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="accessory-checkbox" id="accessory_2" />
                            <img src="images/teddyBear.jpg" />
                            <p>Teddy Bear</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="accessory-checkbox" id="accessory_3" />
                            <img src="images/helloKitty.jpg" />
                            <p>Hello Kitty</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="accessory-checkbox" id="accessory_4" />
                            <img src="images/cinnamoroll.png" />
                            <p>Cinnamoroll</p>
                        </div>
                        <div class="rec" style="height: 270px">
                            <input type="checkbox" class="accessory-checkbox" id="accessory_5" />
                            <img src="images/kirby.jpeg" />
                            <p>Kirby</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Add to Cart button -->
        <asp:Button ID="addToCartBtn" runat="server" Text="Add to Cart" OnClick="addToCart_Click" CssClass="auto-style1" />
    </form>
</body>
</html>
