using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
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
    public partial class AddSubCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            display_category();
        }

        public void display_category()
        {

            string sql = "SELECT * FROM [category]";
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


        protected void Button1_click(object sender, EventArgs e)
        {
            string path = Server.MapPath("\\admin-master\\images\\");
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int lenght = postedFile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    FileUpload1.SaveAs(path + filename);
                    string sql = "INSERT INTO [sub_category] (name,image,cat_id,details) VALUES('" + TextBox1.Text + "','" + filename + "','" + DropDownList1.SelectedValue + "','"+TextBox2.Text+"')";
                    int response = Services.execute(sql, con);
                    if (response == 1)
                    {
                        Response.Redirect("SubCategory.aspx");
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