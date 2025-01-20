using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TutorNest
{
    public partial class TutorSignup : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountries();
            }
        }

        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        private void BindCountries()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("sp_select_tbl_countries", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCountry.DataSource = reader;
                    ddlCountry.DataTextField = "name";
                    ddlCountry.DataValueField = "id";
                    ddlCountry.DataBind();
                    ddlCountry.Items.Insert(0, new ListItem("Select Country", ""));
                }
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int countryId;
            if (int.TryParse(ddlCountry.SelectedValue, out countryId))
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_select_tbl_cities", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@countryId", countryId);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        ddlCity.DataSource = reader;
                        ddlCity.DataTextField = "name";
                        ddlCity.DataValueField = "id";
                        ddlCity.DataBind();
                        ddlCity.Items.Insert(0, new ListItem("Select City", ""));
                    }
                }
            }
            else
            {
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("Select City", ""));
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string hashedPassword = HashPassword(txtPassword.Text);
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_insert_tbl_tutors", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@name", txtName.Text);
                        cmd.Parameters.AddWithValue("@surname", txtSurname.Text);
                        cmd.Parameters.AddWithValue("@age", int.Parse(txtAge.Text));
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@marital_status", ddlMaritalStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@city", ddlCity.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@qualification", ddlQualification.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@degree", txtDegree.Text);
                        cmd.Parameters.AddWithValue("@experience", int.Parse(txtExperience.Text));
                        cmd.Parameters.AddWithValue("@contact_no", txtContactNo.Text);
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);

                        con.Open();
                        int rowAffected = cmd.ExecuteNonQuery();
                        if (rowAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "Swal.fire({title: 'Success!', text: 'Registration Successful!', icon: 'success'});", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration failed. Please try again.');", true);
                        }
                        con.Close();
                    }
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // SQL Server error code for unique constraint violation
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username is already taken. Please choose a different username.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }
    }
}