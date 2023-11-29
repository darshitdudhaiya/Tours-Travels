using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AARAATOURS.USERMASTER
{
    public partial class umaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                HyperLink1.Text = (string)Session["Username"];
            }
            else
            {
                HyperLink1.Text = "Sign In";
            }
        }
    }
}