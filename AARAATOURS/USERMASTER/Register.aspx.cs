using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;

namespace AARAATOURS.USERMASTER
{
    public partial class Register : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sqlForUsernmaeCheck = "SELECT * FROM [users] WHERE username = '" + TextBox1.Text + "'";
            DataTable dt = Services.select(sqlForUsernmaeCheck, con);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Username Was Already Taken !')</script>");

            }
            else
            {
                string sql = "INSERT INTO [users] (username,password,role,email) VALUES('" + TextBox1.Text + "','" + TextBox3.Text + "','client','" + TextBox2.Text + "')";
                int response = Services.execute(sql, con);
                if (response == 1)
                {
                    Session["Username"] = TextBox1.Text;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Something gose wrong !')</script>");
                }
            }

        }
    }
}