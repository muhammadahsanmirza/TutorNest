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
            string name = (GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string email = (GridView1.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text;
            string phone = (GridView1.Rows[e.RowIndex].FindControl("txtPhone") as TextBox).Text;
            string subject = (GridView1.Rows[e.RowIndex].FindControl("txtSubject") as TextBox).Text;
            string message = (GridView1.Rows[e.RowIndex].FindControl("txtMessage") as TextBox).Text;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE tbl_contact SET name=@name, email=@email, phone=@phone, subject=@subject, message=@message WHERE id=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@subject", subject);
                    cmd.Parameters.AddWithValue("@message", message);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            BindGridView();
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