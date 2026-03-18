<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Offer.aspx.cs" Inherits="Offer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Special Offers | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-gold: #D4AF37;
            --secondary-maroon: #800000;
            --text-dark: #333;
            --light-bg: #f9f9f9;
            --dark-bg: #1a1a1a;
        }

        body {
            font-family: 'Lato', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-dark);
            background-color: #fff;
            overflow-x: hidden;
            line-height: 1.6;
        }

        h1, h2, h3, h4 {
            font-family: 'Playfair Display', serif;
            color: var(--secondary-maroon);
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: 0.3s;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        img {
            max-width: 100%;
            display: block;
        }

        /* Header */
        header {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            z-index: 1000;
            top: 0;
            transition: 0.3s;
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

        /* Content Section */
        .content-area {
            padding: 120px 5% 60px;
            max-width: 1200px;
            margin: auto;
            min-height: 50vh;
        }

        .offer-title { 
            font-family: 'Playfair Display', serif; 
            text-align: center; 
            color: var(--secondary-maroon); 
            font-size: 3rem; 
            margin-bottom: 40px; 
            position: relative;
        }

        .offer-title::after {
            content: '';
            width: 80px;
            height: 3px;
            background: var(--primary-gold);
            display: block;
            margin: 15px auto 0;
        }

        .offer-container { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
            gap: 30px; 
        }

        .offer-card { 
            background: #fff; 
            border: 1px solid #eee; 
            border-radius: 12px; 
            overflow: hidden; 
            box-shadow: 0 10px 20px rgba(0,0,0,0.05); 
            transition: 0.3s; 
            display: flex;
            flex-direction: column;
        }

        .offer-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--primary-gold);
        }

        .offer-img-wrapper {
            height: 250px;
            overflow: hidden;
            background: #f4f4f4;
        }

        .offer-img { 
            width: 100%; 
            height: 100%; 
            object-fit: cover; 
            transition: 0.5s;
        }

        .offer-card:hover .offer-img {
            transform: scale(1.1);
        }

        .offer-content { 
            padding: 25px; 
            text-align: center; 
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .offer-content h3 {
            margin: 0 0 10px;
            font-size: 1.4rem;
        }

        .offer-content p {
            color: #666;
            font-size: 0.95rem;
            margin-bottom: 15px;
        }

        .price-tag { 
            color: var(--secondary-maroon); 
            font-weight: bold; 
            font-size: 1.6rem; 
            margin: 10px 0; 
        }

        .btn-claim { 
            background: var(--primary-gold); 
            color: white; 
            padding: 12px 25px; 
            border-radius: 4px; 
            text-decoration: none; 
            display: inline-block; 
            margin-top: 15px; 
            font-weight: bold; 
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
        }

        .btn-claim:hover {
            background: var(--secondary-maroon);
            box-shadow: 0 5px 15px rgba(128, 0, 0, 0.2);
        }

        /* Info Footer */
        .info-footer {
            background: #222;
            color: #ccc;
            padding: 4rem 5%;
            font-size: 0.95rem;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
        }
        .info-col h4 {
            color: #fff;
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
        }
        .info-col ul li {
            margin-bottom: 0.8rem;
        }
        .info-col a:hover { color: var(--primary-gold); }

        /* Footer */
        footer {
            background: #111;
            color: #777;
            padding: 1.5rem 5%;
            text-align: center;
            border-top: 1px solid #333;
            font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-links { display: none; }
            .offer-title { font-size: 2.2rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
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

        <div class="content-area">
            <h1 class="offer-title">Exclusive Offers</h1>
            <div class="offer-container">
                <asp:Repeater ID="rptOffers" runat="server">
                    <ItemTemplate>
                        <div class="offer-card">
                            <div class="offer-img-wrapper">
                                <img src='<%# Eval("ImagePath") %>' class="offer-img" alt="Jewelry Offer" />
                            </div>
                            <div class="offer-content">
                                <h3><%# Eval("ProductName") %></h3>
                                <p><%# Eval("Description") %></p>
                                <div class="price-tag">₹ <%# Eval("Price") %></div>
                                <a href="Contact.aspx" class="btn-claim">BUY NOW</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Info Footer -->
        <div class="info-footer">
            <div class="info-grid">
                <div class="info-col">
                    <h4>Contact Info</h4>
                    <ul>
                        <li><i class="fas fa-map-marker-alt"></i> 123, Jewel Street, Mumbai, India</li>
                        <li><i class="fas fa-phone"></i> +91 98765 43210</li>
                        <li><i class="fas fa-envelope"></i> contact@shreejewelers.com</li>
                    </ul>
                </div>
                <div class="info-col">
                    <h4>Customer Care</h4>
                    <ul>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Returns & Exchange</a></li>
                        <li><a href="#">Jewelry Care Guide</a></li>
                        <li><a href="#">Gold Schemes</a></li>
                    </ul>
                </div>
                <div class="info-col">
                    <h4>About Us</h4>
                    <p>Shree Jewelers is a verified and trusted name in the industry, offering hallmarked gold and IGI certified diamond jewelry. We believe in building relationships as strong as our diamonds.</p>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="social-icons" style="margin-bottom: 1rem;">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-pinterest"></i></a>
            </div>
            <p class="copyright">&copy; <%= DateTime.Now.Year %> Shree Jewelers. All Rights Reserved. | Designed with <i class="fas fa-heart" style="color: var(--secondary-maroon)"></i></p>
        </footer>
    </form>
</body>
</html>
