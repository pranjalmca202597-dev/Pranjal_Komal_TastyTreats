<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Register.aspx.cs"
Inherits="TastyTreats.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>Register</title>

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

<h2>User Registration</h2>

<asp:TextBox
ID="txtName"
runat="server"
CssClass="txt"
Placeholder="Enter Full Name">
</asp:TextBox>

<br />

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
ID="btnRegister"
runat="server"
Text="Register"
CssClass="btn"
OnClick="btnRegister_Click" />

</div>

</form>

</body>
</html>