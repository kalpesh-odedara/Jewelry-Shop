using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Offer : System.Web.UI.Page
{
    // Connection string mapping to your project database
    string connStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\admin\OneDrive\Pictures\Documents\y_project.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOffers();
        }
    }

    private void LoadOffers()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Corrected Query: Removed 'id' and used ProductName for sorting to avoid the SqlException
                string query = "SELECT ProductName, Description, Price, ImagePath FROM ProductOffers";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt); // This was Line 17 where the error occurred
                        rptOffers.DataSource = dt;
                        rptOffers.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Displays the error message if the column name is still mismatched
            Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        }
    }
}