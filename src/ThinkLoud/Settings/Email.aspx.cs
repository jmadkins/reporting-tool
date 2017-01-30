using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings
{
    public partial class Email : System.Web.UI.Page
    {
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FillUserList();
            }

            txtID.ReadOnly = true;
        }

        private void FillUserList()
        {
            lstTemplates.Items.Clear();

            // Define the Select statement.
            // Three pieces of information are needed: the unique id,
            // and the first and last name.
            string selectSQL = "SELECT Name, ID FROM Templates";

            // Define the ADO.NET objects.
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader;

            // Try to open database and read information.
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();

                // For each item, add the author name to the displayed
                // list box text, and store the unique ID in the Value property.

                //Add blank item
                ListItem dummyItem = new ListItem();
                dummyItem.Text = "---";
                dummyItem.Value = "0";
                lstTemplates.Items.Add(dummyItem);

                while (reader.Read())
                {
                    ListItem newItem = new ListItem();
                    newItem.Text = reader["Name"].ToString();
                    newItem.Value = reader["ID"].ToString();
                    lstTemplates.Items.Add(newItem);
                }
                reader.Close();
            }
            catch (Exception err)
            {
                lblResults.Text = "Error reading list of templates.";
                lblResults.Text += err.Message;
            }
            finally
            {
                txtID.ReadOnly = true;
            }
        }

        protected void lstAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Define ADO.NET objects.
            string selectSQL;
            selectSQL = "SELECT * FROM Templates ";
            selectSQL += "WHERE ID='" + lstTemplates.SelectedItem.Value + "'";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader;

            // Try to open database and read information.
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                reader.Read();

                // Fill the controls.
                txtID.Text = reader["ID"].ToString();
                txtName.Text = reader["Name"].ToString();
                txtText.Text = reader["Text"].ToString();
                reader.Close();
                lblResults.Text = "";
            }
            catch (Exception err)
            {
                lblResults.Text = "Error getting template. ";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
            }

        }
        protected void cmdNew_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtID.ReadOnly = true;
            txtName.Text = "";
            txtText.Text = "";
            this.cmdInsert.Visible = true;

            lblResults.Text = "Click Insert New to add the completed record.";


        }
        protected void cmdInsert_Click(object sender, EventArgs e)
        {
            // Perform user-defined checks.
            if (txtName.Text == "" )
            {
                lblResults.Text = "All fields are required";
                return;
            }

            // Define ADO.NET objects.
            string insertSQL;
            //insertSQL = "SET IDENTITY_INSERT Templates ON ";
            insertSQL = "INSERT INTO Templates (";
            insertSQL += "Name, Text) ";
            insertSQL += "VALUES (";
            insertSQL += "@Name, @Text) ";            

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            // Add the parameters.
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Text", txtText.Text);

            // Try to open the database and execute the update.
            int added = 0;
            try
            {
                con.Open();
                added = cmd.ExecuteNonQuery();
                lblResults.Text = added.ToString() + " record inserted.";
            }
            catch (Exception err)
            {
                lblResults.Text = "Error inserting record. ";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
                this.cmdInsert.Visible = false;
            }

            // If the insert succeeded, refresh the author list.
            if (added > 0)
            {
                FillUserList();
                this.cmdInsert.Visible = false;
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            txtID.ReadOnly = true;
            
            // Define ADO.NET objects.
            string updateSQL;
            updateSQL = "UPDATE Templates SET ";
            updateSQL += "Name=@Name, Text=@Text ";
            updateSQL += "WHERE ID=@ID_original";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(updateSQL, con);

            // Add the parameters.        
            cmd.Parameters.AddWithValue("@ID", txtID.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Text", txtText.Text);
            cmd.Parameters.AddWithValue("@ID_original", lstTemplates.SelectedItem.Value);

            // Try to open database and execute the update.
            int updated = 0;
            try
            {
                con.Open();
                updated = cmd.ExecuteNonQuery();
                lblResults.Text = updated.ToString() + " record updated.";
            }
            catch (Exception err)
            {
                lblResults.Text = "Error updating template. ";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
            }

            // If the updated succeeded, refresh the author list.
            if (updated > 0)
            {
                FillUserList();
            }

        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            txtID.ReadOnly = true;
            
            // Define ADO.NET objects.
            string deleteSQL;
            deleteSQL = "DELETE FROM Templates ";
            deleteSQL += "WHERE ID=@ID";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(deleteSQL, con);
            cmd.Parameters.AddWithValue("@ID ", lstTemplates.SelectedItem.Value);

            // Try to open the database and delete the record.
            int deleted = 0;
            try
            {
                con.Open();
                deleted = cmd.ExecuteNonQuery();
                lblResults.Text = "Record deleted.";
            }
            catch (Exception err)
            {
                lblResults.Text = "Error deleting template. ";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
            }

            // If the delete succeeded, refresh the author list.
            if (deleted > 0)
            {
                FillUserList();
            }

        }
    }
}