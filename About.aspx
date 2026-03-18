<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* Reusing Core Styles from Home.aspx */
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
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/gold (19).jpg');
            background-size: cover;
            background-position: center;
            height: 350px;
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

        /* Content Sections */
        .section {
            padding: 5rem 5%;
            max-width: 1100px;
            margin: auto;
        }

        .split-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .text-content p {
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            color: #555;
            text-align: justify;
        }

        .img-content img {
            width: 100%;
            border-radius: 5px;
            box-shadow: 15px 15px 0 var(--light-bg);
        }

        /* Mission & Goal Cards */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .info-card {
            background: #fff;
            padding: 2.5rem;
            border: 1px solid #eee;
            text-align: center;
            transition: 0.3s;
            position: relative;
            overflow: hidden;
        }
        
        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            border-bottom: 3px solid var(--primary-gold);
        }

        .card-icon {
            font-size: 2.5rem;
            color: var(--primary-gold);
            margin-bottom: 1.5rem;
        }

        .info-card h3 { margin-bottom: 1rem; }

        /* Future Plans Timeline */
        .timeline-section {
            background: var(--light-bg);
            text-align: center;
        }

        .timeline {
            position: relative;
            max-width: 800px;
            margin: 3rem auto 0;
            padding: 2rem 0;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 2px;
            height: 100%;
            background: var(--primary-gold);
        }

        .timeline-item {
            margin-bottom: 3rem;
            position: relative;
            width: 50%;
            padding: 0 2rem;
            box-sizing: border-box;
        }
        
        .timeline-item:nth-child(odd) { left: 0; text-align: right; }
        .timeline-item:nth-child(even) { left: 50%; text-align: left; }

        .timeline-dot {
            position: absolute;
            top: 0;
            width: 20px;
            height: 20px;
            background: var(--secondary-maroon);
            border-radius: 50%;
            z-index: 1;
        }

        .timeline-item:nth-child(odd) .timeline-dot { right: -10px; }
        .timeline-item:nth-child(even) .timeline-dot { left: -10px; }

        .timeline-content h4 { margin-top: 0; color: var(--primary-gold); }
        
        /* Stats */
        .stats-bar {
            background: var(--secondary-maroon);
            color: #fff;
            padding: 4rem 5%;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            text-align: center;
        }

        .stat-item h2 {
            color: var(--primary-gold);
            font-size: 3rem;
            margin: 0;
        }
        
        .stat-item p { margin-top: 0.5rem; font-size: 1.1rem; opacity: 0.9; }

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
            .split-layout { grid-template-columns: 1fr; }
            .timeline::before { left: 20px; }
            .timeline-item { width: 100%; padding-left: 50px; text-align: left !important; }
            .timeline-item:nth-child(odd) .timeline-dot, 
            .timeline-item:nth-child(even) .timeline-dot { left: 10px; }
            .nav-links { display: none; }
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

        <!-- Page Hero -->
        <div class="page-hero">
            <div>
                <h1>Our Story</h1>
                <p>Crafting Elegance Since 1995</p>
            </div>
        </div>

        <!-- Introduction -->
        <div class="section split-layout">
            <div class="img-content">
                <img src="images/gold (3).jpg" alt="Jewelry Workshop" onerror="this.src='https://via.placeholder.com/600x400/800000/fff?text=Our+Workshop'"/>
            </div>
            <div class="text-content">
                <h2>A Legacy of Brilliance</h2>
                <p>At <strong>Shree Jewelers</strong>, we believe that jewelry is more than just an accessory—it's an emotion, a heritage, AND a legacy that is passed down through generations.</p>
                <p>Founded three decades ago in the heart of India's jewelry district, we started with a simple vision: to bring the royal grandeur of Indian craftsmanship to the modern woman. Today, we are proud to be one of the most trusted names in the industry, synonymous with purity, transparency, and unmatched beauty.</p>
                <p>Our collections are a blend of antique traditional designs and contemporary chic, ensuring there is something perfect for every occasion.</p>
            </div>
        </div>

        <!-- Expert Craftsmanship Section -->
        <div class="section split-layout" style="padding-top: 0;">
            <div class="text-content">
                <h2>Expert Craftsmanship</h2>
                <p>Precision and passion define our work. Beyond selling exquisite pieces, we specialize in <strong>Repair & Setting</strong> services. Our master craftsmen ensure that your precious jewels are handled with the utmost care, whether it's resizing a family heirloom or restoring the shine of a vintage necklace.</p>
                <p>We use the latest tools and traditional techniques to guarantee that every piece leaving our workshop is a masterpiece of perfection.</p>
            </div>
            <div class="img-content">
                <img src="images/gold (21).jpg" alt="Master Craftsman" style="box-shadow: -15px 15px 0 var(--light-bg);" onerror="this.src='https://via.placeholder.com/600x400/D4AF37/fff?text=Expert+Craftsmanship'"/>
            </div>
        </div>

        <!-- Mission, Vision, Goal -->
        <div class="section" style="background-color: var(--light-bg); max-width: 100%;">
            <div class="section" style="padding-top: 0; padding-bottom: 0;">
                <div class="cards-grid">
                    <!-- Mission -->
                    <div class="info-card">
                        <i class="fas fa-bullseye card-icon"></i>
                        <h3>Our Mission</h3>
                        <p>To preserve the art of traditional Indian jewelry making while innovating with modern techniques to create pieces that are timeless yet trendy.</p>
                    </div>
                    <!-- Vision -->
                    <div class="info-card">
                        <i class="fas fa-eye card-icon"></i>
                        <h3>Our Vision</h3>
                        <p>To be the world's most loved jewelry brand, recognized for our commitment to quality, ethical sourcing, and customer-centric approach.</p>
                    </div>
                    <!-- Goal -->
                    <div class="info-card">
                        <i class="fas fa-star card-icon"></i>
                        <h3>Our Goal</h3>
                        <p>To ensure 100% customer satisfaction by offering certified platinum, gold, and diamond jewelry with complete transparency in pricing and policies.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Future Plans -->
        <div class="section timeline-section">
            <h2>Future Roadmap</h2>
            <p>We are constantly evolving. Here is what's next for Shree Jewelers.</p>
            
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="timeline-content">
                        <h4>2026</h4>
                        <p>Expansion to 5 new cities across India with flagship experience centers.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="timeline-content">
                        <h4>2027</h4>
                        <p>Launch of our exclusive international shipping wing for global customers.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="timeline-content">
                        <h4>2028</h4>
                        <p>Introduction of AI-based Virtual Try-On feature on our website for a seamless shopping experience.</p>
                    </div>
                </div>
                 <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="timeline-content">
                        <h4>2030</h4>
                        <p>Achieving 100% sustainable and recycled gold usage in all our manufacturing units.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats -->
        <div class="stats-bar">
            <div class="stat-item">
                <h2>30+</h2>
                <p>Years of Legacy</p>
            </div>
            <div class="stat-item">
                <h2>50k+</h2>
                <p>Happy Customers</p>
            </div>
            <div class="stat-item">
                <h2>100+</h2>
                <p>Awards Won</p>
            </div>
            <div class="stat-item">
                <h2>5000+</h2>
                <p>Unique Designs</p>
            </div>
        </div>

        <!-- Footer -->
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
