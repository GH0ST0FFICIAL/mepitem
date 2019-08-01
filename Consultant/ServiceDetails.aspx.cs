using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultant_ServiceDetails : System.Web.UI.Page
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

        showData();
    }
    private void showData()
    {
        int userid = Convert.ToInt32(Session["userid"]);
        var data = db.tblCompanyDetails.Where(d => d.UserId == userid).OrderByDescending(d => d.Id).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        showData();
    }
    private void clearddlSystem()
    {
        ddlSystem.Items.Clear();
        ddlSystem.SelectedIndex = -1;
        ddlSystem.SelectedValue = null;
        ddlSystem.ClearSelection();
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
        Session["detailsid"] = id;
        clearddlSystem();
        //clearddlSubSystem();
        var data = db.tblCompanyDetails.Where(d => d.Id == id).FirstOrDefault();
        ddlSystem.SelectedValue = data.SystemId.ToString();
        ddlSubSystem.SelectedValue = data.SubSystemId.ToString();

        PanelUpdateInfo.Visible = true;
        PanelData.Visible = false;
        PanelUpdateButton.Visible = true;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["detailsid"]);
        var data = db.tblCompanyDetails.Where(d => d.Id == id).FirstOrDefault();
        data.SystemId = Convert.ToInt32(ddlSystem.SelectedValue);
        data.SystemTitle = ddlSystem.SelectedItem.ToString();
        if (ddlSubSystem.SelectedValue == "0")
        {
            data.SubSystemId = Convert.ToInt32(0);
            data.SubSystemTitle = "N/A";
        }
        else
        {
            data.SubSystemId = Convert.ToInt32(ddlSubSystem.SelectedValue);
            data.SubSystemTitle = ddlSubSystem.SelectedItem.ToString();
        }
        db.SaveChanges();

        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Data Updated!');", true);
        Response.Redirect(Request.RawUrl);
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
        Response.Redirect("InsertServiceDetails.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblId = (Label)GridView1.Rows[index].FindControl("Label8");
            int id = Convert.ToInt32(lblId.Text);

            var data = db.tblCompanyDetails.Where(d => d.Id == id).FirstOrDefault();
            db.tblCompanyDetails.Remove(data);
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Data Deleted!');location.href='ServiceDetails.aspx'", true);
        }
    }
}