using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace TutorNest.admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "SELECT * FROM tbl_admin WHERE username=@username AND password=@password";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);

                        con.Open();
                        SqlDataReader dr =  cmd.ExecuteReader();

                        if (dr.HasRows == true)
                        {
                            //Response.Write("<script>alert('Login Successfull')</script>");
                            Session["admin_username"] = username;
                            Response.Redirect("AdminHomeScreen.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Login Failed')</script>");
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errorSubmission();", true);
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
            
        }
    }
}