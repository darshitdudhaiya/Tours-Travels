using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AARAATOURS.Common;

namespace AARAATOURS.admin_master
{
    public partial class UpdateCategory : System.Web.UI.Page
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

                    DataTable dt = GetDataFromDatabase(recordId); // Assuming a method to get data from DB

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        // Assuming you have a TextBox named txtDataField to display data
                        TextBox1.Text = dt.Rows[0]["name"].ToString(); // Adjust column name
                    }
                }
            }
        }
        protected DataTable GetDataFromDatabase(int recordId)
        {
            string query = "SELECT * FROM [category] WHERE id = " + recordId; // Adjust query and column name

            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["updateId"] != null)
            {
                int recordId = Convert.ToInt32(Request.QueryString["updateId"]);
                string sql = "UPDATE [category] SET name ='" + TextBox1.Text + "' WHERE id =" + recordId;
                int response = Services.execute(sql, con);
                if (response == 1)
                {
                    Response.Redirect("Category.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Something gose wrong !')</script>");
                }
            }
        }
    }
}