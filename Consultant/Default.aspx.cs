using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultant_Default : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["roleid"].ToString() != "2")
            {
                Response.Redirect("~/Generic/Login.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/Generic/Login.aspx");
        }
        //number of vendors
        var consultants = db.tblUserAccounts.Where(d => d.CompanyTypeId == 1).ToList().Count();
        var vendors = db.tblUserAccounts.Where(d => d.CompanyTypeId == 2).ToList().Count();
        var consltantandvendors = db.tblUserAccounts.Where(d => d.CompanyTypeId == 3).ToList().Count();
        var clients = db.tblUserAccounts.Where(d => d.CompanyTypeId == 4).ToList().Count();
        h5Consultant.InnerText = consultants.ToString();
        h5Vendor.InnerText = vendors.ToString();
        h5ConsultantAndVendor.InnerText = consltantandvendors.ToString();
        h5Client.InnerText = clients.ToString();
    }
    protected string CutText(object text, int length)
    {
        if (DBNull.Value == text || text == null) return "";
        string txt = text.ToString();
        if (txt.Length <= length) return txt;
        return txt.Substring(0, length) + " ...";
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblPostId = (Label)e.Item.FindControl("lblPostId");
        Label lblClientId = (Label)e.Item.FindControl("lblClientId");
      
        if (e.CommandName == "ToPostDetails")
        {
            Session["clientPostId"] = null;
            Session["clientId"] = null;
            Session["PostIdFromNotification"] = lblPostId.Text;
            Session["ClientIdFromNotification"] = lblClientId.Text;
            Response.Redirect("PostDetailAndOffer.aspx");
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblFooter = (Label)e.Item.FindControl("lblEmptyData");
                lblFooter.Visible = true;
                lbtnViewAll.Visible = false;
            }
        }
    }

    protected void btnViewConsultant_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewConsultant.aspx");
    }

    protected void btnViewVendor_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewVendor.aspx");
    }
    protected void btnViewConsultantAndVendor_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewConsultantAndVendor.aspx");
    }
    protected void btnViewClient_Click(object sender, EventArgs e)
    {

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Repeater1.DataBind();
        h5Consultant.DataBind();
        h5Vendor.DataBind();
        h5ConsultantAndVendor.DataBind();
        h5Client.DataBind();
    }
}