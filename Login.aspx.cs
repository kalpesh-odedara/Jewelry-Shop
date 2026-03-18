using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // Required for SQL
using System.Configuration;  // Required for Connection String

public partial class Login : System.Web.UI.Page
{
    // Update this with your actual connection string
    string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\admin\OneDrive\Pictures\Documents\y_project.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;";

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUserName.Text.Trim();
        string userid = txtUserID.Text.Trim(); // Still used for Session, but not DB
        string password = txtPassword.Text.Trim();

        if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
        {
            try
            {
                // Save to database (only Username and Password)
                SaveUserToDatabase(username, password);

                // Store in Session for the rest of the website
                Session["IsLoggedIn"] = true;
                Session["UserName"] = username;
                Session["UserID"] = userid; // Keeping this for your UI/Home page

                // Create persistent cookie for re-runs / server restarts
                HttpCookie loginCookie = new HttpCookie("UserLoginPersistence");
                loginCookie.Values["UserName"] = username;
                loginCookie.Values["UserID"] = userid;
                loginCookie.Expires = DateTime.Now.AddDays(30); // Valid for 30 days
                Response.Cookies.Add(loginCookie);

                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Database Error: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Username and Password are required!";
        }
    }

    private void SaveUserToDatabase(string name, string pwd)
    {
        using (SqlConnection conn = new SqlConnection(connString))
        {
            // Insert only Name and Password. The 'Id' and 'CreatedDate' are handled by SQL.
            string query = "INSERT INTO Users (UserName, Password) VALUES (@name, @pwd)";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@pwd", pwd);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}