using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_ServiceDetails : System.Web.UI.Page
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
    private void clearddlItem()
    {
        ddlItem.Items.Clear();
        ddlItem.SelectedIndex = -1;
        ddlItem.SelectedValue = null;
        ddlItem.ClearSelection();
    }
    private void clearddlSubItem()
    {
        ddlSubItem.Items.Clear();
        ddlSubItem.SelectedIndex = -1;
        ddlSubItem.SelectedValue = null;
        ddlSubItem.ClearSelection();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblId = (Label)GridView1.SelectedRow.Cells[0].FindControl("Label8") as Label;
        int id = Int32.Parse(lblId.Text);
        Session["detailsid"] = id;
        clearddlSystem();
        //clearddlSubSystem();
        //clearddlItem();
        //clearddlSubItem();
        var data = db.tblCompanyDetails.Where(d => d.Id == id).FirstOrDefault();
        ddlSystem.SelectedValue = data.SystemId.ToString();
        ddlSubSystem.SelectedValue = data.SubSystemId.ToString();
        ddlItem.SelectedValue = data.ItemId.ToString();
        ddlSubItem.SelectedValue = data.SubItemId.ToString();
        txtBrand.Text = data.BrandName;
        txtMinCapacity.Text = data.MinCapacity;
        txtMaxCapacity.Text = data.MaxCapacity;

        PanelUpdateInfo.Visible = true;
        PanelData.Visible = false;
        PanelUpdateButton.Visible = true;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {      

        if (e.CommandName == "Details" && e.CommandName != "DeleteRow")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblId = (Label)GridView1.Rows[index].FindControl("Label8");
            Label lblSystemTitle = (Label)GridView1.Rows[index].FindControl("Label1");
            Label lblSubSystemTitle = (Label)GridView1.Rows[index].FindControl("Label2");
            Label lblItemTitle = (Label)GridView1.Rows[index].FindControl("Label3");
            Label lblSubItemTitle = (Label)GridView1.Rows[index].FindControl("Label4");
            Label lblBrandName = (Label)GridView1.Rows[index].FindControl("Label5");
            Label lblMinCapacityNo = (Label)GridView1.Rows[index].FindControl("Label6");
            Label lblMaxCapacityNo = (Label)GridView1.Rows[index].FindControl("Label7");

            int id = Convert.ToInt32(lblId.Text);
            var data = db.tblCompanyDetails.Where(d => d.Id == id).ToList();

            PanelData.Visible = false;
            PanelDetails.Visible = true;

            lblSystem.Text = lblSubSystemTitle.Text;
            lblSubSystem.Text = lblSubSystemTitle.Text;
            lblItem.Text = lblItemTitle.Text;
            lblSubItem.Text = lblSubItemTitle.Text;
            lblBrand.Text = lblBrandName.Text;
            lblMinCapacity.Text = lblMinCapacityNo.Text;
            lblMaxCapacity.Text = lblMaxCapacityNo.Text;
            GridView2.DataSource = data;
            GridView2.DataBind();
        }
        else if (e.CommandName == "DeleteRow" && e.CommandName != "Details")
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
        //if (e.CommandName == "Download" && e.CommandName != "Select" && e.CommandName != "Details")
        //{
        //    Response.Clear();
        //    Response.ContentType = "application/octet-stream";
        //    Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
        //    Response.TransmitFile(Server.MapPath("~/UploadedFiles/") + e.CommandArgument);
        //    Response.End();
        //}
        //else if(e.CommandName == "Details" && e.CommandName != "Download" && e.CommandName != "Select")
        //{
        //    int index = Convert.ToInt32(e.CommandArgument.ToString());
        //    PanelData.Visible = false;
        //    PanelDetails.Visible = true;
        //}
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
        Response.Redirect(Request.RawUrl);
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
        if (ddlItem.SelectedValue == "0")
        {
            data.ItemId = Convert.ToInt32(0);
            data.ItemTitle = "N/A";
        }
        else
        {
            data.ItemId = Convert.ToInt32(ddlItem.SelectedValue);
            data.ItemTitle = ddlItem.SelectedItem.ToString();
        }
        if (ddlSubItem.SelectedValue == "0")
        {
            data.SubItemId = Convert.ToInt32(0);
            data.SubItemTitle = "N/A";
        }
        else
        {
            data.SubItemId = Convert.ToInt32(ddlSubItem.SelectedValue);
            data.SubItemTitle = ddlSubItem.SelectedItem.ToString();
        }
        if (txtBrand.Text=="")
        {
            data.BrandName = "N/A"; 
        }
        else
        {
            data.BrandName = txtBrand.Text;
        }
        if (txtMinCapacity.Text == "")
        {
            data.MinCapacity = "N/A";
        }
        else
        {
            data.MinCapacity = txtMinCapacity.Text;
        }
        if (txtMaxCapacity.Text == "")
        {
            data.MaxCapacity = "N/A";
        }
        else
        {
            data.MaxCapacity = txtMaxCapacity.Text;
        }
        //string Catalogue = Session["companyName"] + "_" + ddlSystem.SelectedItem +
        //        "_" + ddlSubSystem.SelectedItem + "_" + ddlItem.SelectedItem +
        //        "_" + ddlSubItem.SelectedItem + "_" + txtBrand.Text + "_" + "Catalogue";

        if (fupCatalogue.HasFile)
        {
            //string extension = Path.GetExtension(fupCatalogue.PostedFile.FileName);
            //data.Catalogue = extension;
            //fupCatalogue.SaveAs(Server.MapPath("../UploadedFiles/" + fupCatalogue.FileName + extension));

            string fileNameCatalogue = fupCatalogue.FileName.Replace(",", "");
            data.Catalogue = fileNameCatalogue;
            fupCatalogue.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameCatalogue));

        }
        //string Specification = Session["companyName"] + "_" + ddlSystem.SelectedItem +
        //       "_" + ddlSubSystem.SelectedItem + "_" + ddlItem.SelectedItem +
        //       "_" + ddlSubItem.SelectedItem + "_" + txtBrand.Text + "_" + "Specification";

        if (fupSpecification.HasFile)
        {
            //string extension = Path.GetExtension(fupBOQ.PostedFile.FileName);
            //data.BOQSpecification = extension;
            //fupBOQ.SaveAs(Server.MapPath("../UploadedFiles/" + fupBOQ.FileName + extension));

            string fileNameSpecification = fupSpecification.FileName.Replace(",", "");
            data.Specification = fileNameSpecification;
            fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameSpecification));
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
}