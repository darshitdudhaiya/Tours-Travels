using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace project3.admin
{
    public partial class addStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source =.; Initial Catalog = project3; Integrated Security = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                display_course();
                //display_role();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string name;
            con.Open();
            string path = Server.MapPath("\\admin\\img\\");
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int lenght = postedFile.ContentLength;

                if(extension.ToLower()==".jpg"|| extension.ToLower() == ".png"|| extension.ToLower() == ".jpeg")
                {
                    FileUpload1.SaveAs(path + filename);
                    name = "img/" + filename;

                    string sql = "INSERT INTO student VALUES('" + txtfirstname.Text + "','" + txtlastname.Text + "','" + cmbcourse.SelectedValue + "','" + txtclassno.Text + "','" + txtdivision.Text + "','" + txtphoneno.Text + "','" + txtemail.Text + "','" + txtpassword.Text + "','"+name+"','"+1+"')";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Added')</script>");
                    txtfirstname.Text = "";
                    txtlastname.Text = "";
                    txtclassno.Text = "";
                    txtdivision.Text = "";
                    txtemail.Text = "";
                    txtphoneno.Text = "";
                    txtpassword.Text = "";
                    con.Close();
                }
                else
                {
                    Response.Write("Image is not Suported File");
                }

            }
            else
            {
                Response.Write("Please Select Image");

            }
        }

        public void display_course()
        {
            con.Open();
            string s = "SELECT *FROM course";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                cmbcourse.DataSource = dt;
                cmbcourse.DataTextField = "courseName";
                cmbcourse.DataValueField = "course_Id";
                cmbcourse.Items.Insert(0,new ListItem("--Select Course--", "0"));
                cmbcourse.DataBind();
            }
            
            con.Close();
        }

        //public void display_role()
        //{
        //    con.Open();
        //    string s = "SELECT *FROM role";
        //    SqlDataAdapter da = new SqlDataAdapter(s, con);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    if (dt.Rows.Count > 0)
        //    {   
        //        cmbrole.DataSource = dt;
        //        cmbrole.DataTextField = "role_name";
        //        cmbrole.DataValueField = "role_Id";
        //        cmbrole.Items.Insert(0, new ListItem("--Select Role--", "0"));
        //        cmbrole.DataBind();
        //    }   

        //    con.Close();
        //}

    }
}