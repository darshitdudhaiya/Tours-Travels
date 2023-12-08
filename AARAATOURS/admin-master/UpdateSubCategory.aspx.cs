using AARAATOURS.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AARAATOURS.admin_master
{

    public partial class UpdateSubCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the ItemId from the query string
                if (Request.QueryString["updateId"] != null)
                {
                    int recordId = Convert.ToInt32(Request.QueryString["updateId"]);
                    Console.WriteLine(recordId);
                    DataTable dt = GetDataFromDatabase(recordId); // Assuming a method to get data from DB

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        TextBox1.Text = row["name"].ToString();
                        TextBox2.Text = row["details"].ToString();
                    }
                }

                // Bind the category dropdown list data
                display_category();

                // Set the selected value for the category dropdown list
                if (Request.QueryString["updateId"] != null)
                {
                    int recordId = Convert.ToInt32(Request.QueryString["updateId"]);
                    DataTable dt = GetDataFromDatabase(recordId); // Assuming a method to get data from DB

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        if (DropDownList1.Items.FindByValue(row["cat_id"].ToString()) != null)
                        {
                            DropDownList1.Items.FindByValue(row["cat_id"].ToString()).Selected = true;
                        }
                    }
                }
            }
        }
        protected DataTable GetDataFromDatabase(int recordId)
        {
            string query = "SELECT * FROM [sub_category] WHERE id = @subId"; // Adjust query and column name

            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@subId", recordId);
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
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
            }
        }
        protected void Button1_click(object sender, EventArgs e)
        {
            if (Request.QueryString["updateId"] != null)
            {
                int recordId = Convert.ToInt32(Request.QueryString["updateId"]);
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
                        string sql = "UPDATE [sub_category] SET name ='" + TextBox1.Text + "',image ='" + filename + "',cat_id ='" + DropDownList1.SelectedValue + "',details ='" + TextBox2.Text + "' WHERE id=" + recordId;
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
                else
                {
                    string sql = "UPDATE [sub_category] SET name ='" + TextBox1.Text + "',cat_id ='" + DropDownList1.SelectedValue + "',details ='" + TextBox2.Text + "' WHERE id=" + recordId;
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