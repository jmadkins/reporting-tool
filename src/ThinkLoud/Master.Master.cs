using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.AppName.Text = WebConfigurationManager.AppSettings["AppName"].ToString();
            this.Version.Text = WebConfigurationManager.AppSettings["Version"].ToString();
            this.Company.Text = WebConfigurationManager.AppSettings["Company"].ToString();
        }
    }
}