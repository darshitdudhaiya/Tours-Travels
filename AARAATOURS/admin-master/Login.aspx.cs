using AARAATOURS.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;

namespace AARAATOURS.admin_master
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM [users] WHERE username='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'";
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                Session["Username"] = TextBox1.Text;
                Session["Admin"] = true;
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Wrong Username & Password')</script>");
            }

        }
    }
}