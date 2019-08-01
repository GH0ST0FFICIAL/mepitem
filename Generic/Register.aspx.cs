using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Net.Mail;
using System.Net;

public partial class Generic_Register : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        tblUserAccount users = new tblUserAccount();
        SmtpClient smtp = new SmtpClient();
        MailMessage message = new MailMessage();
        string encryptedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

        if (Page.IsValid)
        {
            if (db.tblUserAccounts.Any(u => u.Email == txtEmail.Text))
            {
                Page.ClientScript.RegisterStartupScript(GetType(),
                    "msgbox", "alert('" + "Email already exists!" + "');", true);
                txtEmail.Focus();
            }
            else
            {
                users.CompanyName = txtCompanyName.Text;
                users.Address = txtAddress.Text;
                users.Phone = txtPhone.Text;
                users.Website = txtWebsite.Text;
                users.Password = encryptedpassword;
                users.Email = txtEmail.Text;

                //string FolderName = Path.Combine(Server.MapPath("~/CompanyFiles"), txtCompanyName.Text);

                //if (!System.IO.Directory.Exists(FolderName))
                //{
                //    System.IO.Directory.CreateDirectory(FolderName);
                //}
                //users.Folder = FolderName;

                if (ddlCompanyType.SelectedItem.ToString() == "Consultant")
                {
                    users.RoleId = 2;
                    users.CompanyTypeId = 1;
                }
                else if (ddlCompanyType.SelectedItem.ToString() == "Vendor")
                {
                    users.RoleId = 3;
                    users.CompanyTypeId = 2;
                }
                else if (ddlCompanyType.SelectedItem.ToString() == "Both (Consultant & Vendor)")
                {
                    users.RoleId = 3;
                    users.CompanyTypeId = 3;
                }
                else if (ddlCompanyType.SelectedItem.ToString() == "Client")
                {
                    users.RoleId = 4;
                    users.CompanyTypeId = 4;
                }
                db.tblUserAccounts.Add(users);
                db.SaveChanges();

                MailAddress fromAddress = new MailAddress("MEPBD <mail.solutionnest@gmail.com>");
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                message.From = fromAddress;
                message.To.Add(txtEmail.Text);
                NetworkCredential credentials = new NetworkCredential("mail.solutionnest@gmail.com", "ghost9990");
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = credentials;
                message.Subject = "Your MEPBD membership credentials";
                message.Body = "Username: " + txtEmail.Text + "<br />" + "Password: " + txtPassword.Text + "<br />"
                    + "Please save your credentials in a secure space." + "<br />" +
                    "Click " + "<a href=\"http://localhost:2257/Generic/Login.aspx\">here</a>" + " to login.";
                message.IsBodyHtml = true;
                smtp.Send(message);
                ScriptManager.RegisterStartupScript(this, GetType(), "",
                "alert('Registered successfully. Please check your provided email for MEPBD account information.');location.href='Login.aspx'", true);
                //Page.ClientScript.RegisterStartupScript(GetType(),
                //    "msgbox", "alert('" + "Registered Successfully!" + " Username: " + users.Email + " | " + " Password: " +
                //    users.Password + "\n" + " An email was sent to your email account." + "');", true);
            }
        }
    }
}