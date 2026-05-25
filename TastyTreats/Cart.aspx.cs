using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TastyTreats
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        decimal total = 0;
        decimal gst = 0;
        decimal discount = 0;
        decimal finalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        void LoadCart()
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM Cart WHERE UserID=@uid", con);

            da.SelectCommand.Parameters.AddWithValue("@uid", userId);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();

            total = 0;

            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["TotalPrice"]);
            }

            gst = total * 0.18m;

            finalAmount = total + gst;

            lblTotal.Text = "Total Amount = ₹ " + total;

            lblGST.Text = "GST (18%) = ₹ " + gst;

            lblFinal.Text = "Final Amount = ₹ " + finalAmount;

            ViewState["Final"] = finalAmount;
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            decimal amount =
            Convert.ToDecimal(ViewState["Final"]);

            if (txtCoupon.Text == "SAVE10")
            {
                discount = amount * 0.10m;

                amount = amount - discount;

                lblDiscount.Text =
                "Discount Applied = ₹ " + discount;

                lblFinal.Text =
                "Final Amount After Discount = ₹ " + amount;
            }
            else
            {
                lblDiscount.Text = "Invalid Coupon";
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            decimal totalAmount = total;

            decimal gstAmount = gst;

            decimal final = Convert.ToDecimal(
            lblFinal.Text.Replace("Final Amount = ₹ ", "")
            .Replace("Final Amount After Discount = ₹ ", ""));

            decimal discountAmount = 0;

            if (lblDiscount.Text.Contains("Discount"))
            {
                string d = lblDiscount.Text
                .Replace("Discount Applied = ₹ ", "");

                discountAmount = Convert.ToDecimal(d);
            }

            con.Open();

            SqlCommand cmd = new SqlCommand(
            "INSERT INTO Orders VALUES(@uid,@date,@total,@gst,@discount,@final)", con);

            cmd.Parameters.AddWithValue("@uid", userId);

            cmd.Parameters.AddWithValue("@date", DateTime.Now);

            cmd.Parameters.AddWithValue("@total", totalAmount);

            cmd.Parameters.AddWithValue("@gst", gstAmount);

            cmd.Parameters.AddWithValue("@discount", discountAmount);

            cmd.Parameters.AddWithValue("@final", final);

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("Order Placed Successfully");
        }
    }
}