<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Home.aspx.cs"
Inherits="TastyTreats.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>TastyTreats Home</title>

<style>

body
{
    font-family: Arial;
    background-color: #fff3e0;
    text-align: center;
}

.container
{
    margin-top: 100px;
}

h1
{
    color: darkred;
    font-size: 40px;
}

p
{
    font-size: 20px;
}

.btn
{
    padding: 12px 25px;
    margin: 10px;
    background-color: darkorange;
    color: white;
    border: none;
    font-size: 18px;
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

<h1>Welcome To TastyTreats</h1>

<p>Online Food Ordering System</p>

<br />

<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
CssClass="btn"
PostBackUrl="~/Login.aspx" />

<asp:Button
ID="btnRegister"
runat="server"
Text="Register"
CssClass="btn"
PostBackUrl="~/Register.aspx" />

<asp:Button
ID="btnMenu"
runat="server"
Text="View Menu"
CssClass="btn"
PostBackUrl="~/Menu.aspx" />

</div>

</form>

</body>
</html>