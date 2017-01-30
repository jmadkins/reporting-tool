using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud
{
    public partial class Reports : System.Web.UI.Page
    {
        static string prevPage = String.Empty;
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.reportLabel.Text = "";

            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        protected void lstReports_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.lstReports.SelectedValue == "monthlyReport")
            {
                this.reportLabel.Text = "Starting Monthly Report. Please wait...";
                Response.Redirect("/Reports/MonthlyReport/Step1.aspx");
            }
            else
            {
                if (this.lstReports.SelectedValue == "pubDetails")
                {
                    this.reportLabel.Text = "Report not found...";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }
    }
}