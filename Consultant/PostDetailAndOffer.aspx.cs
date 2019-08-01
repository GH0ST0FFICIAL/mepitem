using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultant_PostDetailAndOffer : System.Web.UI.Page
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
        if (Session["clientPostId"] != null && Session["clientId"] != null)
        {
            int postid = Convert.ToInt32(Session["clientPostId"].ToString());
            var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
            string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy (hh:mm tt)");
            var specificationData = db.tblPosts.Where(d => d.Id == postid).ToList();

            int userId = Convert.ToInt32(Session["clientId"].ToString());
            var userInfo = db.tblUserAccounts.Where(d => d.Id == userId).FirstOrDefault();

            lblDate.Text = postdate;
            lblDescription.Text = postinfo.Description;
            if (!Page.IsPostBack)
            {
                foreach (var taglist in db.tblTags.Where(d => d.PostId == postid))
                {
                    lblTags.Text += taglist.Tag.ToString() + ". ";
                }
            }
            lblCompanyName.Text = userInfo.CompanyName;
            lblEmail.Text = userInfo.Email;
            lblPhone.Text = userInfo.Phone;

            GridView1.DataSource = specificationData;
            GridView1.DataBind();

            GridView2.DataSourceID = "SqlDataSourceSentOffer";
            GridView2.DataBind();
        }
        else if (Session["PostIdFromNotification"] != null && Session["ClientIdFromNotification"] != null)
        {
            viewPostFromNotification();
            GridView2.DataSourceID = "SqlDataSourceSentOffer2";
            GridView2.DataBind();
        }
    }
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
        if (!Page.IsPostBack)
        {
            foreach (var taglist in db.tblTags.Where(d => d.PostId == postid))
            {
                lblTags.Text += taglist.Tag.ToString() + ". ";
            }
        }
        lblCompanyName.Text = userInfo.CompanyName;
        lblEmail.Text = userInfo.Email;
        lblPhone.Text = userInfo.Phone;

        GridView1.DataSource = specificationData;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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
        Response.Redirect("ClientPost.aspx");
    }

    protected void btnSendOffer_Click(object sender, EventArgs e)
    {
        PanelClient.Visible = false;
        PanelOfferForm.Visible = true;
    }
    protected void lbtnGoBackToPostDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        tblOffer offer = new tblOffer();
        tblOfferNotification offernotification = new tblOfferNotification();

        if (Session["clientPostId"] != null && Session["clientId"] != null)
        {
            offer.CompanyId = Convert.ToInt32(Session["userid"].ToString());
            offer.PostId = Convert.ToInt32(Session["clientPostId"].ToString());
            offer.ClientId = Convert.ToInt32(Session["clientId"].ToString());
            offer.MessageToClient = txtMessage.Text;
            offer.Status = "Active";
            var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Bangladesh Standard Time");
            var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZone);
            string date = now.ToString("yyyy-MM-dd hh:mm:ss tt");
            offer.OfferDate = Convert.ToDateTime(date);
            if (fupSpecification.HasFile)
            {
                string fileNameSpecification = fupSpecification.FileName.Replace(",", "");
                offer.Specification = fileNameSpecification;
                fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameSpecification));
            }
            db.tblOffers.Add(offer);
            db.SaveChanges();

            offernotification.OfferId = offer.Id;
            offernotification.PostId = offer.PostId;
            offernotification.NotificationDate = offer.OfferDate;
            db.tblOfferNotifications.Add(offernotification);
            db.SaveChanges();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Offer sent successfully!" + "');", true);
            GridView2.DataBind();
            Response.Redirect(Request.RawUrl); 
        }
        else if (Session["PostIdFromNotification"] != null && Session["ClientIdFromNotification"] != null)
        {
            offer.CompanyId = Convert.ToInt32(Session["userid"].ToString());
            offer.PostId = Convert.ToInt32(Session["PostIdFromNotification"].ToString());
            offer.ClientId = Convert.ToInt32(Session["ClientIdFromNotification"].ToString());
            offer.MessageToClient = txtMessage.Text;
            offer.Status = "Active";
            var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Bangladesh Standard Time");
            var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZone);
            string date = now.ToString("yyyy-MM-dd hh:mm:ss tt");
            offer.OfferDate = Convert.ToDateTime(date);
            if (fupSpecification.HasFile)
            {
                string fileNameSpecification = fupSpecification.FileName.Replace(",", "");
                offer.Specification = fileNameSpecification;
                fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameSpecification));
            }
            db.tblOffers.Add(offer);
            db.SaveChanges();

            offernotification.OfferId = offer.Id;
            offernotification.PostId = offer.PostId;
            offernotification.NotificationDate = offer.OfferDate;
            db.tblOfferNotifications.Add(offernotification);
            db.SaveChanges();

            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Offer sent successfully!" + "');", true);
            GridView2.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Close" && e.CommandName != "Download")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblId = (Label)GridView2.Rows[index].FindControl("Label1");
            Label lblPostId = (Label)GridView2.Rows[index].FindControl("Label2");
            Label lblClientId = (Label)GridView2.Rows[index].FindControl("Label3");
            Label lblOfferDate = (Label)GridView2.Rows[index].FindControl("Label5");
            Label lblCompanyName = (Label)GridView2.Rows[index].FindControl("Label6");
            Label lblMessage = (Label)GridView2.Rows[index].FindControl("Label7");
            LinkButton lbtnOfferStatus = (LinkButton)GridView2.Rows[index].FindControl("LinkButton2");

            int postid = Convert.ToInt32(lblPostId.Text);
            var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
            string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy (hh:mm tt)");
            var clientspecification = db.tblPosts.Where(d => d.Id == postid).ToList();

            int id = Convert.ToInt32(lblId.Text);
            var offerinfo = db.tblOffers.Where(d => d.PostId == postid).ToList();

            int offerid = Convert.ToInt32(lblId.Text);
            var data = db.tblOffers.Where(d => d.Id == offerid).FirstOrDefault();
            data.Status = "Closed";
            db.SaveChanges();
            if (Session["clientPostId"] != null && Session["clientId"] != null)
            {
                GridView2.DataSourceID = "SqlDataSourceSentOffer";
                GridView2.DataBind(); 
            }
            else if (Session["PostIdFromNotification"] != null && Session["ClientIdFromNotification"] != null)
            {
                GridView2.DataSourceID = "SqlDataSourceSentOffer2";
                GridView2.DataBind();
            }
        }
        else if (e.CommandName == "Download" && e.CommandName != "Close")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
            Response.End();
        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Normal)))
            {
                /* Get the value of the field that is going to determine what is disabled and what is enabled. */
                string statusValue = DataBinder.Eval(e.Row.DataItem, "Status").ToString();


                /* compare the value */
                if (statusValue == "Closed")
                {
                    /* find the control you want to disable or enable */
                    LinkButton lbtnStatus = (LinkButton)e.Row.FindControl("LinkButton2");


                    /* check if control exists. */
                    if (lbtnStatus != null)
                    {
                        /* enable/disable or do whatever you want with it */
                        lbtnStatus.Enabled = false;
                        lbtnStatus.OnClientClick = null;
                        lbtnStatus.ToolTip = "This offer is closed permanently";
                        lbtnStatus.CssClass = "badge badge-danger";
                        lbtnStatus.ForeColor = System.Drawing.Color.White;
                    }
                }
            }
        }
    }

}