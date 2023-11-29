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
    public partial class manageStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=project3;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                display_course();
                con.Open();
                string sql = "SELECT student.stud_Id,student.firstname,student.lastname,course.courseName as course_id,student.classNo,student.division,student.phoneNo,student.email,student.img FROM student INNER JOIN course ON course.course_Id = student.course_id";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dispalytable.DataSource = dt;
                    dispalytable.DataBind();
                }
                con.Close();
            }
        }

        public void display_course()
        {
          
            string s = "SELECT *FROM course";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                cmbcourse.DataSource = dt;
                cmbcourse.DataTextField = "courseName";
                cmbcourse.DataValueField = "course_Id";
                //cmbcourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                cmbcourse.DataBind();
            }
        }

        protected void cmbcourse_SelectedIndexChanged(object sender, EventArgs e)
        {
          
                int id = Convert.ToInt32(cmbcourse.SelectedValue);
                con.Open();
                string sql = "SELECT student.stud_Id,student.firstname,student.lastname,course.courseName as course_id,student.classNo,student.division,student.phoneNo,student.email FROM student INNER JOIN course ON course.course_Id = student.course_id WHERE student.course_id="+id;
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dispalytable.DataSource = dt;
                        dispalytable.DataBind();

            }
            con.Close();
       
       }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Response.Redirect("addStudent.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
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

        protected void btndelete_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            item.FindControl("btndelete").Visible = true;
        }
    }
}