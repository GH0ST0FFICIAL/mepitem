using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Item : System.Web.UI.Page
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

        showData();        
    }
    private void showData()
    {
        var data = db.tblItems.Where(d => d.SubSystemId != 0).OrderByDescending(d => d.Id).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        showData();
    }
    private void clearddlSubSystem()
    {
        ddlSubSystem.Items.Clear();
        ddlSubSystem.SelectedIndex = -1;
        ddlSubSystem.SelectedValue = null;
        ddlSubSystem.ClearSelection();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblId = (Label)GridView1.SelectedRow.Cells[0].FindControl("Label8") as Label;
        int id = Int32.Parse(lblId.Text);
        Session["id"] = id;
        clearddlSubSystem();
        var data = db.tblItems.Where(d => d.Id == id).FirstOrDefault();
        ddlSubSystem.SelectedValue = data.SubSystemId.ToString();
        txtTitle.Text = data.Title;

        PanelAddInfo.Visible = true;
        PanelSubmitButton.Visible = false;
        PanelData.Visible = false;
        lbtnFinishInsert.Visible = false;
        PanelUpdateButton.Visible = true;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        tblCompanyDetail companydetail = new tblCompanyDetail();

        int id = Convert.ToInt32(Session["id"]);
        var data = db.tblItems.Where(d => d.Id == id).FirstOrDefault();
        data.SubSystemId = Convert.ToInt32(ddlSubSystem.SelectedValue);
        data.Title = txtTitle.Text;
        db.SaveChanges();

        foreach (var item in db.tblCompanyDetails.Where(d => d.ItemId == data.Id).ToList())
        {
            item.ItemTitle = data.Title;
        }
        db.SaveChanges();

        Response.Redirect(Request.RawUrl);
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Data Updated!');", true);
    }
    protected void lbtnFinishUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void lbtnInsert_Click(object sender, EventArgs e)
    {
        if (PanelData.Visible == true)
        {
            PanelData.Visible = false;
            PanelAddInfo.Visible = true;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        tblItem items = new tblItem();
        if (db.tblItems.Any(d => d.Title == txtTitle.Text))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + txtTitle.Text + " " + "already exists!" + "');", true);
        }
        else
        {
            items.Title = txtTitle.Text;
            items.SubSystemId = Int32.Parse(ddlSubSystem.SelectedValue);
            db.tblItems.Add(items);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
            txtTitle.Text = "";
        }
    }
    protected void lbtnFinishInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}