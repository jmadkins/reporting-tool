using System;
using System.Linq;
using System.Net.Mail;

namespace ThinkLoud
{
    public partial class ComposeEmail : System.Web.UI.Page
    {
        public string publisherName;
        public string publisherIDBefore;
        public int publisherID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            publisherName = Request.QueryString["pubName"];
            publisherIDBefore = Request.QueryString["pubID"];
        }

        protected void cmdSend_Click(object sender, EventArgs e)
        {
            MailMessage eMail = new MailMessage();
            //MailAddress toAddress = new MailAddress(txtTo.Text);
            MailAddressCollection toAddress = new MailAddressCollection();
            MailAddress fromAddress = new MailAddress(txtTo.Text);

            //eMail.Bcc = this.txtBCC.Text;
            //eMail.CC = this.txtCC.Text;
            eMail.Subject = this.txtSubject.Text;
            eMail.Body = this.txtBody.Text;

            eMail.IsBodyHtml = false;
            eMail.Priority = MailPriority.Normal;
        }

        protected void cmdDefault_Click(object sender, EventArgs e)
        {
            //Default Text
            this.txtTo.Text = "";
            this.txtBCC.Text = "";
            this.txtCC.Text = "";
            this.txtSubject.Text = "";
            this.txtBody.Text = "";
        }

        protected void cmdClear_Click(object sender, EventArgs e)
        {
            this.txtTo.Text = "";
            this.txtBCC.Text = "";
            this.txtCC.Text = "";
            this.txtSubject.Text = "";
            this.txtBody.Text = "";
        }
    }
}