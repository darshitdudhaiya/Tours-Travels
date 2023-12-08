using AARAATOURS.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;
using AARAATOURS.admin_master;
using System.Reflection;

namespace AARAATOURS.USERMASTER
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string cat_id = Request.QueryString["id"];

            string sql = "SELECT sub_category.id, sub_category.cat_id, category.name AS category_name, sub_category.name, sub_category.image, sub_category.details FROM sub_category INNER JOIN category ON sub_category.cat_id = category.id WHERE sub_category.cat_id =" + cat_id;
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                cardRepeater.DataSource = dt;
                cardRepeater.DataBind();
            }
        }
    }
}