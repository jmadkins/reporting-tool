using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;

namespace ThinkLoud.Settings.Create
{
    public partial class Publisher : System.Web.UI.Page
    {
        static string prevPage = String.Empty;
        private string connectionString =
WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        private void ClearForm()
        {
            this.txtName.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Perform user-defined checks.
            if (txtName.Text == "")
            {
                lblResults.Text = "All fields are required...";
                return;
            }

            // Define ADO.NET objects.
            string insertSQL;
            insertSQL = "INSERT INTO Publishers (";
            insertSQL += "Name) ";
            insertSQL += "VALUES (";
            insertSQL += "@Name)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            // Add the parameters.
            cmd.Parameters.AddWithValue("@Name", txtName.Text);

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }
    }
}