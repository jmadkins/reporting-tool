using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings.Delete
{
    public partial class Publishers : System.Web.UI.Page
    {
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            lblResults.Text = "";
            
            string pubID = this.pubIDTB.Text;
            string pubName = "";
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataReader reader;

            //Select Publisher Name
            string selectPublisher = "SELECT * FROM Publishers WHERE ID=@ID";
            SqlCommand cmdSelectPublisher = new SqlCommand(selectPublisher, con);
            cmdSelectPublisher.Parameters.AddWithValue("@ID ", pubID);            

            //Delete PubSecNames
            string deletePubSecNamesSQL = "DELETE FROM PubSecName WHERE PubID=@PubID";
            SqlCommand cmdPubSecNames = new SqlCommand(deletePubSecNamesSQL, con);
            cmdPubSecNames.Parameters.AddWithValue("@PubID ", pubID);            
            
            //Delete Contacts
            string deleteContactSQL = "DELETE FROM Contacts WHERE PubID=@PubID";
            SqlCommand cmdContacts = new SqlCommand(deleteContactSQL, con);
            cmdContacts.Parameters.AddWithValue("@PubID ", pubID);

            //Delete Publisher
            string deletePubSQL = "DELETE FROM Publishers WHERE ID=@ID";
            SqlCommand cmdPublishers = new SqlCommand(deletePubSQL, con);
            cmdPublishers.Parameters.AddWithValue("@ID ", pubID);

            int deleted = 0;

            try
            {
                con.Open();
                reader = cmdSelectPublisher.ExecuteReader();

                while (reader.Read())
                {
                    pubName = reader["Name"].ToString();
                }
                reader.Close();

                deleted = cmdContacts.ExecuteNonQuery();
                deleted = deleted + cmdPubSecNames.ExecuteNonQuery();
                deleted = deleted + cmdPublishers.ExecuteNonQuery();

                MessageBox.Show("Publisher deleted!");
                lblResults.Text = lblResults.Text + "The publisher " + pubName + " has been deleted.";
                lblResults.Text = lblResults.Text + "<br />A total of " + deleted.ToString() + " record(s) were deleted.";
            }
            catch (Exception err)
            {
                MessageBox.Show("Publisher was not able to be deleted.");
                lblResults.Text = "Error deleting publisher: ";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
                this.pubIDTB.Text = "";                
            }
        }
    }
}