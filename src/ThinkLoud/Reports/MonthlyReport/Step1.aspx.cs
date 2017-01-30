using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ThinkLoud
{
    public partial class Step1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdBegin_Click(object sender, EventArgs e)
        {
            if (lstPublishers.SelectedIndex == -1)
            {
                //Error
            }
            else
            {
                string url = "/Reports/MonthlyReport/Step2.aspx?";
                url += "pubID=" + lstPublishers.SelectedValue;

                Response.Redirect(url);
            }
        }

        protected void cmdBegin_Click1(object sender, EventArgs e)
        {

        }
    }
}