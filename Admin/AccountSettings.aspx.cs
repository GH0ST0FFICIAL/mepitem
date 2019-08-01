using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AccountSettings : System.Web.UI.Page
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
        showAccountInfo();
    }
    private void showAccountInfo()
    {
        int userid = Int32.Parse(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        lblEmail.Text = data.Email;
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
    protected void lbtnEmailCancel_Click(object sender, EventArgs e)
    {
        PanelEmailEdit.Visible = false;
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
                ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Email changed successfully!');location.href='AccountSettings.aspx'", true);
            }
            else if (data.Email == txtEmail.Text)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Email already exists!');location.href='AccountSettings.aspx'", true);
            }
            lblEmail.Text = data.Email;
        }
    }

    protected void lbtnPasswordEdit_Click(object sender, EventArgs e)
    {
        if (PanelPasswordEdit.Visible == false)
        {
            PanelPasswordEdit.Visible = true;
        }
        else if (PanelPasswordEdit.Visible == true)
        {
            PanelPasswordEdit.Visible = false;
        }
    }
    protected void lbtnPasswordCancel_Click(object sender, EventArgs e)
    {
        PanelPasswordEdit.Visible = false;
    }
    protected void lbtnPasswordUpdate_Click(object sender, EventArgs e)
    {
        string encryptedOldpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPassword.Text, "SHA1");
        string encryptedNewpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtConfirmPassword.Text, "SHA1");

        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            if (data.Password == encryptedOldpassword)
            {
                data.Password = encryptedNewpassword;
                db.SaveChanges();
                ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Password changed successfully!');location.href='AccountSettings.aspx'", true);
            }
            else if (data.Password != encryptedOldpassword)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "",
            "alert('Password doesn't exist!');location.href='AccountSettings.aspx'", true);
            }
        }
    }
}