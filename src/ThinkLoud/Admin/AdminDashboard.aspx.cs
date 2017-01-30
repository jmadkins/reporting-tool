using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void quickNavBtn_Click(object sender, EventArgs e)
        {
            string url = "/Publishers.aspx?";
            url += "pubID=" + this.quickNavTB.Text;

            Response.Redirect(url);
        }
    }
}