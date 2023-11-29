using System;
using System.Data;
using System.Data.SqlClient;

namespace project3.admin
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=project3;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "SELECT * FROM  student WHERE email='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text;
                Response.Redirect("dashboard.aspx");
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