using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TutorNest.admin
{
    public partial class ViewContact : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        // Bind data to GridView
        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("sp_select_all_tbl_contact", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        // Pagination
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        // Sorting
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = GridView1.DataSource as DataTable;
            if (dt != null)
            {
                dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private string GetSortDirection(string column)
        {
            string sortDirection = "ASC";
            string lastSortExpression = ViewState["SortExpression"] as string;
            if (lastSortExpression != null && lastSortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if (lastDirection == "ASC")
                    sortDirection = "DESC";
            }
            ViewState["SortExpression"] = column;
            ViewState["SortDirection"] = sortDirection;
            return sortDirection;
        }

        // Edit
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        // Update
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            // Find the controls in the GridView row
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmail");
            DropDownList ddlSubject = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlSubject"); // Correctly find the DropDownList
            TextBox txtMessage = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMessage");

            if (txtName != null && txtEmail != null && ddlSubject != null && txtMessage != null)
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                string subject = ddlSubject.SelectedValue; // Get selected value from DropDownList
                string message = txtMessage.Text;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE tbl_contact SET name=@name, emil=@email, subject=@subject, message=@message WHERE id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@subject", subject);
                        cmd.Parameters.AddWithValue("@message", message);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                GridView1.EditIndex = -1; // Exit edit mode
                BindGridView(); // Rebind data to reflect changes
            }
            else
            {
                // Handle the case where controls are not found
                throw new Exception("One or more controls could not be found.");
            }
        }

        // Cancel Edit
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        // Delete
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_contact WHERE id=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            BindGridView();
        }
    }
}