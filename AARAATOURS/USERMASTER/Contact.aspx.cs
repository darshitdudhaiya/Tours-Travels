using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using AARAATOURS.Common;

namespace AARAATOURS.USERMASTER
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_contact_submit_Click(object sender, EventArgs e)
        {
            try
            {
                 string sql = "insert into [contact] (name,mobile_number,email,message) values ('"+txt_name.Text+ "','"+txt_mobile.Text+"','" + txt_email.Text+"','"+txt_msg.Text+"')";
                int response = Services.execute(sql, con);
                if (response == 1)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Something goes Wrong in deleting !')</script>");
                }
            }
            catch(Exception ex1)
            {
                Response.Write("<script>alert('Fill All Details')</script>");
                Response.Write(ex1.ToString());
            }
            finally
            {

            }
        }
    }
}