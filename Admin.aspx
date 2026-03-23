 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Dashboard | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-gold: #c5a028;
            --gold-gradient: linear-gradient(135deg, #d4af37 0%, #f3e5ab 100%);
            --sidebar-bg: #111827;
            --sidebar-hover: #1f2937;
            --text-dark: #1f2937;
            --bg-color: #f3f4f6;
            --card-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            --sidebar-width: 260px;
        }

        body { font-family: 'Lato', sans-serif; margin: 0; background-color: var(--bg-color); display: flex; height: 100vh; overflow: hidden; }

        /* Sidebar Styling */
        .sidebar { width: var(--sidebar-width); background: var(--sidebar-bg); color: #e5e7eb; display: flex; flex-direction: column; padding: 2rem 1.5rem; }
        .sidebar h2 { color: var(--primary-gold); font-family: 'Playfair Display'; text-align: center; margin-bottom: 3rem; font-size: 1.75rem; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 1rem; }
        .nav-item { padding: 14px 18px; cursor: pointer; border-radius: 10px; margin-bottom: 0.75rem; display: flex; align-items: center; gap: 14px; color: #d1d5db; transition: 0.3s; }
        .nav-item:hover { background: var(--sidebar-hover); color: #fff; transform: translateX(5px); }
        .nav-item.active { background: var(--gold-gradient); color: #1a1a1a; font-weight: 700; }

        /* Main Layout */
        .main-content { flex: 1; padding: 2.5rem; overflow-y: auto; background: var(--bg-color); }
        .card { background: #fff; padding: 2rem; border-radius: 16px; box-shadow: var(--card-shadow); margin-bottom: 2rem; border:none; }
        .admin-grid { width: 100%; border-collapse: separate; border-spacing: 0; }
        .admin-grid th { background: #f9fafb; color: #6b7280; padding: 16px; text-align: left; font-weight: 600; text-transform: uppercase; font-size: 0.85rem; border-bottom: 1px solid #f3f4f6; }
        .admin-grid td { padding: 16px; text-align: left; border-bottom: 1px solid #f3f4f6; color: var(--text-dark); }
        
        .section-panel { display: none; }
        .section-panel.active { display: block; animation: fadeIn 0.4s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        /* Redesigned Offer Upload UI */
        .offer-upload-card { max-width: 700px; margin: 0 auto; padding: 0; overflow: hidden; }
        .offer-header { background: var(--sidebar-bg); padding: 2rem; text-align: center; color: white; }
        .offer-header i { font-size: 2rem; color: var(--primary-gold); margin-bottom: 0.5rem; }
        .offer-form-body { padding: 2.5rem; }
        .form-row { display: flex; gap: 20px; margin-bottom: 1.5rem; }
        .form-group { flex: 1; display: flex; flex-direction: column; }
        .form-group label { font-weight: 700; font-size: 0.85rem; color: #4b5563; margin-bottom: 8px; text-transform: uppercase; }
        .modern-input { border: 1.5px solid #e5e7eb; border-radius: 10px; padding: 12px; font-size: 1rem; width:100%; box-sizing:border-box; }
        .file-upload-wrapper { border: 2px dashed #d1d5db; border-radius: 12px; padding: 20px; text-align: center; cursor: pointer; transition: 0.3s; position: relative; }
        .file-upload-wrapper:hover { border-color: var(--primary-gold); background: #fffcf0; }
        .btn-publish { background: var(--gold-gradient); color: #1a1a1a; width: 100%; padding: 16px; border: none; border-radius: 12px; font-weight: 800; text-transform: uppercase; letter-spacing: 2px; cursor: pointer; margin-top: 1.5rem; box-shadow: 0 4px 15px rgba(197, 160, 40, 0.3); }

        /* Login UI */
        .login-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(135deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.4) 100%), url('images/gold (22).jpg'); background-size: cover; background-position: center; display: flex; align-items: center; justify-content: center; z-index: 2000; backdrop-filter: blur(5px); }
        .login-card { background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); padding: 3.5rem; border-radius: 24px; width: 100%; max-width: 400px; text-align: center; border: 1px solid rgba(255, 255, 255, 0.2); color: white; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlLogin" runat="server" CssClass="login-container">
            <div class="login-card">
                <h2 style="font-family:'Playfair Display'; color:var(--primary-gold)">Admin Portal</h2>
                <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="#fca5a5" style="display:block; margin-bottom:10px;"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="modern-input" placeholder="Username" style="margin-bottom:15px; background:rgba(255,255,255,0.1); color:white; border:none;"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="modern-input" placeholder="Password" TextMode="Password" style="margin-bottom:15px; background:rgba(255,255,255,0.1); color:white; border:none;"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn-publish" OnClick="btnLogin_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlDashboard" runat="server" Visible="false" style="display:flex; width:100%; height:100%;">
            <div class="sidebar">
                <h2>Shree Admin</h2>
                <div class="nav-item active" onclick="showSection('orderData', this)"><i class="fas fa-shopping-cart"></i> Order Data</div>
                <div class="nav-item" onclick="showSection('loginData', this)"><i class="fas fa-users"></i> Login Data</div>
                <div class="nav-item" onclick="showSection('contactData', this)"><i class="fas fa-envelope"></i> Contact Messages</div>
                <div class="nav-item" onclick="showSection('feedbackData', this)"><i class="fas fa-star"></i> Feedback Data</div>
                <div class="nav-item" onclick="showSection('goldData', this)"><i class="fas fa-coins"></i> GOLD</div>
                <div class="nav-item" onclick="showSection('silverData', this)"><i class="fas fa-ring"></i> SILVER</div>
                <div class="nav-item" onclick="showSection('diamondData', this)"><i class="fas fa-gem"></i> DIAMOND</div>
                <div class="nav-item" onclick="showSection('uploadOffer', this)"><i class="fas fa-upload"></i> Upload Offer</div>
                <div style="margin-top: auto;">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" style="background:none; border:1px solid #333; color:white; width:100%; padding:10px; cursor:pointer;" />
                </div>
            </div>

            <div class="main-content">
                <h1 id="pageTitle" style="font-family:'Playfair Display'">Customer Orders</h1>

                <div id="orderData" class="section-panel active">
                    <div class="card">
                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="ID" />
                                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="Amount (₹)" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="feedbackData" class="section-panel">
                    <div class="card">
                        <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                                <asp:BoundField DataField="Rating" HeaderText="Rating" />
                                <asp:BoundField DataField="FeedbackText" HeaderText="Feedback" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="loginData" class="section-panel">
                    <div class="card">
                        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="uploadOffer" class="section-panel">
                    <div class="card offer-upload-card">
                        <div class="offer-header">
                            <i class="fas fa-tags"></i>
                            <h3 style="font-family:'Playfair Display'">New Promotional Offer</h3>
                        </div>
                        <div class="offer-form-body">
                            <asp:Label ID="lblOfferMsg" runat="server" style="display:block; margin-bottom:15px; font-weight:bold;"></asp:Label>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <asp:TextBox ID="txtOfferProd" runat="server" CssClass="modern-input" placeholder="e.g. Wedding Necklace"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Offer Price</label>
                                    <asp:TextBox ID="txtOfferPrice" runat="server" CssClass="modern-input" placeholder="e.g. 50,000"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Product Image</label>
                                <div class="file-upload-wrapper">
                                    <i class="fas fa-cloud-upload-alt" style="font-size:1.5rem; color:var(--primary-gold)"></i><br />
                                    <asp:FileUpload ID="fuOfferImg" runat="server" />
                                </div>
                            </div>
                            <asp:Button ID="btnSubmitOffer" runat="server" Text="Publish Offer" CssClass="btn-publish" OnClick="btnSubmitOffer_Click" />
                        </div>
                    </div>
                </div>

                <div id="contactData" class="section-panel">
                    <div class="card">
                        <asp:GridView ID="gvContacts" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="FullName" HeaderText="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Message" HeaderText="Message" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="goldData" class="section-panel">
                    <div class="card">
                        <h3 style="font-family:'Playfair Display'; margin-bottom:1rem;">Gold Jewelry Inventory</h3>
                        <asp:GridView ID="gvGold" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                <asp:BoundField DataField="Price" HeaderText="Price" HtmlEncode="false" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="imgProd" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" Height="50px" style="object-fit:cover; border-radius:4px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="silverData" class="section-panel">
                    <div class="card">
                        <h3 style="font-family:'Playfair Display'; margin-bottom:1rem;">Silver Jewelry Inventory</h3>
                        <asp:GridView ID="gvSilver" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                <asp:BoundField DataField="Price" HeaderText="Price" HtmlEncode="false" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="imgSilver" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" Height="50px" style="object-fit:cover; border-radius:4px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="diamondData" class="section-panel">
                    <div class="card">
                        <h3 style="font-family:'Playfair Display'; margin-bottom:1rem;">Diamond Jewelry Inventory</h3>
                        <asp:GridView ID="gvDiamond" runat="server" AutoGenerateColumns="False" CssClass="admin-grid" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                <asp:BoundField DataField="Price" HeaderText="Price" HtmlEncode="false" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="imgDimond" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" Height="50px" style="object-fit:cover; border-radius:4px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
    <script>
        function showSection(sectionId, btn) {
            document.querySelectorAll('.section-panel').forEach(p => p.classList.remove('active'));
            document.getElementById(sectionId).classList.add('active');
            document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
            btn.classList.add('active');
            document.getElementById('pageTitle').innerText = btn.innerText;
        }
    </script>
</body>
</html>