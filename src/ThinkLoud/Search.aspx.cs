using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud
{
    public partial class Search : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;
        static string prevPage = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void queryBtn_Click(object sender, EventArgs e)
        {
            //Nothing...
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string yourTextbox = GridView1.SelectedRow.Cells[1].Text;

            if (yourTextbox != null)
            {
                string url = "/Publishers.aspx?";
                url += "pubID=" + yourTextbox;

                Response.Redirect(url);
            }
            else
            {
                MessageBox.Show("Error loading publisher!");
            }
        }
    }
}