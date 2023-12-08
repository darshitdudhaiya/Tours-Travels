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
    public partial class umaster : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null && Session["Admin"] == null)
            {
                HyperLink1.Text = (string)Session["Username"];
                HyperLink1.NavigateUrl = "#";
                Logoutbtn.Visible = true;

            }
            else
            {
                HyperLink1.Text = "Sign In";
                Logoutbtn.Visible= false;
            }

            string sql = "SELECT * FROM [category]";
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                menuRepeater.DataSource = dt;
                menuRepeater.DataBind();
            }


        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }
    }
}