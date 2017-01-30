using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings
{
    public partial class Users : System.Web.UI.Page
    {
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtID.ReadOnly = true;
            
            if (!this.IsPostBack)
            {
                FillUserList();
            }
        }

        private void FillUserList()
        {
            lstUser.Items.Clear();

            // Define the Select statement.
            // Three pieces of information are needed: the unique id,
            // and the first and last name.
            string selectSQL = "SELECT Name, ID FROM Users";

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
                lstUser.Items.Add(dummyItem);

                while (reader.Read())
                {
                    ListItem newItem = new ListItem();
                    newItem.Text = reader["Name"].ToString();
                    newItem.Value = reader["ID"].ToString();
                    lstUser.Items.Add(newItem);
                }
                reader.Close();
            }
            catch (Exception err)
            {
                lblResults.Text = "Error reading list of users.";
                lblResults.Text += err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void lstAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Define ADO.NET objects.
            string selectSQL;
            selectSQL = "SELECT * FROM Users ";
            selectSQL += "WHERE ID='" + lstUser.SelectedItem.Value + "'";
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
                txtUsername.Text = reader["Username"].ToString();
                txtPassword.Text = reader["Password"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                reader.Close();
                lblResults.Text = "";
            }
            catch (Exception err)
            {
                lblResults.Text = "Error getting user. ";
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
            this.txtID.ReadOnly = true;
            this.cmdInsert.Visible = true;

            txtName.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";

            lblResults.Text = "Click Insert New to add the completed record.";
        }

        protected void cmdInsert_Click(object sender, EventArgs e)
        {
            this.txtID.ReadOnly = true;            
            
            // Perform user-defined checks.
            if (txtName.Text == "" || txtUsername.Text == "" || txtPassword.Text == "" || txtEmail.Text == "")
            {
                lblResults.Text = "All fields are required";
                return;
            }

            // Define ADO.NET objects.
            string insertSQL;
            insertSQL = "INSERT INTO Users (";
            insertSQL += "Name, Username, ";
            insertSQL += "Password, Email) ";
            insertSQL += "VALUES (";
            insertSQL += "@Name, @Username, ";
            insertSQL += "@Password, @Email)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            // Add the parameters.
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

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
            this.txtID.ReadOnly = true;
            
            // Define ADO.NET objects.
            string updateSQL;
            updateSQL = "UPDATE Users SET ";
            updateSQL += "Name=@Name, Username=@Username, ";
            updateSQL += "Password=@Password, Email=@Email ";
            updateSQL += "WHERE ID=@ID_original";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(updateSQL, con);

            // Add the parameters.        
            cmd.Parameters.AddWithValue("@ID", txtID.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@ID_original", lstUser.SelectedItem.Value);

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
                lblResults.Text = "Error updating user. ";
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
            // Define ADO.NET objects.
            string deleteSQL;
            deleteSQL = "DELETE FROM Users ";
            deleteSQL += "WHERE ID=@ID";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(deleteSQL, con);
            cmd.Parameters.AddWithValue("@ID ", lstUser.SelectedItem.Value);

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
                lblResults.Text = "Error deleting user. ";
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