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
        Response.ContentEncoding = System.Text.Encoding.UTF8;
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

        // 5. Gold Jewelry
        DataTable dtGold = new DataTable();
        dtGold.Columns.Add("ProductName"); dtGold.Columns.Add("Price"); dtGold.Columns.Add("Category"); dtGold.Columns.Add("ImagePath");
        dtGold.Rows.Add("Antique Temple Kada", "\u20B9 1,85,000", "Bangles", "images/gold (2).jpg");
        dtGold.Rows.Add("Filigree Gold Bangles", "\u20B9 95,000", "Bangles", "images/gold (5).jpg");
        dtGold.Rows.Add("Bridal Wedding Set", "\u20B9 3,20,000", "Bangles", "images/gold (16).jpg");
        dtGold.Rows.Add("Daily Wear Gold Pipe", "\u20B9 45,000", "Bangles", "images/gold (22).jpg");
        dtGold.Rows.Add("Meenakari Floral Bangles", "\u20B9 1,15,000", "Bangles", "images/gold (28).jpg");
        dtGold.Rows.Add("Solid 24K Gold Valayal", "\u20B9 2,10,000", "Bangles", "images/gold (32).jpg");
        dtGold.Rows.Add("Solitaire Gold Ring", "\u20B9 25,000", "Rings", "images/gold (6).jpg");
        dtGold.Rows.Add("Traditional Vanki Ring", "\u20B9 18,000", "Rings", "images/gold (10).jpg");
        dtGold.Rows.Add("Floral Statement Ring", "\u20B9 42,000", "Rings", "images/gold (18).jpg");
        dtGold.Rows.Add("Classic Engagement Band", "\u20B9 35,000", "Rings", "images/gold (24).jpg");
        dtGold.Rows.Add("Ruby Studded Gold Ring", "\u20B9 55,000", "Rings", "images/gold (30).jpg");
        dtGold.Rows.Add("Modern Geometric Ring", "\u20B9 22,000", "Rings", "images/gold (12).jpg");
        dtGold.Rows.Add("Maharani Choker Set", "\u20B9 4,50,000", "Necklaces", "images/gold (1).jpg");
        dtGold.Rows.Add("Temple Lakshmi Haar", "\u20B9 2,80,000", "Necklaces", "images/gold (3).jpg");
        dtGold.Rows.Add("Antique Kundan Mala", "\u20B9 3,10,000", "Necklaces", "images/gold (15).jpg");
        dtGold.Rows.Add("Modern Link Necklace", "\u20B9 1,20,000", "Necklaces", "images/gold (21).jpg");
        dtGold.Rows.Add("Lightweight Daily Chain", "\u20B9 65,000", "Necklaces", "images/gold (27).jpg");
        dtGold.Rows.Add("Royal Gold Guttapusalu", "\u20B9 5,40,000", "Necklaces", "images/gold (13).jpg");
        dtGold.Rows.Add("Antique Jhumka Drops", "\u20B9 85,000", "Earrings", "images/gold (4).jpg");
        dtGold.Rows.Add("Modern Gold Hoops", "\u20B9 32,000", "Earrings", "images/gold (7).jpg");
        dtGold.Rows.Add("Bridal Chandbalis", "\u20B9 1,45,000", "Earrings", "images/gold (14).jpg");
        dtGold.Rows.Add("Daily Wear Studs", "\u20B9 12,000", "Earrings", "images/gold (17).jpg");
        dtGold.Rows.Add("Traditional Ear Chains", "\u20B9 58,000", "Earrings", "images/gold (23).jpg");
        dtGold.Rows.Add("Long Leafy Drops", "\u20B9 48,000", "Earrings", "images/gold (29).jpg");
        gvGold.DataSource = dtGold; gvGold.DataBind();

        // 6. Silver Jewelry
        DataTable dtSilver = new DataTable();
        dtSilver.Columns.Add("ProductName"); dtSilver.Columns.Add("Price"); dtSilver.Columns.Add("Category"); dtSilver.Columns.Add("ImagePath");
        dtSilver.Rows.Add("Traditional Wedding Payal", "\u20B9 15,000", "Anklets", "images/silver (1).jpg");
        dtSilver.Rows.Add("Men's Sterling Chain", "\u20B9 8,500", "Chains", "images/silver (2).jpg");
        dtSilver.Rows.Add("Gemstone Silver Ring", "\u20B9 3,200", "Rings", "images/silver (3).jpg");
        dtSilver.Rows.Add("Oxidized Jhumkas", "\u20B9 2,800", "Earrings", "images/silver (4).jpg");
        dtSilver.Rows.Add("Charm Bracelet", "\u20B9 4,500", "Bracelets", "images/silver (5).jpg");
        dtSilver.Rows.Add("Silver Pooja Thali Set", "\u20B9 25,000", "Utensils", "images/silver (7).jpg");
        dtSilver.Rows.Add("Designer Anklet", "\u20B9 6,500", "Anklets", "images/silver (8).jpg");
        dtSilver.Rows.Add("Silver Studs", "\u20B9 2,500", "Earrings", "images/silver (18).jpg");
        dtSilver.Rows.Add("Silver Collection Item 9", "\u20B9 PA", "Chains", "images/silver (9).jpg");
        dtSilver.Rows.Add("Silver Collection Item 10", "\u20B9 PA", "Rings", "images/silver (10).jpg");
        dtSilver.Rows.Add("Silver Collection Item 11", "\u20B9 PA", "Earrings", "images/silver (11).jpg");
        dtSilver.Rows.Add("Silver Collection Item 12", "\u20B9 PA", "Bracelets", "images/silver (12).jpg");
        dtSilver.Rows.Add("Silver Collection Item 13", "\u20B9 PA", "Utensils", "images/silver (13).jpg");
        dtSilver.Rows.Add("Silver Collection Item 14", "\u20B9 PA", "Anklets", "images/silver (14).jpg");
        dtSilver.Rows.Add("Silver Collection Item 15", "\u20B9 PA", "Chains", "images/silver (15).jpg");
        dtSilver.Rows.Add("Silver Collection Item 16", "\u20B9 PA", "Rings", "images/silver (16).jpg");
        dtSilver.Rows.Add("Silver Collection Item 17", "\u20B9 PA", "Earrings", "images/silver (17).jpg");
        dtSilver.Rows.Add("Silver Collection Item 19", "\u20B9 PA", "Bracelets", "images/silver (19).jpg");
        gvSilver.DataSource = dtSilver; gvSilver.DataBind();

        // 7. Diamond Jewelry
        DataTable dtDimond = new DataTable();
        dtDimond.Columns.Add("ProductName"); dtDimond.Columns.Add("Price"); dtDimond.Columns.Add("Category"); dtDimond.Columns.Add("ImagePath");
        dtDimond.Rows.Add("Classic Solitaire Ring", "\u20B9 45,000", "Rings", "images/dimond (1).jpg");
        dtDimond.Rows.Add("Floral Diamond Necklace", "\u20B9 1,25,000", "Necklaces", "images/dimond (2).jpg");
        dtDimond.Rows.Add("Princess Cut Studs", "\u20B9 35,000", "Earrings", "images/dimond (3).jpg");
        dtDimond.Rows.Add("Elegant Tennis Bracelet", "\u20B9 75,000", "Bracelets", "images/dimond (4).jpg");
        dtDimond.Rows.Add("Heart Shaped Pendant", "\u20B9 22,000", "Pendants", "images/dimond (5).jpg");
        dtDimond.Rows.Add("Infinity Diamond Ring", "\u20B9 55,000", "Rings", "images/dimond (7).jpg");
        dtDimond.Rows.Add("Bridal Set", "\u20B9 2,55,000", "Necklaces", "images/dimond (8).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 6", "\u20B9 PA", "Rings", "images/dimond (6).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 9", "\u20B9 PA", "Necklaces", "images/dimond (9).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 10", "\u20B9 PA", "Earrings", "images/dimond (10).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 11", "\u20B9 PA", "Bracelets", "images/dimond (11).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 12", "\u20B9 PA", "Pendants", "images/dimond (12).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 13", "\u20B9 PA", "Rings", "images/dimond (13).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 14", "\u20B9 PA", "Necklaces", "images/dimond (14).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 15", "\u20B9 PA", "Earrings", "images/dimond (15).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 16", "\u20B9 PA", "Bracelets", "images/dimond (16).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 17", "\u20B9 PA", "Pendants", "images/dimond (17).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 18", "\u20B9 PA", "Rings", "images/dimond (18).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 19", "\u20B9 PA", "Necklaces", "images/dimond (19).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 20", "\u20B9 PA", "Earrings", "images/dimond (20).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 21", "\u20B9 PA", "Bracelets", "images/dimond (21).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 22", "\u20B9 PA", "Pendants", "images/dimond (22).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 23", "\u20B9 PA", "Rings", "images/dimond (23).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 24", "\u20B9 PA", "Necklaces", "images/dimond (24).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 25", "\u20B9 PA", "Earrings", "images/dimond (25).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 26", "\u20B9 PA", "Bracelets", "images/dimond (26).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 27", "\u20B9 PA", "Pendants", "images/dimond (27).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 28", "\u20B9 PA", "Rings", "images/dimond (28).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 29", "\u20B9 PA", "Necklaces", "images/dimond (29).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 31", "\u20B9 PA", "Bracelets", "images/dimond (31).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 32", "\u20B9 PA", "Pendants", "images/dimond (32).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 33", "\u20B9 PA", "Rings", "images/dimond (33).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 34", "\u20B9 PA", "Necklaces", "images/dimond (34).jpg");
        dtDimond.Rows.Add("Diamond Collection Item 35", "\u20B9 PA", "Earrings", "images/dimond (35).jpg");
        gvDiamond.DataSource = dtDimond; gvDiamond.DataBind();
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