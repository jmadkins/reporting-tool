﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkLoud.Settings.Create
{
    public partial class Contact : System.Web.UI.Page
    {
        public string publisherIDBefore;
        public int publisherID;
        private string connectionString =
  WebConfigurationManager.ConnectionStrings["ThinkLoud"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            publisherIDBefore = Request.QueryString["pubID"];
            publisherID = Convert.ToInt32(publisherIDBefore);
        }

        private void ClearForm()
        {
            this.txtName.Text = "";
            this.txtEmail.Text = "";
            this.txtNotes.Text = "";
            this.txtPhone.Text = "";
        }
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            publisherID = Convert.ToInt32(publisherIDBefore);
            
            // Perform user-defined checks.
            if (txtName.Text == "" || txtEmail.Text == "")
            {
                lblResults.Text = "Contact name and email is required!";
                return;
            }

            // Define ADO.NET objects.
            string insertSQL;
            insertSQL = "INSERT INTO Contacts (";
            insertSQL += "Name, Email, ";
            insertSQL += "Notes, PubID, Phone) ";
            insertSQL += "VALUES (";
            insertSQL += "@Name, @Email, ";
            insertSQL += "@Notes, @PubID, @Phone)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            // Add the parameters.
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
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
                lblResults.Text = "Error inserting record.";
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
            string url = "/Publishers.aspx?";
            url += "pubID=" + this.publisherID;

            Response.Redirect(url);
        }
    }
}