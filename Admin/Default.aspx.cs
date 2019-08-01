using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["roleid"].ToString() != "1")
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
}