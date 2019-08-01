using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultant_InsertServiceDetails : System.Web.UI.Page
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
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        tblCompanyDetail companydetail = new tblCompanyDetail();
        int userid = Convert.ToInt32(Session["userid"]);
        int companytypeid = Convert.ToInt32(Session["companytypeid"]);
        int systemid = Convert.ToInt32(ddlSystem.SelectedValue);
        int subsystemid = Convert.ToInt32(ddlSubSystem.SelectedValue);
        string systemtitle = ddlSystem.SelectedItem.ToString();
        string subsystemtitle = ddlSubSystem.SelectedItem.ToString();


        if (db.tblCompanyDetails.Any
                (d => d.UserId == userid &&
                    d.SystemId == systemid &&
                    d.SubSystemId == subsystemid &&
                    d.SystemTitle == systemtitle &&
                    d.SubSystemTitle == subsystemtitle
                )
            )
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Data already exists!" + "');", true);
        }
        else
        {
            companydetail.UserId = Convert.ToInt32(Session["userid"]);
            companydetail.CompanyTypeId = companytypeid;
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
    protected void lbtnInsertNewSubSystem_Click(object sender, EventArgs e)
    {
        PanelAddInfo.Visible = false;
        PanelAddNewSubSystem.Visible = true;
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
}