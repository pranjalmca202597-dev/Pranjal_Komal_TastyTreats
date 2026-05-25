<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Menu.aspx.cs"
Inherits="TastyTreats.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>Food Menu</title>

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
    font-size: 18px;
}

.grid td
{
    padding: 10px;
    text-align: center;
    font-size: 16px;
}

.grid tr:nth-child(even)
{
    background-color: #fff3e0;
}

.grid tr:hover
{
    background-color: #ffe0b2;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h2>Food Menu</h2>

<asp:GridView
ID="GridView1"
runat="server"
AutoGenerateColumns="False"
CssClass="grid"
OnRowCommand="GridView1_RowCommand">

<Columns>

<asp:BoundField
DataField="FoodID"
HeaderText="Food ID" />

<asp:BoundField
DataField="FoodName"
HeaderText="Food Name" />

<asp:BoundField
DataField="Price"
HeaderText="Price" />

<asp:BoundField
DataField="Category"
HeaderText="Category" />

<asp:ButtonField
ButtonType="Button"
Text="Add To Cart"
CommandName="AddCart" />

</Columns>

</asp:GridView>

</div>

</form>

</body>
</html>