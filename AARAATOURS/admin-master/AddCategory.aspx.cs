using AARAATOURS.Common;
using System;
using System.Collections.Generic;
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
    public partial class AddCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO [category] (name) VALUES('" + TextBox1.Text + "')";
            int response = Services.execute(sql, con);
            if (response == 1)
            {
                Response.Redirect("Category.aspx");
            }
            else
            {
                Response.Write("<script>alert('Something gose wrong !')</script>");
            }
        }
    }
}