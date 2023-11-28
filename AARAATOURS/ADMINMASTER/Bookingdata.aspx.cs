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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K4LH2ES\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();


            if (!IsPostBack)
            {
                bind_booking();
            }
        }

        void bind_booking()
        {
            str = "select * from BookingTbl";
            da = new SqlDataAdapter(str, con);
            da.Fill(ds);

            BookingGv.DataSource = ds;
            BookingGv.DataBind();
        }

        protected void BookingGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_booking();
        }

        protected void BookingGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BookingGv.EditIndex = e.NewPageIndex;
            bind_booking();
        }
    }
}