using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AARAATOURS.ADMINMASTER
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K4LH2ES\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "SELECT * FROM users WHERE username='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Wrong Username & Password')</script>");
            }
            TextBox1.Text = "";
            TextBox2.Text = "";

            con.Close();

        }
    }
}