using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Generic_Login : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string Password = txtPassword.Text;
            txtPassword.Attributes.Add("value", Password);
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == false)
        {
            txtPassword.TextMode = TextBoxMode.Password;
        }

        if (CheckBox1.Checked == true)
        {
            txtPassword.TextMode = TextBoxMode.SingleLine;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string encryptedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
        string username = txtEmail.Text;

        var data = db.tblUserAccounts.Where(u => u.Email == username && u.Password == encryptedpassword).FirstOrDefault();
        if (data != null)
        {
            if (data.RoleId == 1)
            {
                Session["roleid"] = data.RoleId;
                Session["userid"] = data.Id;
                Response.Redirect("~/Admin/Default.aspx");
            }
            else if (data.RoleId == 2)
            {
                Session["roleid"] = data.RoleId;
                Session["userid"] = data.Id;
                Session["email"] = data.Email;
                Session["companyName"] = data.CompanyName;
                Session["companytypeid"] = data.CompanyTypeId;
                Response.Redirect("~/Consultant/Default.aspx");
            }
            else if (data.RoleId == 3)
            {
                Session["roleid"] = data.RoleId;
                Session["userid"] = data.Id;
                Session["email"] = data.Email;
                Session["companyName"] = data.CompanyName;
                Session["companytypeid"] = data.CompanyTypeId;
                //Session["folder"] = data.Folder; 
                Response.Redirect("~/Vendor/Default.aspx");
            }
            else if (data.RoleId == 4)
            {
                Session["roleid"] = data.RoleId;
                Session["userid"] = data.Id;
                Session["email"] = data.Email;
                Session["companyName"] = data.CompanyName;
                Session["companytypeid"] = data.CompanyTypeId;
                Response.Redirect("~/Client/Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "",
        "alert('Invalid username or password');location.href='Login.aspx'", true);

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "",
       "alert('Invalid username or password');location.href='Login.aspx'", true);
        }
    }
}