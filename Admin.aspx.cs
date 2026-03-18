using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin : System.Web.UI.Page
{
    string connStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\admin\OneDrive\Pictures\Documents\y_project.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminUser"] != null) { ShowDashboard(); LoadAllData(); }
            else { ShowLogin(); }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text.Trim() == "gsd@gsd" && txtPassword.Text.Trim() == "12345")
        {
            Session["AdminUser"] = txtUsername.Text.Trim();
            ShowDashboard(); LoadAllData();
        }
        else { lblError.Text = "Invalid login."; lblError.Visible = true; }
    }

    private void LoadAllData()
    {
        // 1. Order Data (Fixed Table Name)
        BindGrid("SELECT OrderID, CustomerName, ProductName, TotalAmount, OrderDate, Address FROM [Order] ORDER BY OrderDate DESC", gvOrders);

        // 2. Feedback Data
        BindGrid("SELECT CustomerName, Rating, FeedbackText FROM ServiceFeedback", gvFeedback);

        // 3. User Login Data
        BindGrid("SELECT UserName, Password FROM Users", gvUsers);

        // 4. Contact Inquiries
        BindGrid("SELECT FullName, Email, Message FROM ContactInquiries", gvContacts);
    }

    private void BindGrid(string query, GridView gv)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gv.DataSource = dt;
                gv.DataBind();
            }
        }
        catch (Exception ex)
        {
            // Diagnostic Alert to catch missing tables
            Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
        }
    }

    protected void btnSubmitOffer_Click(object sender, EventArgs e)
    {
        if (fuOfferImg.HasFile)
        {
            try
            {
                string fileName = Path.GetFileName(fuOfferImg.FileName);
                fuOfferImg.SaveAs(Server.MapPath("~/images/") + fileName);
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO ProductOffers (ProductName, Price, ImagePath) VALUES (@name, @price, @path)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@name", txtOfferProd.Text);
                    cmd.Parameters.AddWithValue("@price", txtOfferPrice.Text);
                    cmd.Parameters.AddWithValue("@path", "images/" + fileName);
                    con.Open(); cmd.ExecuteNonQuery();
                }
                lblOfferMsg.ForeColor = System.Drawing.Color.Green;
                lblOfferMsg.Text = "Offer Published Successfully!";
                txtOfferProd.Text = txtOfferPrice.Text = "";
            }
            catch (Exception ex) { lblOfferMsg.ForeColor = System.Drawing.Color.Red; lblOfferMsg.Text = "Error: " + ex.Message; }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e) { Session.Abandon(); ShowLogin(); }
    private void ShowDashboard() { pnlLogin.Visible = false; pnlDashboard.Visible = true; }
    private void ShowLogin() { pnlLogin.Visible = true; pnlDashboard.Visible = false; }
}