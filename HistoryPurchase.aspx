<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoryPurchase.aspx.cs" Inherits="DCS2102_GroupAssignment2.HistoryPurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>History Purchase</title>
    <style type="text/css">
        #GridView1 {
            margin: 20px auto;
            width: 90%;
            border-collapse: collapse;
            text-align: center;
            font-family: Arial, sans-serif;
        }

            #GridView1 th, #GridView1 td {
                padding: 15px;
                border: 1px solid #ddd;
            }

            #GridView1 th {
                background-color: #B9B4C7;
            }

            #GridView1 tbody tr:hover {
                background-color: #f5f5f5;
            }

            #GridView1 caption {
                font-size: 1.5em;
                margin-bottom: 10px;
            }

        h1 {
            text-align: center;
            color: #333;
        }

        /* Adjustments for responsiveness on smaller screens */
        @media screen and (max-width: 600px) {
            #GridView1 {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">~ History Purchase Section ~</h1>
    <form id="Form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="PurchaseId" HeaderText="Order ID" />
                <asp:BoundField DataField="ItemName" HeaderText="Bosque/Flower Name" />
                <asp:BoundField DataField="PurchaseDate" HeaderText="Purchase Date" />
                <asp:BoundField DataField="PricePerUnit" HeaderText="Price per Unit [RM]" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price [RM]" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
