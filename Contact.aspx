 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contact Us | Shree Jewelers</title>
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

        /* Contact Section */
        .section {
            padding: 5rem 5%;
            max-width: 1200px;
            margin: auto;
        }

        .contact-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            margin-top: 3rem;
        }

        /* Contact Form */
        .contact-form {
            background: #fff;
            padding: 2.5rem;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border: 1px solid #eee;
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
            box-sizing: border-box;
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

        /* Contact Info */
        .contact-info-box h3 {
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 2rem;
        }

        .info-icon {
            background: var(--light-bg);
            color: var(--primary-gold);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            margin-right: 1.5rem;
            flex-shrink: 0;
        }

        .info-text h4 {
            margin: 0 0 0.5rem 0;
            font-size: 1.1rem;
            color: var(--text-dark);
        }

        .info-text p {
            margin: 0;
            color: #666;
        }

        /* Social Icons */
        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--secondary-maroon);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.3s;
        }
        
        .social-btn:hover {
            background: var(--primary-gold);
            transform: translateY(-3px);
        }

        /* Map */
        .map-section {
            width: 100%;
            height: 450px;
            margin-top: 4rem;
        }
        
        .map-frame {
            width: 100%;
            height: 100%;
            border: 0;
            display: block;
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
        
        @media (max-width: 768px) {
            .contact-container { grid-template-columns: 1fr; }
            .nav-links { display: none; }
        }

        .status-message {
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
            display: block;
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
                <h1>Get in Touch</h1>
                <p>We are here to help you</p>
            </div>
        </div>

        <div class="section">
            <div class="contact-container">
                
                <div class="contact-form">
                    <h3 style="margin-bottom: 1.5rem; text-align: center;">Send Us a Message</h3>
                    
                    <div class="form-group">
                        <label>Your Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="john@example.com" TextMode="Email"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label>Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Inquiry about custom design"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label>Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="How can we help you?"></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                    
                    <asp:Label ID="lblStatus" runat="server" CssClass="status-message"></asp:Label>
                </div>

                <div class="contact-info-box">
                    <h3>Contact Information</h3>
                    <p style="margin-bottom: 2rem; color: #666;">Visit our showroom to experience our exclusive collection or reach out to us for any queries.</p>
                    
                    <div class="info-item">
                        <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="info-text">
                            <h4>Address</h4>
                            <p>Shree Jewelers, 123 Royal Plaza,<br />Jewelry Lane, Mumbai, Maharashtra 400001</p>
                        </div>
                    </div>

                    <div class="info-item">
                        <div class="info-icon"><i class="fas fa-phone-alt"></i></div>
                        <div class="info-text">
                            <h4>Phone</h4>
                            <p>+91 98765 43210</p>
                            <p>+91 22 1234 5678</p>
                        </div>
                    </div>

                    <div class="info-item">
                        <div class="info-icon"><i class="fas fa-envelope"></i></div>
                        <div class="info-text">
                            <h4>Email</h4>
                            <p>info@shreejewelers.com</p>
                            <p>support@shreejewelers.com</p>
                        </div>
                    </div>

                    <h4 style="margin-top: 2rem;">Follow Us</h4>
                    <div class="social-links">
                        <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-btn"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-btn"><i class="fab fa-whatsapp"></i></a>
                        <a href="#" class="social-btn"><i class="fab fa-pinterest"></i></a>
                    </div>
                </div>

            </div>
        </div>

        <div class="map-section">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d241317.11609823277!2d72.74109995!3d19.08219785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c6306644edc1%3A0x19280a711090f70a!2sMumbai%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1647412345678" 
                class="map-frame" allowfullscreen="" loading="lazy"></iframe>
        </div>

        <footer>
            <div class="social-icons" style="margin-bottom: 1rem;">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <p class="copyright">© <%= DateTime.Now.Year %> Shree Jewelers. All Rights Reserved.</p>
        </footer>

    </form>
</body>
</html>