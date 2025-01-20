using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TutorNest
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_username"] != null)
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }
    }
}