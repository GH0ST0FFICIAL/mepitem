using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultant_AccountSettings : System.Web.UI.Page
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
        showAccountInfo();
    }
    private void showAccountInfo()
    {
        int userid = Int32.Parse(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        lblCompanyName.Text = data.CompanyName;
        lblEmail.Text = data.Email;
        lblAddress.Text = data.Address;
        lblPhone.Text = data.Phone;
        if (data.Website!="")
        {
            lblWebsite.Text = data.Website; 
        }
        else
        {
            lblWebsite.Text = "n/a";
        }
    }
    protected void lbtnCompanyNameEdit_Click(object sender, EventArgs e)
    {
        if (PanelCompanyNameEdit.Visible==false)
        {
            PanelCompanyNameEdit.Visible = true;
        }
        else if (PanelCompanyNameEdit.Visible == true)
        {
            PanelCompanyNameEdit.Visible = false;
        }
    }
    protected void lbtnCompanyNameCancel_Click(object sender, EventArgs e)
    {
        PanelCompanyNameEdit.Visible = false;
    }
    protected void lbtnCompanyNameUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data!=null)
        {
            data.CompanyName = txtCompanyName.Text;
            db.SaveChanges();
            Session["companyName"] = data.CompanyName;
            ScriptManager.RegisterStartupScript(this, GetType(), "",
        "alert('Company name changed successfully!');location.href='AccountSettings.aspx'", true);
            lblCompanyName.Text = data.CompanyName;
        }
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
            if (data.Email!=txtEmail.Text)
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

    protected void lbtnAddressEdit_Click(object sender, EventArgs e)
    {
        if (PanelAddressEdit.Visible == false)
        {
            PanelAddressEdit.Visible = true;
        }
        else if (PanelAddressEdit.Visible == true)
        {
            PanelAddressEdit.Visible = false;
        }
    }
    protected void lbtnAddressCancel_Click(object sender, EventArgs e)
    {
        PanelAddressEdit.Visible = false;
    }
    protected void lbtnAddressUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            data.Address = txtAddress.Text;
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "",
        "alert('Address changed successfully!');location.href='AccountSettings.aspx'", true);
            lblAddress.Text = data.Address;
        }
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
    protected void lbtnPhoneCancel_Click(object sender, EventArgs e)
    {
        PanelPhoneEdit.Visible = false;
    }
    protected void lbtnPhoneUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            data.Phone = txtPhone.Text;
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "",
        "alert('Address changed successfully!');location.href='AccountSettings.aspx'", true);
            lblPhone.Text = data.Phone;
        }
    }

    protected void lbtnWebsiteEdit_Click(object sender, EventArgs e)
    {
        if (PanelWebsiteEdit.Visible == false)
        {
            PanelWebsiteEdit.Visible = true;
        }
        else if (PanelWebsiteEdit.Visible == true)
        {
            PanelWebsiteEdit.Visible = false;
        }
    }
    protected void lbtnWebsiteCancel_Click(object sender, EventArgs e)
    {
        PanelWebsiteEdit.Visible = false;
    }
    protected void lbtnWebsiteUpdate_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"].ToString());
        var data = db.tblUserAccounts.Where(d => d.Id == userid).FirstOrDefault();
        if (data != null)
        {
            data.Website = txtWebsite.Text;
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "",
        "alert('Address changed successfully!');location.href='AccountSettings.aspx'", true);
            lblWebsite.Text = data.Website;
        }
    }
}