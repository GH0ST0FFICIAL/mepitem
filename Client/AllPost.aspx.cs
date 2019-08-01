using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_AllPost : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();
    ArrayList array1 = new ArrayList();
    ArrayList array2 = new ArrayList();

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

        if (!IsPostBack)
        {
            populateTags();
        }
    }

    private void showData()
    {
        int userid = Convert.ToInt32(Session["userid"]);
        var data = db.tblPosts.Where(d => d.UserId == userid).OrderByDescending(d => d.Id).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        showData();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        Label lblId = (Label)GridView1.Rows[index].FindControl("Label1");
        Label lblPostDate = (Label)GridView1.Rows[index].FindControl("Label2");
        Label lblPostDescription = (Label)GridView1.Rows[index].FindControl("Label3");
        LinkButton lbtnPostStatus = (LinkButton)GridView1.Rows[index].FindControl("LinkButton2");
        //Label lblPostStatus = (Label)GridView1.Rows[index].FindControl("Label4");
        Label lblUserId = (Label)GridView1.Rows[index].FindControl("Label5");

        if (e.CommandName == "Details" && e.CommandName != "Close")
        {
            int userid = Convert.ToInt32(Session["userid"].ToString());
            var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
            int postid = Convert.ToInt32(lblId.Text); Session["clientPostId"] = postid;
            var specificationData = db.tblPosts.Where(d => d.Id == postid).ToList();
            var postinfo = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
            string postdate = Convert.ToDateTime(postinfo.PostDate.ToString()).ToString("dd MMM yyyy  (hh:mm tt)");
            Response.Redirect("PostDetailAndOffer.aspx");
        }
        else if (e.CommandName == "Close" && e.CommandName != "Details")
        {
            int postid = Convert.ToInt32(lblId.Text);
            var data = db.tblPosts.Where(d => d.Id == postid).FirstOrDefault();
            data.Status = "Closed";
            db.SaveChanges();
            showData();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
                        lbtnStatus.ToolTip = "This post is closed permanently";
                        lbtnStatus.CssClass = "badge badge-danger";
                        lbtnStatus.ForeColor = System.Drawing.Color.White;
                    }
                }
            }
        }
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
    protected void lbtnInsert_Click(object sender, EventArgs e)
    {
        PanelPost.Visible = false;
        PanelCreatePost.Visible = true;
    }

    public void populateTags()
    {
        var data = db.tblSystems.Where(d => d.Id != 0).Select(d => d.Title).
            Union(db.tblSubSystems.Where(d => d.Id != 0).Select(d => d.Title).
            Union(db.tblItems.Where(d => d.Id != 0).Select(d => d.Title).
            Union(db.tblSubItems.Where(d => d.Id != 0).Select(d => d.Title)))).ToList();

        //var data = db.tblSystems.Where(d => d.Id != 0).ToList();
        //lstboxAddTag.DataTextField = "Title";
        //lstboxAddTag.DataValueField = "Id";
        //lstboxAddTag.DataSource = data;
        //lstboxAddTag.DataBind();

        ddlTags.DataSource = data;
        ddlTags.DataBind();
    }
    //protected void lbtnAddTag_Click(object sender, EventArgs e)
    //{
    //    //---for multiple move----
    //    if (lstboxAddTag.SelectedIndex >= 0)
    //    {
    //        for (int i = 0; i < lstboxAddTag.Items.Count; i++)
    //        {
    //            if (lstboxAddTag.Items[i].Selected)
    //            {
    //                if (!array1.Contains(lstboxAddTag.Items[i]))
    //                {
    //                    array1.Add(lstboxAddTag.Items[i]);
    //                }
    //            }
    //        }
    //        for (int i = 0; i < array1.Count; i++)
    //        {
    //            if (!lstboxRemoveTag.Items.Contains(((ListItem)array1[i])))
    //            {
    //                lstboxRemoveTag.Items.Add(((ListItem)array1[i]));
    //            }
    //            lstboxAddTag.Items.Remove(((ListItem)array1[i]));
    //        }
    //        lstboxRemoveTag.SelectedIndex = -1;
    //    }
    //    else
    //    {
    //        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Select a tag to add!" + "');", true);
    //    }
    //    //---for multiple move----

    //    //---for single move----

    //    //if (lstboxAddTag.SelectedIndex != -1)
    //    //{
    //    //    lstboxRemoveTag.Items.Add(lstboxAddTag.SelectedItem);
    //    //    lstboxAddTag.Items.RemoveAt(lstboxAddTag.SelectedIndex);
    //    //}
    //    //else
    //    //{
    //    //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Select a tag to add!" + "');", true);
    //    //}
    //    //---for single move----

    //}
    //protected void lstboxAddTag_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (lstboxAddTag.SelectedIndex > -1)
    //    {
    //        if (lstboxRemoveTag.Items.Count > lstboxAddTag.SelectedIndex) //checking if listBox2 has enough items to select
    //        {
    //            lstboxRemoveTag.SelectedIndex = lstboxAddTag.SelectedIndex;
    //        }
    //    }
    //}
    //protected void lbtnRemoveTag_Click(object sender, EventArgs e)
    //{
    //    if (lstboxRemoveTag.SelectedIndex >= 0)
    //    {
    //        for (int i = 0; i < lstboxRemoveTag.Items.Count; i++)
    //        {
    //            if (lstboxRemoveTag.Items[i].Selected)
    //            {
    //                if (!array2.Contains(lstboxRemoveTag.Items[i]))
    //                {
    //                    array2.Add(lstboxRemoveTag.Items[i]);
    //                }
    //            }
    //        }
    //        for (int i = 0; i < array2.Count; i++)
    //        {
    //            if (!lstboxAddTag.Items.Contains(((ListItem)array2[i])))
    //            {
    //                lstboxAddTag.Items.Add(((ListItem)array2[i]));
    //            }
    //            lstboxRemoveTag.Items.Remove(((ListItem)array2[i]));
    //        }
    //        lstboxAddTag.SelectedIndex = -1;
    //    }
    //    else
    //    {
    //        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Select a tag to remove!" + "');", true);
    //    }

    //}
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        tblPost post = new tblPost();
        tblTag tag = new tblTag();
        tblPostNotification postnotification = new tblPostNotification();

        var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Bangladesh Standard Time");
        var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZone);
        string date = now.ToString("yyyy-MM-dd hh:mm:ss tt");

        post.Description = txtDescription.Text;
        post.PostDate = Convert.ToDateTime(date);
        post.Status = "Active";
        if (fupSpecification.HasFile)
        {
            string fileNameSpecification = fupSpecification.FileName.Replace(",", "");
            post.Specification = fileNameSpecification;
            fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameSpecification));
        }
        post.UserId = Convert.ToInt32(Session["userid"].ToString());
        db.tblPosts.Add(post);
        db.SaveChanges();

        string[] tagsArray = new string[ddlTags.Items.Count];
        int index = 0;
        foreach (ListItem li in ddlTags.Items)
        {
            if (li.Selected)
            {
                tagsArray[index] = li.Value;
                index = index + 1;
                tag.Tag = li.Text;
                tag.PostId = Convert.ToInt32(post.Id);
                db.tblTags.Add(tag);
                db.SaveChanges();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Post created successfully!" + "');", true);
            }
        }
        //for (int i = 0; i < lstboxRemoveTag.Items.Count; i++)
        //{
        //    if (!lstboxRemoveTag.Items[i].Selected || lstboxRemoveTag.Items[i].Selected)
        //    {
        //        tag.Tag = lstboxRemoveTag.Items[i].Text;
        //        tag.PostId = post.Id;
        //        db.tblTags.Add(tag);
        //        db.SaveChanges();
        //        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Post created successfully!" + "');", true);
        //    }
        //}
        //lstboxRemoveTag.Items.Clear();
        txtDescription.Text = "";
        populateTags();

        postnotification.PostId = post.Id;
        postnotification.NotificationDate = post.PostDate;
        db.tblPostNotifications.Add(postnotification);
        db.SaveChanges();
    }
    protected void lbtnFinishInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}