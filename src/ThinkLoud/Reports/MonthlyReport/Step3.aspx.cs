using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Net.Http;

namespace ThinkLoud.MonthlyReport
{
    public partial class Step3 : System.Web.UI.Page
    {
        public string publisherName;
        public string publisherIDBefore;
        public int publisherID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            publisherIDBefore = Request.QueryString["pubID"];
        }

        protected void cmdBegin_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
                try
                {
                    FileUpload1.SaveAs("C:\\Uploads\\" +
                         FileUpload1.FileName);                    

                    publisherID = Convert.ToInt32(publisherIDBefore);

                    string url = "/Reports/MonthlyReport/Step4.aspx?";
                    url += "pubID=" + publisherID;

                    Response.Redirect(url);
                }
                catch (Exception ex)
                {
                    lblResults.Text = "ERROR: " + ex.Message.ToString();
                }
            else
            {
                lblResults.Text = "You have not specified a file.";
            }
            
            
            
            
            
        }

        public class FileDetails
        {
            public string Name { get; set; }
            public long Size { get; set; }
            public string ContentType { get; set; }
            public string Location { get; set; }
        }
    }
}