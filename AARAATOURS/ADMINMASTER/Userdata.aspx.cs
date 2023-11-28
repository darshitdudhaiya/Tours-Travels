using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Data.SqlClient;

namespace AARAATOURS.ADMINMASTER
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K4LH2ES\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        string str;

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();


            if(!IsPostBack)
            {
                bind_userdata();
            }
        }

        void bind_userdata()
        {
            try
            {
                str = "select * from category";
                da = new SqlDataAdapter(str, con);
                da.Fill(ds);

                UserGV.DataSource = ds;
                UserGV.DataBind();
            }
            catch
            {

            }
        }

        protected void UserGV_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void UserGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UserGV.EditIndex = e.NewPageIndex;
            bind_userdata();
        }

        protected void UserGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_userdata();
        }
    }
}