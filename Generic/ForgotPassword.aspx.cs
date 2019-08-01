using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Generic_ForgotPassword : System.Web.UI.Page
{
    mepbddbEntities db = new mepbddbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        SmtpClient smtp = new SmtpClient();
        MailMessage message = new MailMessage();

        var data = db.tblUserAccounts.Where(d => d.Email == txtEmail.Text).FirstOrDefault();
        try
        {
            if (data.Email != txtEmail.Text)
            {
                Page.ClientScript.RegisterStartupScript(GetType(),
                       "msgbox", "alert('" + "Email/ username does not exist!" + "');", true);
                txtEmail.Focus();
            }
            else if (data.Email == txtEmail.Text)
            {
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
                //message.Subject = "Your MEPITEM membership password";
                //string password = data.Password;
                //message.Body = "Your password is: " + password
                message.Subject = "Your MEPBD membership password reset link.";
                message.Body = "<a href=\"http://localhost:29809/Generic/ChangePassword.aspx\">Reset Password</a>";
                message.IsBodyHtml = true;
                smtp.Send(message);
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + "Password reset link sent! Check you email." + "');", true);
            }
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterStartupScript(GetType(),
                       "msgbox", "alert('" + "Email/ username does not exist!" + "');", true);
            txtEmail.Focus();
        }
    }
}