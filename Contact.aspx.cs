using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Drawing;

public partial class Contact : System.Web.UI.Page
{
    // DATABASE CONNECTION STRING
    string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\admin\OneDrive\Pictures\Documents\y_project.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string subject = txtSubject.Text.Trim();
        string message = txtMessage.Text.Trim();

        if (name != "" && email != "" && message != "")
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "INSERT INTO ContactInquiries (FullName, Email, Subject, Message) VALUES (@name, @email, @sub, @msg)";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@sub", subject);
                    cmd.Parameters.AddWithValue("@msg", message);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                // Success Feedback
                lblStatus.Text = "Thank you! Your message has been sent successfully.";
                lblStatus.ForeColor = Color.Green;

                // Clear fields
                txtName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
                lblStatus.ForeColor = Color.Red;
            }
        }
        else
        {
            lblStatus.Text = "Please fill in all required fields.";
            lblStatus.ForeColor = Color.Red;
        }
    }
}