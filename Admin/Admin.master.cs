using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUserName.Text = "Admin";
        btnLogout.ServerClick += Logout_ServerClick;
    }
    private void Logout_ServerClick(object sender, EventArgs e)
    {
        Session.Clear();
        Session["roleid"] = null;
        Session["userid"] = null;
        Response.Redirect("~/Generic/Login.aspx");
    }
}
