 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Our Services | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* Reusing Core Styles */
        :root {
            --primary-gold: #D4AF37;
            --secondary-maroon: #800000;
            --text-dark: #333;
            --light-bg: #f9f9f9;
        }

        body {
            font-family: 'Lato', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-dark);
            background-color: #fff;
            line-height: 1.6;
        }

        h1, h2, h3, h4 {
            font-family: 'Playfair Display', serif;
            color: var(--secondary-maroon);
        }

        a { text-decoration: none; color: inherit; transition: 0.3s; }
        ul { list-style: none; padding: 0; }
        
        /* Header */
        header {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            z-index: 1000;
            top: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            max-width: 1300px;
            margin: auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-gold);
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .nav-links a {
            font-weight: 700;
            font-size: 0.9rem;
            text-transform: uppercase;
            padding: 5px 0;
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--primary-gold);
            transition: width 0.3s;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .nav-links a:hover {
            color: var(--primary-gold);
        }

        /* Page Hero */
        .page-hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/hero_banner.png');
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            margin-top: 60px;
        }

        .page-hero h1 {
            font-size: 3.5rem;
            color: var(--primary-gold);
            margin-bottom: 0.5rem;
        }

        /* Services Grid */
        .section {
            padding: 5rem 5%;
            max-width: 1200px;
            margin: auto;
        }
        
        .text-center { text-align: center; }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .service-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            transition: 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--primary-gold);
        }

        .service-img {
            height: 200px;
            background: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #aaa;
        }
        
        .service-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .service-content {
            padding: 2rem;
            text-align: center;
        }

        .service-content h3 {
            font-size: 1.4rem;
            margin-bottom: 1rem;
        }

        .service-icon {
            font-size: 2.5rem;
            color: var(--primary-gold);
            margin-bottom: 1rem;
            display: block;
        }

        /* Feedback Form */
        .feedback-section {
            background: var(--light-bg);
            padding: 5rem 5%;
        }

        .form-container {
            background: #fff;
            padding: 3rem;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: inherit;
            font-size: 1rem;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-gold);
        }

        .btn-submit {
            background: var(--primary-gold);
            color: #fff;
            border: none;
            padding: 12px 30px;
            font-size: 1rem;
            font-weight: 700;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: 0.3s;
        }
        
        .btn-submit:hover {
            background: #b59020;
        }

        /* Recent Feedback Display */
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .testimonial-card {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            border-left: 5px solid var(--primary-gold);
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .stars {
            color: #FFD700;
            margin-bottom: 1rem;
        }

        .user-meta {
            margin-top: 1.5rem;
            font-weight: 700;
            color: var(--secondary-maroon);
            font-size: 0.9rem;
        }
        
        .service-tag {
            background: #eee;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            color: #555;
            margin-left: 10px;
            font-weight: normal;
        }

        /* Footer */
        footer {
            background: #111;
            color: #777;
            padding: 1.5rem 5%;
            text-align: center;
            border-top: 1px solid #333;
            font-size: 0.9rem;
        }

        .status-msg {
            display: block;
            margin-top: 1rem;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <div class="navbar">
                <a href="Home.aspx" class="logo">Shree Jewelers</a>
                <div class="nav-links">
                    <a href="Home.aspx">HOME</a>
                    <a href="About.aspx">ABOUT</a>
                    <a href="Services.aspx">SERVICES</a>
                    <a href="gold Jewelry.aspx">GOLD</a>
                    <a href="Silver Jewelry.aspx">SILVER</a>
                    <a href="Dimond Jewelry.aspx">DIMOND</a>
                    <a href="Offer.aspx">OFFERS</a>
                    <a href="Contact.aspx">CONTACT</a>
                    <a href="Admin.aspx">ADMIN</a>
                </div>
            </div>
        </header>

        <div class="page-hero">
            <div>
                <h1>Our Premium Services</h1>
                <p>Expert Care for Your Precious Possessions</p>
            </div>
        </div>

        <div class="section">
            <div class="text-center">
                <h2>What We Offer</h2>
                <p style="color: #666; max-width: 600px; margin: 0 auto 3rem;">Maintain the shine and value of your jewelry with our expert services.</p>
            </div>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/gold (17).jpg" alt="Cleaning" onerror="this.src='https://via.placeholder.com/300x200/D4AF37/fff?text=Cleaning'"/>
                    </div>
                    <div class="service-content">
                        <i class="fas fa-sparkles service-icon"></i>
                        <h3>Ultrasonic Cleaning</h3>
                        <p>Deep cleaning using advanced ultrasonic technology to remove dirt and restore original shine without damaging the metal.</p>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/silver (17).jpg" alt="Polishing" onerror="this.src='https://via.placeholder.com/300x200/C0C0C0/333?text=Polishing'"/>
                    </div>
                    <div class="service-content">
                        <i class="fas fa-magic service-icon"></i>
                        <h3>Polishing & Buffing</h3>
                        <p>Professional polishing for Gold and Silver jewelry to remove scratches and oxidation, making them look brand new.</p>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/dimond (17).jpg" alt="Design" onerror="this.src='https://via.placeholder.com/300x200/e0e0e0/333?text=Design'"/>
                    </div>
                    <div class="service-content">
                        <i class="fas fa-pencil-ruler service-icon"></i>
                        <h3>Custom Design</h3>
                        <p>Bring your dream jewelry to life. Our designers create bespoke pieces tailored to your personal style and occasion.</p>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/gold (21).jpg" alt="Repair" onerror="this.src='https://via.placeholder.com/300x200/800000/fff?text=Repair'"/>
                    </div>
                    <div class="service-content">
                        <i class="fas fa-hammer service-icon"></i>
                        <h3>Repair & Setting</h3>
                        <p>Expert repair services for broken chains, ring sizing, and secure gemstone setting by master craftsmen.</p>
                    </div>
                </div>
                <!-- Extra images to fill the free space -->
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/gold (9).jpg" alt="Craftsmanship" />
                    </div>
                    <div class="service-content">
                        <i class="fas fa-gem service-icon"></i>
                        <h3>Quality Assurance</h3>
                        <p>We ensure every piece of jewelry meets the highest standards of purity and craftsmanship before it reaches you.</p>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img">
                        <img src="images/dimond (9).jpg" alt="Diamond Care" />
                    </div>
                    <div class="service-content">
                        <i class="fas fa-heart service-icon"></i>
                        <h3>Valuation Services</h3>
                        <p>Professional valuation for insurance and estate purposes, conducted by certified gemologists.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="feedback-section">
            <div class="text-center" style="margin-bottom: 3rem;">
                <h2>Share Your Experience</h2>
                <p>We value your feedback. Tell us how we did!</p>
            </div>

            <div class="form-container">
                <div class="form-group">
                    <label>Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Service Used</label>
                    <asp:DropDownList ID="ddlService" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Service" Value="" Selected="True" Enabled="false"></asp:ListItem>
                        <asp:ListItem Text="Ultrasonic Cleaning" Value="Ultrasonic Cleaning"></asp:ListItem>
                        <asp:ListItem Text="Polishing & Buffing" Value="Polishing & Buffing"></asp:ListItem>
                        <asp:ListItem Text="Custom Design" Value="Custom Design"></asp:ListItem>
                        <asp:ListItem Text="Repair & Setting" Value="Repair & Setting"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Rating</label>
                    <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-control">
                        <asp:ListItem Text="5 Stars - Excellent" Value="5"></asp:ListItem>
                        <asp:ListItem Text="4 Stars - Very Good" Value="4"></asp:ListItem>
                        <asp:ListItem Text="3 Stars - Good" Value="3"></asp:ListItem>
                        <asp:ListItem Text="2 Stars - Fair" Value="2"></asp:ListItem>
                        <asp:ListItem Text="1 Star - Poor" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Your Feedback</label>
                    <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Write your review here..."></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblStatus" runat="server" CssClass="status-msg"></asp:Label>
            </div>
        </div>

        <div class="section">
            <div class="text-center">
                <h2>Recent Customer Reviews</h2>
            </div>
            
            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p>"I brought my grandmother's old necklace for polishing, and it looks absolutely stunning now. Great service!"</p>
                    <div class="user-meta">Priya Sharma <span class="service-tag">Polishing</span></div>
                </div>
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></div>
                    <p>"The custom ring design was exactly what I wanted. The team was very patient with my revisions."</p>
                    <div class="user-meta">Rahul Verma <span class="service-tag">Custom Design</span></div>
                </div>
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p>"Quick and professional repair for my broken chain. Highly recommended."</p>
                    <div class="user-meta">Sneha Patil <span class="service-tag">Repair</span></div>
                </div>
            </div>
        </div>

        <footer>
            <div class="social-icons" style="margin-bottom: 1rem;">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <p class="copyright">&copy; <%= DateTime.Now.Year %> Shree Jewelers. All Rights Reserved.</p>
        </footer>

    </form>
</body>
</html>