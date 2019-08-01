using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_ClientPost : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["roleid"].ToString() != "3")
            {
                Response.Redirect("~/Generic/Login.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/Generic/Login.aspx");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        Label lblId = (Label)GridView1.Rows[index].FindControl("Label1");
        Label lblUserId = (Label)GridView1.Rows[index].FindControl("Label2");
        Label lblPostDate = (Label)GridView1.Rows[index].FindControl("Label3");
        Label lblPostDescription = (Label)GridView1.Rows[index].FindControl("Label4");

        int postid = Convert.ToInt32(lblId.Text); Session["clientPostId"] = postid;
        var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
        string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy (hh:mm tt)");
        var specificationData = db.tblPosts.Where(d => d.Id == postid).ToList();

        int userId = Convert.ToInt32(lblUserId.Text); Session["clientId"] = userId;
        var userInfo = db.tblUserAccounts.Where(d => d.Id == userId).FirstOrDefault();

        if (e.CommandName == "Details")
        {
            Session["PostIdFromNotification"] = null;
            Session["ClientIdFromNotification"] = null;
            Response.Redirect("PostDetailAndOffer.aspx");
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}