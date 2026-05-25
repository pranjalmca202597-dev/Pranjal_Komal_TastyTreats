using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TastyTreats
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
            "INSERT INTO Users VALUES(@name,@email,@pass,'User')", con);

            cmd.Parameters.AddWithValue("@name", txtName.Text);

            cmd.Parameters.AddWithValue("@email", txtEmail.Text);

            cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("Registration Successful");
        }
    }
}