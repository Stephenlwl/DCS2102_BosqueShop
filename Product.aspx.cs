using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Florist
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize 'i' to 0 when the page is first loaded
                int i = 0;
                hfCounter.Value = i.ToString(); // Store 'i' in a hidden field

                var product = new List<dynamic>
                {
                    new { id = 0, image = "images/bouquet1.png", title = "Graduation Bouquet with Teddy Bear", price = 80 },
                    new { id = 1, image = "images/bouquet2.png", title = "Graduation Bouquet with Hello Kitty", price = 101 },
                    new { id = 2, image = "images/bouquet3.png", title = "Graduation Bouquet with Teddy Bear Ver2", price = 80 },
                    new { id = 3, image = "images/bouquet4.png", title = "Graduation Bouquet", price = 60 }
                };

                var categories = product.ToArray();

                root.InnerHtml = string.Join("", Array.ConvertAll(categories, item =>
                {
                    var image = item.image;
                    var title = item.title;
                    var price = item.price;

                    // Use the value from the hidden field and increment it
                    int currentI = int.Parse(hfCounter.Value);
                    hfCounter.Value = (currentI + 1).ToString();

                    return $@"<div class='box'>
                                <div class='img-box'>
                                    <img class='images' src='{image}'></img>
                                </div>
                                <div class='bottom'>
                                    <p>{title}</p>
                                    <h2>RM {price}.00</h2>
                                    <button onclick='addtocart({currentI})'>Add to cart</button>
                                </div>
                            </div>";
                }));
            }
        }
    }
}