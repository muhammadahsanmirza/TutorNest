using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace TutorNest.student
{
    public partial class ViewTutors : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTutors();
            }
        }

        private void BindTutors(string searchText = null)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("sp_select_all_tbl_tutors", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SearchText", (object)searchText ?? DBNull.Value);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind data to Repeater
                    rptTutors.DataSource = dt;
                    rptTutors.DataBind();

                    // Show SweetAlert if no records are found
                    if (dt.Rows.Count == 0 && !string.IsNullOrEmpty(searchText))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "showAlert('No tutors found matching your search criteria.');", true);
                        rptTutors.DataSource = null;
                        rptTutors.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            BindTutors(searchText);

            // Check if no records are found
            if (rptTutors.Items.Count == 0 && !string.IsNullOrEmpty(searchText))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "showAlert('No tutors found matching your search criteria.');", true);
            }
        }
    }
}