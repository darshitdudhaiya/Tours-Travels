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
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source =.; Initial Catalog = project3; Integrated Security = True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql = "SELECT student.img,student.stud_Id,student.firstname,student.lastname,course.courseName as course_id,student.classNo,student.division,student.phoneNo,student.email FROM student INNER JOIN course ON course.course_Id = student.course_id WHERE  email='" + Session["username"] + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Image1.ImageUrl = dt.Rows[0]["img"].ToString();
            lblfirstname.Text = dt.Rows[0]["firstname"].ToString();
            lbllastname.Text = dt.Rows[0]["lastname"].ToString();
            lblCourse.Text = dt.Rows[0]["course_id"].ToString();
            lblClass.Text = dt.Rows[0]["classNo"].ToString();
            lblDivision.Text = dt.Rows[0]["division"].ToString();
            lblMobile.Text = dt.Rows[0]["phoneNo"].ToString();
            lblEmail.Text = dt.Rows[0]["email"].ToString();
            con.Close();
        }
    }
}