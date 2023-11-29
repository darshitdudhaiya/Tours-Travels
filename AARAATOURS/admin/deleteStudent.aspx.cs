using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project3.admin
{
    public partial class deleteStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=project3;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int id;
                con.Open();
                string sql = "SELECT *FROM student";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
               
                id = Convert.ToInt32(dt.Rows[0]["stud_Id"]);

                    string strDelete = "DELETE FROM student WHERE stud_Id=" + id;
                    SqlCommand cmd = new SqlCommand(strDelete, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("manageStudent.aspx");
                    con.Close(); 
                
            }
        }
    }
}