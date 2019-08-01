using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Generic_ChangePassword : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        SmtpClient smtp = new SmtpClient();
        MailMessage message = new MailMessage();
        string encryptedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

        var data = db.tblUserAccounts.Where(d => d.Email == txtEmail.Text).FirstOrDefault();
        if (data != null)
        {
            data.Password = encryptedpassword;
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
            message.Subject = "Your New MEPBD membership password";
            message.Body = "Password: " + txtPassword.Text + "\n"
                + "Please save your credentials in a secure space.";
            smtp.Send(message);

            //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Password changed Successfully. Check your email for updated credentials." + "');", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "",
"alert('Password changed Successfully. Check your email for updated credentials.');location.href='Login.aspx'", true);

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Your username/email does not exist!" + "');", true);
            txtEmail.Focus();
        }
    }
}