using AARAATOURS.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;
using AARAATOURS.admin_master;
using System.Reflection;
using System.Diagnostics;
using System.Xml.Linq;

namespace AARAATOURS.USERMASTER
{
    public partial class Packages : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {



            string sub_cat_id = Request.QueryString["id"];

            string sql = "SELECT package.id, package.cat_id, package.sub_cat_id, category.name AS category_name, sub_category.name AS sub_category_name, package.name, package.image_1, package.image_2, package.image_3, package.details, package.price FROM package INNER JOIN category ON package.cat_id = category.id INNER JOIN sub_category ON package.sub_cat_id = sub_category.id WHERE package.sub_cat_id = " + sub_cat_id;
            DataTable dt = Services.select(sql, con);
            if (dt.Rows.Count > 0)
            {
                cardRepeater.DataSource = dt;
                cardRepeater.DataBind();
            }
        }
        protected void CardRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ShowModal")
            {
                string id = e.CommandArgument.ToString();

                string sql = "SELECT package.id, package.cat_id, package.sub_cat_id, category.name AS category_name, sub_category.name AS sub_category_name, package.name, package.image_1, package.image_2, package.image_3, package.details, package.price FROM package INNER JOIN category ON package.cat_id = category.id INNER JOIN sub_category ON package.sub_cat_id = sub_category.id WHERE package.id = " + id;
                DataTable dt = Services.select(sql, con);
                string image1 = dt.Rows[0]["image_1"].ToString();
                string image2 = dt.Rows[0]["image_2"].ToString();
                string image3 = dt.Rows[0]["image_3"].ToString();
                string name = dt.Rows[0]["name"].ToString();
                string details = dt.Rows[0]["details"].ToString();
                string category = dt.Rows[0]["category_name"].ToString();
                string subCategory = dt.Rows[0]["sub_category_name"].ToString();
                string price = dt.Rows[0]["price"].ToString();


                // Call the JavaScript function to update the modal content
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UpdateModalScript",
                    $"updateModal('{image1}', '{image2}', '{image3}','{details}','{name}', '{category}', '{subCategory}', '{price}');", true);

            }
            else
            {
                string id = e.CommandArgument.ToString();
                TextBox7.Text = id;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "BookingModalScript",
                $"bookingModal('{id}');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            // Check if the user is logged in
            if (Session["Username"] != null && Session["Admin"] == null)
            {
                int package_id = int.Parse(TextBox7.Text);

                string gender = RadioButtonList1.SelectedValue;

                string sql = "INSERT INTO [inquiry] (package_id,name,gender,mobile_number,email,no_of_days,child,adults,message) VALUES(" + package_id + ",'" + TextBox1.Text + "','" + gender + "','" + TextBox2.Text + "','" + TextBox3.Text + "'," + int.Parse(TextBox4.Text) + "," + int.Parse(TextBox5.Text) + "," + int.Parse(TextBox6.Text) + ",'" + TextBox8.Text + "')";
                int response = Services.execute(sql, con);
                if (response == 1)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Something gose wrong !')</script>");
                }
            }
            else
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
        }
    }
}