using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace TutorNest
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            try
            {
                // Hash the password entered by the user
                string hashedPassword = HashPassword(password);

                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_select_one_tbl_students", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);

                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            Session["student_username"] = username;
                            Response.Redirect("student/StudentHomeScreen.aspx"); 
                        }
                        else
                        {
                            // Login failed
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "Swal.fire({title: 'Login Failed!', text: 'Invalid username or password.', icon: 'error'});", true);
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }

        }
    }
}