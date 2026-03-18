 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Royal Indian Jewelry | Exquisite Tradition & Luxury</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Discover the finest collection of handcrafted Indian Gold, Diamond, and Silver jewelry. Shree Jewelers brings you a legacy of trust and tradition." />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* General Styles */
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

        /* Hero Slider */
        .hero {
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            margin-top: 60px;
            overflow: hidden;
        }

        .slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            opacity: 0;
            transition: opacity 1s ease-in-out;
            z-index: -1;
        }

        .slide.active {
            opacity: 1;
        }

        .slide::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.4); /* Darker overlay */
        }

        .hero-content {
            z-index: 1;
            position: relative;
            animation: fadeInUp 1.5s ease-out;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 4rem;
            color: var(--primary-gold);
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.4rem;
            margin-bottom: 2.5rem;
            color: #f1f1f1;
            font-weight: 300;
        }

        .btn {
            padding: 1rem 2.5rem;
            background: var(--primary-gold);
            color: #fff;
            font-weight: 700;
            border: 2px solid var(--primary-gold);
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: inline-block;
            transition: 0.3s;
        }

        .btn:hover {
            background: transparent;
            color: var(--primary-gold);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.4);
        }

        /* Common Section Styles */
        .section {
            padding: 6rem 5%;
            max-width: 1200px;
            margin: auto;
        }

        .text-center { text-align: center; }

        .section-title {
            font-size: 3rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
            color: var(--secondary-maroon);
        }

        .section-title::after {
            content: '';
            width: 80px;
            height: 3px;
            background: var(--primary-gold);
            display: block;
            margin: 15px auto 0;
        }

        .section-subtitle {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 3rem;
            font-style: italic;
        }

        /* About Section */
        .about-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
            background-color: #fff;
        }

        .about-text h2 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
        }

        .about-text p {
            margin-bottom: 1.5rem;
            font-size: 1.05rem;
            color: #555;
            text-align: justify;
        }

        .about-img {
            position: relative;
        }

        .about-img img {
            border-radius: 5px;
            box-shadow: 20px 20px 0 var(--light-bg);
            transition: 0.5s;
        }
        
        .about-img:hover img {
             transform: scale(1.02);
             box-shadow: 10px 10px 0 var(--primary-gold);
        }

        /* Categories */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .category-card {
            position: relative;
            overflow: hidden;
            border-radius: 0;
            cursor: pointer;
            height: 400px;
        }

        .category-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .category-card:hover img {
            transform: scale(1.1);
        }

        .category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.3s;
        }
        
        .category-card:hover .category-overlay {
            background: rgba(0,0,0,0.4);
        }

        .category-title {
            background: #fff;
            padding: 15px 30px;
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            color: var(--secondary-maroon);
            text-transform: uppercase;
            letter-spacing: 1px;
            transform: translateY(20px);
            transition: 0.4s;
            opacity: 0.9;
        }

        .category-card:hover .category-title {
            transform: translateY(0);
            background: var(--primary-gold);
            color: #fff;
        }

        /* Why Choose Us */
        .features-section {
            background-color: var(--light-bg);
            text-align: center;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
            margin-top: 3rem;
        }

        .feature-box {
            background: #fff;
            padding: 3rem 2rem;
            border-radius: 5px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: 0.3s;
        }

        .feature-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
        }

        .feature-icon {
            font-size: 3rem;
            color: var(--primary-gold);
            margin-bottom: 1.5rem;
        }

        .feature-box h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
        }

        /* Featured Collection */
        .featured-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .product-card {
            background: #fff;
            transition: 0.3s;
            position: relative;
        }
        
        .product-card:hover {
             box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .product-img-wrapper {
            height: 350px;
            overflow: hidden;
            background: #f4f4f4;
            position: relative;
        }

        .product-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .product-card:hover .product-img {
            transform: scale(1.05);
        }

        .product-details {
            padding: 1.5rem;
            text-align: center;
        }

        .product-title {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }

        .product-price {
            color: var(--primary-gold);
            font-weight: 700;
            font-size: 1.2rem;
        }
        
        .add-to-cart {
            margin-top: 10px;
            padding: 8px 20px;
            border: 1px solid var(--text-dark);
            background: transparent;
            cursor: pointer;
            transition: 0.3s;
            font-family: 'Lato', sans-serif;
            text-transform: uppercase;
            font-size: 0.8rem;
        }
        
        .add-to-cart:hover {
            background: var(--text-dark);
            color: #fff;
        }

        /* Gallery */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 250px);
            gap: 10px;
        }

        .gallery-item {
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        
        .gallery-item:nth-child(1) { grid-column: span 2; grid-row: span 2; height: 100%; }
        .gallery-item:nth-child(2) { grid-column: span 1; }
        .gallery-item:nth-child(3) { grid-column: span 1; }

        .gallery-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .gallery-item:hover .gallery-img {
            transform: scale(1.1);
        }

        /* Testimonials */
        .testimonials-section {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('images/hero_banner.png');
            background-size: cover;
            background-attachment: fixed;
            color: #fff;
            text-align: center;
            padding: 6rem 5%;
        }
        
        .testimonials-section h2 { color: var(--primary-gold); }

        .testimonial-slider {
            max-width: 800px;
            margin: auto;
            position: relative;
            overflow: hidden;
        }
        
        .testimonial-slide {
            display: none;
            animation: fadeIn 1s;
        }
        
        .testimonial-slide.active { display: block; }

        .quote {
            font-size: 2rem;
            color: var(--primary-gold);
            margin-bottom: 1rem;
        }
        
        .testimonial-text {
            font-size: 1.3rem;
            font-style: italic;
            margin-bottom: 2rem;
            line-height: 1.8;
        }
        
        .customer-name {
            font-weight: 700;
            font-size: 1.1rem;
            text-transform: uppercase;
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

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        /* Placeholders */
        .placeholder-box {
            background: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555;
            font-weight: bold;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 { font-size: 2.5rem; }
            .about-section { grid-template-columns: 1fr; }
            .gallery-grid { display: flex; flex-direction: column; height: auto; }
            .gallery-item { height: 250px; }
            .nav-links { display: none; } /* Mobile menu implementation needed if robust */
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

        <!-- Hero Slider -->
        <div class="hero">
            <div class="slide active" style="background-image: url('images/gold (22).jpg'); background-color: #333;"></div>
            <div class="slide" style="background-image: url('images/silver (6).jpg'); background-color: #444;"></div>
            <div class="slide" style="background-image: url('images/dimond (5).jpg'); background-color: #555;"></div>

            <div class="hero-content">
                <h1>Legacy of Royal <br />Indian Elegance</h1>
                <p>Adorn yourself with the timeless beauty of handcrafted Gold, Diamond, and Silver jewelry.</p>
                <a href="#featured" class="btn">View Collection</a>
            </div>
        </div>

        <!-- About Section -->
        <div class="section about-section">
            <div class="about-img">
                <img src="images/gold (5).jpg" alt="Our Craftsmanship" onerror="this.src='https://via.placeholder.com/600x400/800000/ffffff?text=Our+Heritage'"/>
            </div>
            <div class="about-text">
                <h2>A Tradition of Trust</h2>
                <p>Since 1995, <strong>Shree Jewelers</strong> has been a beacon of trust and tradition in the Indian jewelry market. Born from a passion for exquisite craftsmanship, we bring you jewelry that is not just an accessory, but a piece of art passed down through generations.</p>
                <p>Our artisans meticulously craft each piece, blending ancient techniques with modern aesthetics to create masterpieces in Gold, Diamond, and Kundan. Experience the grandeur of royal heritage with every piece you wear.</p>
                <a href="About.aspx" class="btn" style="padding: 0.8rem 2rem; font-size: 0.9rem;">Read Our Story</a>
            </div>
        </div>

        <!-- Categories -->
        <div class="section">
            <div class="text-center">
                <h2 class="section-title">Shop By Category</h2>
                <p class="section-subtitle">Explore our diverse range of premium collections</p>
            </div>
            <div class="categories-grid">
                <div class="category-card" onclick="window.location='gold Jewelry.aspx'">
                    <img src="images/gold (10).jpg" alt="Gold Jewelry" onerror="this.src='https://via.placeholder.com/400x500/D4AF37/ffffff?text=Gold+Collection'"/>
                    <div class="category-overlay">
                        <div class="category-title">Gold</div>
                    </div>
                </div>
                 <div class="category-card" onclick="window.location='Dimond Jewelry.aspx'">
                    <img src="images/dimond (10).jpg" alt="Diamond Jewelry" onerror="this.src='https://via.placeholder.com/400x500/e0e0e0/333333?text=Diamond+Collection'"/>
                    <div class="category-overlay">
                        <div class="category-title">Diamond</div>
                    </div>
                </div>
                 <div class="category-card" onclick="window.location='Silver Jewelry.aspx'">
                    <img src="images/silver (10).jpg" alt="Silver Jewelry" onerror="this.src='https://via.placeholder.com/400x500/C0C0C0/333333?text=Silver+Collection'"/>
                    <div class="category-overlay">
                        <div class="category-title">Silver</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Why Choose Us -->
        <div class="section features-section">
            <h2 class="section-title">Why Choose Shree?</h2>
            <div class="features-grid">
                <div class="feature-box">
                    <i class="fas fa-gem feature-icon"></i>
                    <h3>Certified Purity</h3>
                    <p>Every piece comes with a hallmark of purity, ensuring you get the finest quality gold and diamonds.</p>
                </div>
                <div class="feature-box">
                    <i class="fas fa-hammer feature-icon"></i>
                    <h3>Master Craftsmanship</h3>
                    <p>Handcrafted by skilled artisans who have mastered the art of traditional Indian jewelry making.</p>
                </div>
                <div class="feature-box">
                    <i class="fas fa-shipping-fast feature-icon"></i>
                    <h3>Secure & Insured</h3>
                    <p>We offer fully insured shipping and secure packaging to ensure your precious items reach you safely.</p>
                </div>
                 <div class="feature-box">
                    <i class="fas fa-undo feature-icon"></i>
                    <h3>Lifetime Exchange</h3>
                    <p>Enjoy our transparent lifetime exchange policy on all gold and diamond jewelry purchases.</p>
                </div>
            </div>
        </div>

        <!-- Featured Collections -->
        <div class="section" id="featured">
             <div class="text-center">
                 <h2 class="section-title">New Arrivals</h2>
                 <p class="section-subtitle">Exclusively curated for the wedding season</p>
             </div>
             <div class="featured-grid">
                 <!-- Product 1 -->
                 <div class="product-card">
                     <div class="product-img-wrapper">
                         <img src="images/gold (20).jpg" class="product-img" alt="Royal Kundan Necklace" onerror="this.src='https://via.placeholder.com/300x350/D4AF37/ffffff?text=Kundan+Necklace'" />
                     </div>
                     <div class="product-details">
                         <div class="product-title">Royal Kundan Necklace</div>
                         <div class="product-price">₹ 1,25,000</div>
                         <button class="add-to-cart">Add to Cart</button>
                     </div>
                 </div>
                 <!-- Product 2 -->
                 <div class="product-card">
                     <div class="product-img-wrapper">
                        <img src="images/dimond (20).jpg" class="product-img" alt="Emerald Drop Earrings" onerror="this.src='https://via.placeholder.com/300x350/e0e0e0/333333?text=Emerald+Earrings'"/>
                     </div>
                     <div class="product-details">
                         <div class="product-title">Emerald Drop Earrings</div>
                         <div class="product-price">₹ 85,000</div>
                         <button class="add-to-cart">Add to Cart</button>
                     </div>
                 </div>
                 <!-- Product 3 -->
                 <div class="product-card">
                      <div class="product-img-wrapper">
                        <img src="images/gold (25).jpg" class="product-img" alt="Antique Gold Bangles" onerror="this.src='https://via.placeholder.com/300x350/D4AF37/ffffff?text=Gold+Bangles'"/>
                      </div>
                     <div class="product-details">
                         <div class="product-title">Antique Gold Bangles</div>
                         <div class="product-price">₹ 65,000</div>
                         <button class="add-to-cart">Add to Cart</button>
                     </div>
                 </div>
             </div>
             <div class="text-center" style="margin-top: 3rem;">
                 <a href="gold Jewelry.aspx" class="btn">View All Products</a>
             </div>
        </div>

        <!-- Gallery Section -->
        <div class="section" style="padding-top: 0;">
             <div class="text-center">
                <h2 class="section-title">Gallery</h2>
            </div>
            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="images/gold (1).jpg" class="gallery-img" alt="Bride" onerror="this.src='https://via.placeholder.com/600x600/800000/fff?text=Bridal+Collection'"/>
                </div>
                <div class="gallery-item">
                    <img src="images/gold (15).jpg" class="gallery-img" alt="Jewelry" onerror="this.src='https://via.placeholder.com/300x300/D4AF37/fff?text=Necklace'"/>
                </div>
                 <div class="gallery-item">
                    <img src="images/dimond (15).jpg" class="gallery-img" alt="Jewelry" onerror="this.src='https://via.placeholder.com/300x300/e0e0e0/333?text=Earrings'"/>
                </div>
                 <div class="gallery-item">
                    <img src="images/silver (15).jpg" class="gallery-img" alt="Jewelry" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Bangles'"/>
                </div>
                 <div class="gallery-item">
                    <img src="images/gold (30).jpg" class="gallery-img" alt="Jewelry" onerror="this.src='https://via.placeholder.com/300x300?text=Rings'"/>
                </div>
            </div>
        </div>

        <!-- Testimonials -->
        <div class="testimonials-section">
            <h2>What Our Clients Say</h2>
            <div class="testimonial-slider">
                <div class="testimonial-slide active">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p class="testimonial-text">"The craftsmanship is simply breathtaking. I bought my bridal set from Shree Jewelers and it was the highlight of my wedding. Truly royal!"</p>
                    <div class="customer-name">- Anjali Verma</div>
                </div>
                <div class="testimonial-slide">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p class="testimonial-text">"Excellent service and transparent pricing. Their collection of antique gold jewelry is unmatched in the city."</p>
                    <div class="customer-name">- Rajesh Kumar</div>
                </div>
                <div class="testimonial-slide">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p class="testimonial-text">"I love their modern diamond designs. Perfect for daily wear and yet so elegant. Highly recommended!"</p>
                    <div class="customer-name">- Sneha Gupta</div>
                </div>
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

    <!-- JS for Sliders -->
    <script>
        // Hero Slider
        let slides = document.querySelectorAll('.hero .slide');
        let currentSlide = 0;

        function nextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }
        setInterval(nextSlide, 5000);

        // Testimonial Slider
        let tSlides = document.querySelectorAll('.testimonial-slide');
        let currentTSlide = 0;

        function nextTSlide() {
             tSlides[currentTSlide].classList.remove('active');
            currentTSlide = (currentTSlide + 1) % tSlides.length;
            tSlides[currentTSlide].classList.add('active');
        }
        setInterval(nextTSlide, 6000);
    </script>
</body>
</html>
