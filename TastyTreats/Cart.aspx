<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Cart.aspx.cs"
Inherits="TastyTreats.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>My Cart</title>

<style>

body
{
    font-family: Arial;
    background-color: #fff3e0;
}

.container
{
    width: 90%;
    margin: 40px auto;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}

h2
{
    text-align: center;
    color: darkred;
}

.grid
{
    width: 100%;
}

.grid th
{
    background-color: darkorange;
    color: white;
    padding: 12px;
}

.grid td
{
    padding: 10px;
    text-align: center;
}

.grid tr:nth-child(even)
{
    background-color: #fff3e0;
}

.grid tr:hover
{
    background-color: #ffe0b2;
}

.bill
{
    margin-top: 30px;
    font-size: 20px;
}

.txt
{
    padding: 10px;
    width: 250px;
    font-size: 16px;
}

.btn
{
    padding: 10px 20px;
    background-color: darkorange;
    color: white;
    border: none;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover
{
    background-color: orangered;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h2>My Cart</h2>

<asp:GridView
ID="GridView1"
runat="server"
AutoGenerateColumns="true"
CssClass="grid">
</asp:GridView>

<div class="bill">

<br />

<asp:Label
ID="lblTotal"
runat="server"
Font-Bold="true">
</asp:Label>

<br /><br />

<asp:Label
ID="lblGST"
runat="server">
</asp:Label>

<br /><br />

<asp:TextBox
ID="txtCoupon"
runat="server"
CssClass="txt"
Placeholder="Enter Coupon Code">
</asp:TextBox>

<asp:Button
ID="btnApply"
runat="server"
Text="Apply Coupon"
CssClass="btn"
OnClick="btnApply_Click" />

<br /><br />

<asp:Label
ID="lblDiscount"
runat="server">
</asp:Label>

<br /><br />

<asp:Label
ID="lblFinal"
runat="server"
Font-Bold="true"
Font-Size="X-Large">
</asp:Label>

<br /><br />

<asp:Button
ID="btnCheckout"
runat="server"
Text="Place Order"
CssClass="btn"
OnClick="btnCheckout_Click" />

</div>

</div>

</form>

</body>
</html>