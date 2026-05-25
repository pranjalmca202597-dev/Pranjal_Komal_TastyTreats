<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Login.aspx.cs"
Inherits="TastyTreats.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>Login</title>

<style>

body
{
    font-family: Arial;
    background-color: #fff3e0;
}

.container
{
    width: 400px;
    margin: 100px auto;
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
    text-align: center;
}

h2
{
    color: darkred;
}

.txt
{
    width: 90%;
    padding: 12px;
    margin-top: 10px;
    font-size: 16px;
}

.btn
{
    margin-top: 20px;
    padding: 12px 25px;
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

<h2>User Login</h2>

<asp:TextBox
ID="txtEmail"
runat="server"
CssClass="txt"
Placeholder="Enter Email">
</asp:TextBox>

<br />

<asp:TextBox
ID="txtPassword"
runat="server"
TextMode="Password"
CssClass="txt"
Placeholder="Enter Password">
</asp:TextBox>

<br />

<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
CssClass="btn"
OnClick="btnLogin_Click" />

</div>

</form>

</body>
</html>