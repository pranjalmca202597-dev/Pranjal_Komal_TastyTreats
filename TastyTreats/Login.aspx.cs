using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TastyTreats
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
            "SELECT * FROM Users WHERE Email=@e AND Password=@p", con);

            cmd.Parameters.AddWithValue("@e", txtEmail.Text);

            cmd.Parameters.AddWithValue("@p", txtPassword.Text);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["UserID"] = dr["UserID"].ToString();

                Response.Redirect("Menu.aspx");
            }
            else
            {
                Response.Write("Invalid Login");
            }

            con.Close();
        }
    }
}