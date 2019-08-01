using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_PostDetailAndOffer : System.Web.UI.Page
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

        if (Session["clientPostId"] != null && Session["userid"] != null)
        {
            int postid = Convert.ToInt32(Session["clientPostId"].ToString());
            var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
            string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy (hh:mm tt)");
            var specificationData = db.tblPosts.Where(d => d.Id == postid).ToList();

            int userId = Convert.ToInt32(Session["userid"].ToString());
            var userInfo = db.tblUserAccounts.Where(d => d.Id == userId).FirstOrDefault();

            lblDate.Text = postdate;
            lblDescription.Text = postinfo.Description;
            lblStatus.Text = postinfo.Status;
            if (!Page.IsPostBack)
            {
                foreach (var taglist in db.tblTags.Where(d => d.PostId == postid))
                {
                    lblTags.Text += taglist.Tag.ToString() + ". ";
                }
            }
            lblEmail.Text = userInfo.Email;
            lblPhone.Text = userInfo.Phone;

            GridView2.DataSource = specificationData;
            GridView2.DataBind();

            GridView3.DataSourceID = "SqlDataSourceOffer";
            GridView3.DataBind();
        }
        else if (Session["PostIdFromNotification"] != null && Session["userid"] != null)
        {
            int userId = Convert.ToInt32(Session["userid"].ToString());
            var userInfo = db.tblUserAccounts.Where(d => d.Id == userId).FirstOrDefault();

            lblEmail.Text = userInfo.Email;
            lblPhone.Text = userInfo.Phone;

            //lbtnShowAllOffers.Visible = true;
            viewPostFromNotification();
            GridView3.DataSourceID = "SqlDataSourceOffer2";
            GridView3.DataBind();
        }
    }
    //protected void lbtnShowAllOffers_Click(object sender, EventArgs e)
    //{        
    //    GridView3.DataSourceID = "SqlDataSourceOffer3";
    //    GridView3.DataBind();
    //    lbtnShowAllOffers.Visible = false;
    //}
    private void viewPostFromNotification()
    {
        int postid = Convert.ToInt32(Session["PostIdFromNotification"].ToString());
        var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
        string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy (hh:mm tt)");
        var specificationData = db.tblPosts.Where(d => d.Id == postid).ToList();

        int userId = Convert.ToInt32(Session["ClientIdFromNotification"].ToString());
        var userInfo = db.tblUserAccounts.Where(d => d.Id == userId).FirstOrDefault();

        lblDate.Text = postdate;
        lblDescription.Text = postinfo.Description;
        lblStatus.Text = postinfo.Status;
        if (!Page.IsPostBack)
        {
            foreach (var taglist in db.tblTags.Where(d => d.PostId == postid))
            {
                lblTags.Text += taglist.Tag.ToString() + ". ";
            }
        }
        if (userInfo.RoleId==2)
        {
            lblConsultantName.Text = userInfo.CompanyName;
            lblConsultantEmail.Text = userInfo.Email;
            lblConsultantPhone.Text = userInfo.Phone; 
        }
        else if (userInfo.RoleId == 3)
        {
            lblVendorName.Text = userInfo.CompanyName;
            lblVendorEmail.Text = userInfo.Email;
            lblVendorPhone.Text = userInfo.Phone;
        }

        GridView2.DataSource = specificationData;
        GridView2.DataBind();
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
            Response.End();
        }
    }
    protected void lbtnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllPost.aspx");
    }
    protected void lbtnEMailEdit_Click(object sender, EventArgs e)
    {
        if (PanelEmailEdit.Visible == false)
        {
            PanelEmailEdit.Visible = true;
        }
        else if (PanelEmailEdit.Visible == true)
        {
            PanelEmailEdit.Visible = false;
        }
    }
    protected void lbtnEmailUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            if (data.Email != txtEmail.Text)
            {
                data.Email = txtEmail.Text;
                db.SaveChanges();
            }
            else if (data.Email == txtEmail.Text)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Email already exists!');location.href='AccountSettings.aspx'", true);
            }
            lblEmail.Text = data.Email;
            PanelEmailEdit.Visible = false;
        }
    }
    protected void lbtnEmailCancel_Click(object sender, EventArgs e)
    {
        PanelEmailEdit.Visible = false;
    }
    protected void lbtnPhoneEdit_Click(object sender, EventArgs e)
    {
        if (PanelPhoneEdit.Visible == false)
        {
            PanelPhoneEdit.Visible = true;
        }
        else if (PanelPhoneEdit.Visible == true)
        {
            PanelPhoneEdit.Visible = false;
        }
    }
    protected void lbtnPhoneUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            data.Phone = txtPhone.Text;
            db.SaveChanges();
        }
        lblPhone.Text = data.Phone;
        PanelPhoneEdit.Visible = false;

    }
    protected void lbtnPhoneCancel_Click(object sender, EventArgs e)
    {
        PanelPhoneEdit.Visible = false;
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "CompanyDetails" && e.CommandName != "Download")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblCompanyId = (Label)GridView3.Rows[index].FindControl("Label4");
            LinkButton lbtnCompanyName = (LinkButton)GridView3.Rows[index].FindControl("LinkButton2");

            int companyid = Convert.ToInt32(lblCompanyId.Text);

            var companyinfo = db.tblUserAccounts.Where(d => d.Id == companyid).FirstOrDefault();
            int companytypeid = Convert.ToInt32(companyinfo.CompanyTypeId);

            var companydata = db.tblCompanyDetails.Where(d => d.UserId == companyid).ToList();

            if (companytypeid == 1)
            {
                lblConsultantName.Text = lbtnCompanyName.Text;
                lblConsultantEmail.Text = companyinfo.Email;
                lblConsultantPhone.Text = companyinfo.Phone;
                GridView4.DataSource = companydata;
                GridView4.DataBind();

                pageheader.Visible = false;
                PanelConsultantCompanyDetails.Visible = true;
                PanelDetails.Visible = false;
            }
            else if (companytypeid == 2 || companytypeid == 3)
            {
                lblVendorName.Text = lbtnCompanyName.Text;
                lblVendorEmail.Text = companyinfo.Email;
                lblVendorPhone.Text = companyinfo.Phone;
                GridView5.DataSource = companydata;
                GridView5.DataBind();

                pageheader.Visible = false;
                PanelVendorCompanyDetails.Visible = true;
                PanelDetails.Visible = false;
            }
        }
        else if (e.CommandName == "Download" && e.CommandName != "CompanyDetails")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
            Response.End();
        }
    }
    protected void lbtnGoBackToPanelDetails1_Click(object sender, EventArgs e)
    {
        PanelConsultantCompanyDetails.Visible = false;
        PanelDetails.Visible = true;
        pageheader.Visible = true;
    }
    protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
        Response.End();
    }
    protected void lbtnGoBackToPanelDetails2_Click(object sender, EventArgs e)
    {
        PanelVendorCompanyDetails.Visible = false;
        PanelDetails.Visible = true;
        pageheader.Visible = true;
    }
}