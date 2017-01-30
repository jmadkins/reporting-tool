using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings.Create
{
    public partial class Note : System.Web.UI.Page
    {
        public string publisherIDBefore;
        public int publisherID;
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            publisherIDBefore = Request.QueryString["pubID"];
            this.txtDate.Text = DateTime.Today.Date.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            publisherID = Convert.ToInt32(publisherIDBefore);
            
            //Return
            string url = "/Publishers.aspx?";
            url += "pubID=" + this.publisherID;

            Response.Redirect(url);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Create
            publisherID = Convert.ToInt32(publisherIDBefore);

            if (txtText.Text == "" || txtTitle.Text == "")
            {
                lblResults.Text = "A title and text for the note is required...";
                return;
            }

            // Define ADO.NET objects.
            string insertSQL;
            insertSQL = "INSERT INTO [Notes] (";
            insertSQL += "Title, ";
            insertSQL += "Text, DateCreated, PubID) ";
            insertSQL += "VALUES (";
            insertSQL += "@Title, ";
            insertSQL += "@Text, @DateCreated, @PubID)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            // Add the parameters.
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Text", txtText.Text);
            cmd.Parameters.AddWithValue("@DateCreated", txtDate.Text);
            cmd.Parameters.AddWithValue("@PubID", publisherID);

            // Try to open the database and execute the update.
            int added = 0;
            try
            {
                con.Open();
                added = cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                lblResults.Text = "Error inserting record. ";
                lblResults.Text += err.Message;
            }
            finally
            {
                lblResults.Text = "Record inserted...";
                ClearForm();
                con.Close();
            }
        }

        private void ClearForm()
        {
            this.txtTitle.Text = "";
            this.txtText.Text = "";
            this.txtDate.Text = DateTime.Today.Date.ToString();
        }
    }
}