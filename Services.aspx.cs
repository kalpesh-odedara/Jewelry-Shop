using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Drawing;

public partial class Services : System.Web.UI.Page
{
    // Update with your actual server and database name
    string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\admin\OneDrive\Pictures\Documents\y_project.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string service = ddlService.SelectedValue;
        string rating = ddlRating.SelectedValue;
        string feedbackText = txtFeedback.Text.Trim();

        // Check if required fields are filled
        if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(service) && !string.IsNullOrEmpty(feedbackText))
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "INSERT INTO ServiceFeedback (CustomerName, ServiceName, Rating, FeedbackText) VALUES (@name, @service, @rating, @text)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@service", service);
                    cmd.Parameters.AddWithValue("@rating", rating);
                    cmd.Parameters.AddWithValue("@text", feedbackText);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                // UI Success state
                lblStatus.Text = "Thank you! Your feedback has been submitted successfully.";
                lblStatus.ForeColor = Color.Green;

                // Reset fields
                txtName.Text = "";
                txtFeedback.Text = "";
                ddlService.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Database Error: " + ex.Message;
                lblStatus.ForeColor = Color.Red;
            }
        }
        else
        {
            lblStatus.Text = "Please fill in all the details!";
            lblStatus.ForeColor = Color.Red;
        }
    }
}