using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
namespace TutorNest
{
    public partial class StudentSignup : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["tbdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountries();
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

        private void ResetControls()
        {
            txtName.Text = string.Empty;
            txtFatherName.Text = string.Empty;
            txtSurname.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtStandard.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;

            ddlGender.SelectedIndex = 0;
            ddlGoingTo.SelectedIndex = 0;
            ddlTuitionType.SelectedIndex = 0;
            ddlTutorPreferred.SelectedIndex = 0;
            ddlCountry.SelectedIndex = 0;
            ddlCity.Items.Clear();
            ddlCity.Items.Insert(0, new ListItem("Select City", ""));
        }


        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string hashedPassword = HashPassword(txtPassword.Text);
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("[sp_insert_tbl_students]", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                        cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                        cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                        cmd.Parameters.AddWithValue("@Age", int.Parse(txtAge.Text));
                        cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.Text); // Use dropdown value
                        cmd.Parameters.AddWithValue("@City", ddlCity.SelectedItem.Text); // Use dropdown value
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@Standard", txtStandard.Text);
                        cmd.Parameters.AddWithValue("@GoingTo", ddlGoingTo.SelectedValue);
                        cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                        cmd.Parameters.AddWithValue("@TutionType", ddlTuitionType.SelectedValue);
                        cmd.Parameters.AddWithValue("@TutorPreferred", ddlTutorPreferred.SelectedValue);
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        con.Open();
                        int rowAffected = cmd.ExecuteNonQuery();
                        if (rowAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "Swal.fire({title: 'Success!', text: 'Registration Successful!', icon: 'success'});", true);
                            ResetControls();
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