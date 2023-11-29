using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Project4.admin
{
    public partial class admin_dashboard : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=project3;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            con.Open();
            string sql = "SELECT student.img,student.stud_Id,student.firstname,student.lastname,course.courseName as course_id,student.classNo,student.division,student.phoneNo,student.email FROM student INNER JOIN course ON course.course_Id = student.course_id WHERE  email='" + Session["username"] + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

           Image1.ImageUrl = dt.Rows[0]["img"].ToString();
            lblusername.Text = dt.Rows[0]["firstname"].ToString();
            con.Close();
        }
    }
}