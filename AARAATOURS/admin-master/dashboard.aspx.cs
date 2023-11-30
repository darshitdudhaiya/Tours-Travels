using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AARAATOURS.admin_master
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Clear();
            if (Session["Admin"] == null)
            {
                // Redirect to the login page if the "Admin" session variable is null.
                //Response.Redirect("Login.aspx");
            }
        }
    }
}