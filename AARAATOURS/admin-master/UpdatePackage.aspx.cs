using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AARAATOURS.Common;
using System.IO;

namespace AARAATOURS.admin_master
{
    public partial class UpdatePackage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        public class CustomHttpPostedFile : HttpPostedFileBase
        {
            private readonly string fileName;
            private readonly Stream inputStream;
            private readonly int contentLength;

            public CustomHttpPostedFile(string fileName, Stream inputStream, int contentLength)
            {
                this.fileName = fileName;
                this.inputStream = inputStream;
                this.contentLength = contentLength;
            }

            public override string FileName => fileName;

            public override Stream InputStream => inputStream;

            public override int ContentLength => contentLength;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the ItemId from the query string
                if (Request.QueryString["updateId"] != null)
                {
                    int recordId = Convert.ToInt32(Request.QueryString["updateId"]);

                    DataTable dt = GetDataFromDatabase(recordId); // Assuming a method to get data from DB

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        TextBox1.Text = row["name"].ToString();
                        TextBox2.Text = row["details"].ToString();
                        TextBox3.Text = row["price"].ToString();

                    }
                    string sql = "SELECT * FROM sub_category WHERE cat_id = " + dt.Rows[0]["cat_id"];
                    int sub_cat_id = (int)dt.Rows[0]["sub_cat_id"];
                    DataTable dta = Services.select(sql, con);
                    if (dta.Rows.Count > 0)
                    {
                        DropDownList1.DataSource = dta;
                        DropDownList1.DataTextField = "name";
                        DropDownList1.DataValueField = "id";
                        //cmbcourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                        DropDownList1.DataBind();
                        ListItem defaultItem = DropDownList1.Items.FindByValue(sub_cat_id.ToString());
                        if (defaultItem != null)
                        {
                            defaultItem.Selected = true;
                        }
                    }

                    string defaultFilePath = Server.MapPath("\\admin-master\\images\\'" + dt.Rows[0]["image_1"] + "'");


                    if (System.IO.File.Exists(defaultFilePath))
                    {
                        
                        ProcessFile(new CustomHttpPostedFile(dt.Rows[0]["image_1"].ToString(), new System.IO.FileStream(defaultFilePath, System.IO.FileMode.Open), (int)new System.IO.FileInfo(defaultFilePath).Length));
                    }

                }
            }
            display_category();
        }

        private void ProcessFile(HttpPostedFileBase file)
        {
            // Your file processing logic here
            // For example, you can save the file using SaveAs method
            file.SaveAs(Server.MapPath("\\admin-master\\images\\"));
        }

        protected DataTable GetDataFromDatabase(int recordId)
        {
            string query = "SELECT * FROM [package] WHERE id = @pacId"; // Adjust query and column name

            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@pacId", recordId);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            return dt;
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
            if (Request.QueryString["updateId"] != null)
            {
                int recordId = Convert.ToInt32(Request.QueryString["updateId"]);
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
                        string sql = "UPDATE [package]  cat_id ='" + DropDownList2.SelectedValue + "',sub_cat_id ='" + DropDownList1.SelectedValue + "',name ='" + TextBox1.Text + "',price ='" + TextBox3.Text + "',image_1 ='" + filename1 + "',image_2 ='" + filename2 + "',image_3 ='" + filename3 + "',details ='" + TextBox2.Text + "' WHERE id =" + recordId;
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
                else
                {
                    string sql = "UPDATE [package] SET cat_id ='" + DropDownList2.SelectedValue + "',sub_cat_id ='" + DropDownList1.SelectedValue + "',name ='" + TextBox1.Text + "',price ='" + TextBox3.Text + "',details ='" + TextBox2.Text + "' WHERE id =" + recordId;
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