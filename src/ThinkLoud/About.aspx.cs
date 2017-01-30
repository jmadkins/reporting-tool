using System;
using System.Linq;
using System.Web.Configuration;

namespace ThinkLoud
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.appName.Text = WebConfigurationManager.AppSettings["AppName"].ToString();
            this.versionNumber.Text = WebConfigurationManager.AppSettings["Version"].ToString();
            this.company.Text = WebConfigurationManager.AppSettings["Company"].ToString();

        }
    }
}