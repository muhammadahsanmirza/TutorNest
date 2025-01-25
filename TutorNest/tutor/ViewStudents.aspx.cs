using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace TutorNest.tutor
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudents();
            }
        }

        private void BindStudents(string searchText = null)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("sp_select_all_tbl_students", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SearchText", (object)searchText ?? DBNull.Value);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind data to Repeater
                    rptStudents.DataSource = dt;
                    rptStudents.DataBind();

                    // Show SweetAlert if no records are found
                    if (dt.Rows.Count == 0 && !string.IsNullOrEmpty(searchText))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "showAlert('No students found matching your search criteria.');", true);
                        rptStudents.DataSource = null;
                        rptStudents.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            BindStudents(searchText);

            // Check if no records are found
            if (rptStudents.Items.Count == 0 && !string.IsNullOrEmpty(searchText))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "showAlert('No students found matching your search criteria.');", true);
            }
        }
    }
}