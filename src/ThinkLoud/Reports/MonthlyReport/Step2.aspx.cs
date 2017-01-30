using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud
{
    public partial class Step2 : System.Web.UI.Page
    {
        public string publisherName;
        public string publisherIDBefore;
        public int publisherID;

        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            publisherIDBefore = Request.QueryString["pubID"];
            
            FillPublisherList();
        }

        private void FillPublisherList()
        {
            publisherIDBefore = Request.QueryString["pubID"];

            publisherID = Convert.ToInt32(publisherIDBefore);

            string sql = "SELECT * FROM [Publishers] WHERE ID='" + publisherID + "'";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader;

            try
            {
                con.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    this.publisherNameLabel.Text = reader["Name"].ToString();
                }
                reader.Close();
            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        protected void cmdBegin_Click(object sender, EventArgs e)
        {
            publisherID = Convert.ToInt32(publisherIDBefore);
            
            string url = "/Reports/MonthlyReport/Step3.aspx?";
            url += "pubID=" + publisherID;

            Response.Redirect(url);
        }

        protected void viewPublisher_Click(object sender, EventArgs e)
        {
            publisherID = Convert.ToInt32(publisherIDBefore);
            string url = "/Publishers.aspx?";
            url += "pubID=" + publisherID;

            Response.Redirect(url);
        }
    }
}