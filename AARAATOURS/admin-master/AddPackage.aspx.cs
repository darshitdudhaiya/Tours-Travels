using AARAATOURS.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;
using System.IO;


namespace AARAATOURS.admin_master
{
    public partial class AddPackage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                display_category();

                string sql = "SELECT * FROM sub_category WHERE cat_id = 1";
                DataTable dt = Services.select(sql, con);
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "id";
                    //cmbcourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                    DropDownList1.DataBind();
                }
            }
        }

        public void display_category()
        {

            string sql = "SELECT * FROM [category]";
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = "name";
                DropDownList2.DataValueField = "id";
                //cmbcourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                DropDownList2.DataBind();
            }
        }
        protected void cmbcourse_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(DropDownList2.SelectedValue);
            string sql = "SELECT * FROM sub_category WHERE cat_id = " + id;
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                //cmbcourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                DropDownList1.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("\\admin-master\\images\\");
            if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload4.HasFile)
            {
                string filename1 = Path.GetFileName(FileUpload1.FileName);
                string filename2 = Path.GetFileName(FileUpload2.FileName);
                string filename3 = Path.GetFileName(FileUpload4.FileName);
                string extension1 = Path.GetExtension(filename1);
                string extension2 = Path.GetExtension(filename2);
                string extension3 = Path.GetExtension(filename3);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int lenght = postedFile.ContentLength;

                if ((extension1.ToLower() == ".jpg" || extension1.ToLower() == ".png" || extension1.ToLower() == ".jpeg") && (extension2.ToLower() == ".jpg" || extension2.ToLower() == ".png" || extension2.ToLower() == ".jpeg") && (extension3.ToLower() == ".jpg" || extension3.ToLower() == ".png" || extension3.ToLower() == ".jpeg"))
                {
                    FileUpload1.SaveAs(path + filename1);
                    FileUpload1.SaveAs(path + filename2);
                    FileUpload1.SaveAs(path + filename3);
                    string sql = "INSERT INTO [package] (cat_id,sub_cat_id,name,price,image_1,image_2,image_3,details) VALUES('" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + filename1 + "','" + filename2+ "','" + filename3+ "','" + TextBox2.Text + "')";
                    int response = Services.execute(sql, con);
                    if (response == 1)
                    {
                        Response.Redirect("Package.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Something gose wrong !')</script>");
                    }
                }
            }
        }
    }
}