using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_ViewConsultantAndVendor : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["roleid"].ToString() != "4")
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
        var data = db.tblUserAccounts.Where(d => d.CompanyTypeId == 3).ToList();
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

            lblVendorName.Text = lblCompanyName.Text;
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
        PanelData.Visible = true;
        PanelDetails.Visible = false;
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MoreDetails")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblId = (Label)GridView2.Rows[index].FindControl("Label8");
            Label lblSystemTitle = (Label)GridView2.Rows[index].FindControl("Label1");
            Label lblSubSystemTitle = (Label)GridView2.Rows[index].FindControl("Label2");
            Label lblItemTitle = (Label)GridView2.Rows[index].FindControl("Label3");
            Label lblSubItemTitle = (Label)GridView2.Rows[index].FindControl("Label4");
            Label lblBrandName = (Label)GridView2.Rows[index].FindControl("Label5");
            Label lblServiceMinCapacity = (Label)GridView2.Rows[index].FindControl("Label6");
            Label lblServiceMaxCapacity = (Label)GridView2.Rows[index].FindControl("Label7");

            int companyid = Convert.ToInt32(lblId.Text);
            var companyinfo = db.tblUserAccounts.Where(d => d.Id == companyid).FirstOrDefault();
            var companydata = db.tblCompanyDetails.Where(d => d.Id == companyid).ToList();

            lblSystem.Text = lblSystemTitle.Text;
            lblSubSystem.Text = lblSubSystemTitle.Text;
            lblItem.Text = lblItemTitle.Text;
            lblSubItem.Text = lblSubItemTitle.Text;
            lblBrand.Text = lblBrandName.Text;
            lblMinCapacity.Text = lblServiceMinCapacity.Text;
            lblMaxCapacity.Text = lblServiceMaxCapacity.Text;
            GridView3.DataSource = companydata;
            GridView3.DataBind();
            PanelDetails.Visible = false;
            PanelServiceDetails.Visible = true;
        }
    }
    protected void lbtnGoBackToDetails_Click(object sender, EventArgs e)
    {
        PanelDetails.Visible = true;
        PanelServiceDetails.Visible = false;
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
        Response.End();
    }
}