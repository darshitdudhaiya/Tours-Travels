using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AARAATOURS.Common;

namespace AARAATOURS.USERMASTER
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Admin"] != null)
            //{
            //    Response.Redirect("ADMINMASTER/Home.aspx");
            //}

            //if (Session["Username"] != null)
            //{
            //     Response.Redirect("/USERMASTER/Home.aspx");
            //}
            //else
            //{
            //}
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            con.Open();
            //string sql = "SELECT * FROM users WHERE username='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'";
            //SqlDataAdapter da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    Session["username"] = TextBox1.Text;
            //    Response.Redirect("Home.aspx");
            //}
            //else
            //{   
            //    Response.Write("<script>alert('Wrong Username & Password')</script>");
            //}
            //TextBox1.Text = "";
            //TextBox2.Text = "";

            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM [users] WHERE username='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'";
            DataTable dt = Services.select(sql, con);
            if(dt.Rows.Count > 0 )
            {
                Session["Username"] = TextBox1.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {   
                Response.Write("<script>alert('Wrong Username & Password')</script>");
            }
        }

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Response.Redirect("Registration.aspx");
        //    }
        //    catch
        //    {

        //    }
        //}

        //protected void LinkButton_changepass_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Response.Redirect("Changepass.aspx");
        //    }
        //    catch
        //    {

        //    }
        //}

        //protected void btn_login_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        con.Open();
        //        if (DropDownList_login.SelectedValue.ToString() == "User")
        //        {



        //            string str = "select * from UserTbl where email='" + txt_username.Text + "' and password='" + txt_password.Text + "'";
        //            da = new OleDbDataAdapter(str, con);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);

        //            if (dt.Rows.Count > 0)
        //            {
        //                //Session["Username"] = txt_username.Text;
        //                //Session["pass1" ]= txt_password.Text;
        //                Response.Redirect("MainBooking.aspx");
        //            }
        //            else
        //            {

        //            }

        //        }else if(DropDownList_login.SelectedValue.ToString() == "Admin")
        //        {
        //            string str1 = "select * from AdminTbl where username='" + txt_username.Text + "' and pass='" + txt_password.Text + "'";
        //            da = new OleDbDataAdapter(str1, con);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);

        //            if (dt.Rows.Count > 0)
        //            {
        //                //Session["Admin"] = "AARAA";
        //                Response.Redirect("MainBooking.aspx");
        //            }
        //            else
        //            {

        //            }
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Check Username Or Password')</script>");
        //        }
        //    }
        //    catch(Exception ex)
        //    {
        //        Response.Write(ex.ToString());
        //    }
        //    finally
        //    {

        //    }
        //}
    }
}