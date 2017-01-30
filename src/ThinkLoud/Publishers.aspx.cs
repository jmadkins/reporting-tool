using System;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings
{
    public partial class Publishers : System.Web.UI.Page
    {
        public string publisherIDBefore;
        static string prevPage = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            publisherIDBefore = Request.QueryString["pubID"];

            if (!IsPostBack)
            {
                try
                {
                    prevPage = Request.UrlReferrer.ToString();
                }
                catch (NullReferenceException err)
                {
                    prevPage = "Default.aspx";
                }
            }
        }

        protected void cmdNew0_Click(object sender, EventArgs e)
        {
            string url = "/Settings/Create/Contact.aspx?";
            url += "pubID=" + publisherIDBefore;

            Response.Redirect(url);
        }

        protected void cmdNew1_Click(object sender, EventArgs e)
        {
            string url = "/Settings/Create/PubSecName.aspx?";
            url += "pubID=" + publisherIDBefore;

            Response.Redirect(url);
        }

        protected void runReport(object sender, EventArgs e)
        {
            string url = "/Reports/MonthlyReport/Step2.aspx?";
            url += "pubID=" + publisherIDBefore;

            Response.Redirect(url);
        }

        protected void returnBttn_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string url = "/Settings/Create/Note.aspx?";
            url += "pubID=" + publisherIDBefore;

            Response.Redirect(url);
        }
    }
}