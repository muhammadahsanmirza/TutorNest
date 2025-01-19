using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace TutorNest
{
    public partial class Contact : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void ClearContactForm()
        {
            NameTextBox.Text= string.Empty;
            MailTextBox.Text= string.Empty;
            SubjectDropDownList.ClearSelection();
            MessageTextBox.Text= string.Empty;

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sp = "sp_insert_tbl_contact";
                    using (SqlCommand cmd = new SqlCommand(sp, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@name", NameTextBox.Text); // Use .Text to get the value
                        cmd.Parameters.AddWithValue("@email", MailTextBox.Text); // Use .Text to get the value
                        cmd.Parameters.AddWithValue("@subject", SubjectDropDownList.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@message", MessageTextBox.Text); // Use .Text to get the value

                        con.Open();
                        int rowEffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowEffected > 0)
                        {
                            // Use ScriptManager to register the script for partial postback
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successSubmission();", true);
                            ClearContactForm();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errorSubmission();", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }

        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            ClearContactForm();
        }
    }
}