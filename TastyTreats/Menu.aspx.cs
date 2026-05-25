using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TastyTreats
{
    public partial class Menu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFood();
            }
        }

        void LoadFood()
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM FoodItems", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender,
        GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddCart")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = GridView1.Rows[rowIndex];

                int foodId = Convert.ToInt32(row.Cells[0].Text);

                decimal price = Convert.ToDecimal(row.Cells[2].Text);

                int userId = Convert.ToInt32(Session["UserID"]);

                con.Open();

                SqlCommand cmd = new SqlCommand(
                "INSERT INTO Cart VALUES(@uid,@fid,@qty,@total)", con);

                cmd.Parameters.AddWithValue("@uid", userId);

                cmd.Parameters.AddWithValue("@fid", foodId);

                cmd.Parameters.AddWithValue("@qty", 1);

                cmd.Parameters.AddWithValue("@total", price);

                cmd.ExecuteNonQuery();

                con.Close();

                Response.Write("Item Added To Cart");
            }
        }
    }
}