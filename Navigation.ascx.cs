using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class Navigation : System.Web.UI.UserControl
    {

        public void btnLogout_Click(object sender, EventArgs e)
        {
            Session["loggedin"] = null;
            Session["UserName"] = null;
            Response.Redirect("default.aspx");
        }
    }
}