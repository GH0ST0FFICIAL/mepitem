using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_InsertServiceDetails : System.Web.UI.Page
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
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        tblCompanyDetail companydetail = new tblCompanyDetail();
        int userid = Convert.ToInt32(Session["userid"]);
        int companytypeid = Convert.ToInt32(Session["companytypeid"]);
        int systemid = Convert.ToInt32(ddlSystem.SelectedValue);
        int subsystemid = Convert.ToInt32(ddlSubSystem.SelectedValue);
        //int itemid = Convert.ToInt32(ddlItem.SelectedValue);
        //int subitemid = Convert.ToInt32(ddlSubItem.SelectedValue);
        string systemtitle = ddlSystem.SelectedItem.ToString();
        string subsystemtitle = ddlSubSystem.SelectedItem.ToString();
        //string itemtitle = ddlItem.SelectedItem.ToString();
        //string subitemtitle = ddlSubItem.SelectedItem.ToString();


        if (db.tblCompanyDetails.Any
                (d => d.UserId == userid &&
                    d.BrandName == txtBrand.Text &&
                    d.MinCapacity == txtMinCapacity.Text &&
                    d.MaxCapacity == txtMaxCapacity.Text &&
                    d.SystemId == systemid &&
                    d.SubSystemId == subsystemid &&
                    //d.ItemId == itemid &&
                    //d.SubItemId == subitemid &&
                    d.SystemTitle == systemtitle &&
                    d.SubSystemTitle == subsystemtitle //&&
                    //d.ItemTitle == itemtitle &&
                    //d.SubItemTitle == subitemtitle
                )
            )
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Data already exists!" + "');", true);
        }
        else
        {
            companydetail.UserId = Convert.ToInt32(Session["userid"]);
            companydetail.CompanyTypeId = companytypeid;
            if (txtBrand.Text == "")
            {
                companydetail.BrandName = "N/A"; 
            }
            else
            {
                companydetail.BrandName = txtBrand.Text;
            }
            if (txtMinCapacity.Text=="")
            {
                companydetail.MinCapacity = "N/A"; 
            }
            else
            {
                companydetail.MinCapacity = txtMinCapacity.Text;
            }
            if (txtMaxCapacity.Text == "")
            {
                companydetail.MaxCapacity = "N/A";
            }
            else
            {
                companydetail.MaxCapacity = txtMaxCapacity.Text;
            }
            companydetail.SystemId = Convert.ToInt32(ddlSystem.SelectedValue);
            companydetail.SystemTitle = ddlSystem.SelectedItem.ToString();
            if (ddlSubSystem.SelectedValue == "0")
            {
                companydetail.SubSystemId = Convert.ToInt32(0);
                companydetail.SubSystemTitle = "N/A";
            }
            else
            {
                companydetail.SubSystemId = Convert.ToInt32(ddlSubSystem.SelectedValue);
                companydetail.SubSystemTitle = ddlSubSystem.SelectedItem.ToString();
            }
            if (ddlItem.SelectedValue=="0")
            {
                companydetail.ItemId = Convert.ToInt32(0);
                companydetail.ItemTitle = "N/A";
            }
            else
            {
                companydetail.ItemId = Convert.ToInt32(ddlItem.SelectedValue);
                companydetail.ItemTitle = ddlItem.SelectedItem.ToString();
            }
            if (ddlSubItem.SelectedValue=="0")
            {
                companydetail.SubItemId = Convert.ToInt32(0);
                companydetail.SubItemTitle = "N/A";
            }
            else
            {
                companydetail.SubItemId = Convert.ToInt32(ddlSubItem.SelectedValue);
                companydetail.SubItemTitle = ddlSubItem.SelectedItem.ToString();
            }

            //string Catalogue = Session["companyName"] + "_" + ddlSystem.SelectedItem +
            //    "_" + ddlSubSystem.SelectedItem + "_" + ddlItem.SelectedItem +
            //    "_" + ddlSubItem.SelectedItem + "_" + txtBrand.Text + "_" + "Catalogue";

            if (fupCatalogue.HasFile)
            {
                //string extension = Path.GetExtension(fupCatalogue.PostedFile.FileName);
                //companydetail.Catalogue = extension;
                //fupCatalogue.SaveAs(Server.MapPath("../UploadedFiles/" + fupCatalogue.FileName + extension));

                string fileNameCatalogue = fupCatalogue.FileName.Replace(",", "");
                companydetail.Catalogue = fileNameCatalogue;
                fupCatalogue.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameCatalogue));
            }

            //string Specification = Session["companyName"] + "_" + ddlSystem.SelectedItem +
            //   "_" + ddlSubSystem.SelectedItem + "_" + ddlItem.SelectedItem +
            //   "_" + ddlSubItem.SelectedItem + "_" + txtBrand.Text + "_" + "Specification";

            if (fupSpecification.HasFile)
            {
                //string extension = Path.GetExtension(fupSpecification.PostedFile.FileName);
                //companydetail.Specification = extension;
                //fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fupSpecification.FileName + extension));

                string fileNameSpecification = fupSpecification.FileName.Replace(",", "");
                companydetail.Specification = fileNameSpecification;
                fupSpecification.SaveAs(Server.MapPath("../UploadedFiles/" + fileNameSpecification));
            }

            db.tblCompanyDetails.Add(companydetail);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
        }
    }
    protected void lbtnFinishInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("ServiceDetails.aspx");
    }

    protected void lbtnInsertNewSystem_Click(object sender, EventArgs e)
    {
        PanelAddInfo.Visible = false;
        PanelAddNewSystem.Visible = true;
    }
    protected void lbtnSubmitNewSystem_Click(object sender, EventArgs e)
    {
        tblSystem system = new tblSystem();
        if (db.tblSystems.Any(d => d.Title == txtNewSystemTitle.Text))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + txtNewSystemTitle.Text + " " + "already exists!" + "');", true);
        }
        else
        {
            system.Title = txtNewSystemTitle.Text;
            db.tblSystems.Add(system);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
            txtNewSystemTitle.Text = "";
        }
    }
    protected void lbtnDoneNewSystem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void lbtnInsertNewSubSystem_Click(object sender, EventArgs e)
    {
        PanelAddInfo.Visible = false;
        PanelAddNewSubSystem.Visible = true;
    }
    protected void lbtnSubmitNewSubSystem_Click(object sender, EventArgs e)
    {
        tblSubSystem subsystem = new tblSubSystem();
        if (db.tblSubSystems.Any(d => d.Title == txtNewSubSystemTitle.Text))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + txtNewSubSystemTitle.Text + " " + "already exists!" + "');", true);
        }
        else
        {
            subsystem.Title = txtNewSubSystemTitle.Text;
            subsystem.SystemId = Int32.Parse(ddlNewSystem.SelectedValue);
            db.tblSubSystems.Add(subsystem);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
            txtNewSubSystemTitle.Text = "";
        }
    }
    protected void lbtnDoneNewSubSystem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void lbtnInsertNewItem_Click(object sender, EventArgs e)
    {
        PanelAddInfo.Visible = false;
        PanelAddNewItem.Visible = true;
    }
    protected void lbtnSubmitNewItem_Click(object sender, EventArgs e)
    {
        tblItem items = new tblItem();
        if (db.tblItems.Any(d => d.Title == txtNewItemTitle.Text))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + txtNewItemTitle.Text + " " + "already exists!" + "');", true);
            ddlNewSubSystem.SelectedValue = 0.ToString();
            txtNewItemTitle.Text = "";
        }
        else
        {
            items.Title = txtNewItemTitle.Text;
            items.SubSystemId = Int32.Parse(ddlNewSubSystem.SelectedValue);
            db.tblItems.Add(items);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
            txtNewItemTitle.Text = "";
        }
    }
    protected void lbtnDoneNewItem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void lbtnInsertNewSubItem_Click(object sender, EventArgs e)
    {
        PanelAddInfo.Visible = false;
        PanelAddNewSubItem.Visible = true;
    }
    protected void lbtnSubmitNewSubItem_Click(object sender, EventArgs e)
    {
        tblSubItem subitem = new tblSubItem();
        if (db.tblSubItems.Any(d => d.Title == txtNewSubItemTitle.Text))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + txtNewSubItemTitle.Text + " " + "already exists!" + "');", true);
            ddlNewSubSystem2.SelectedValue = 0.ToString();
            ddlNewItem.SelectedValue = 0.ToString();
            txtNewSubItemTitle.Text = "";
        }
        else
        {
            subitem.Title = txtNewSubItemTitle.Text;
            subitem.ItemId = Int32.Parse(ddlNewItem.SelectedValue);
            subitem.SubSystemId = Int32.Parse(ddlNewSubSystem2.SelectedValue);
            db.tblSubItems.Add(subitem);
            db.SaveChanges();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added successfully');", true);
            txtNewSubItemTitle.Text = "";
        }
    }
    protected void lbtnDoneNewSubItem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}