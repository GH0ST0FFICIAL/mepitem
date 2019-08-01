using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_ViewConsultant : System.Web.UI.Page
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

        showData();
    }
    private void showData()
    {
        var data = db.tblUserAccounts.Where(d => d.CompanyTypeId == 1).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void lbtnGoBacktoDefault_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        showData();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Details")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblId = (Label)GridView1.Rows[index].FindControl("Label8");
            Label lblCompanyName = (Label)GridView1.Rows[index].FindControl("Label1");
            Label lblCompanyEmail = (Label)GridView1.Rows[index].FindControl("Label2");

            int companyid = Convert.ToInt32(lblId.Text);
            var companyinfo = db.tblUserAccounts.Where(d => d.Id == companyid).FirstOrDefault();
            var companydata = db.tblCompanyDetails.Where(d => d.UserId == companyid).ToList();

            lblConsultantName.Text = lblCompanyName.Text;
            lblEmail.Text = lblCompanyEmail.Text;
            lblPhone.Text = companyinfo.Phone;
            GridView2.DataSource = companydata;
            GridView2.DataBind();
            PanelData.Visible = false;
            PanelDetails.Visible = true;
        }
    }
    protected void lbtnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}