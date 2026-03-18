 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="gold Jewelry.aspx.cs" Inherits="gold_Jewelry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Gold Collection | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
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

        .page-hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/gold (33).jpg');
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

        .catalog-container {
            display: flex;
            padding: 4rem 5%;
            max-width: 1300px;
            margin: auto;
            gap: 3rem;
        }

        .sidebar {
            width: 250px;
            flex-shrink: 0;
            background: #fff;
            padding: 2rem;
            border-right: 1px solid #eee;
            height: fit-content;
        }

        .sidebar h3 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid var(--primary-gold);
            padding-bottom: 0.5rem;
            display: inline-block;
        }

        .category-list li { margin-bottom: 1rem; }

        .category-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.1rem;
            font-family: 'Lato', sans-serif;
            color: #555;
            text-align: left;
            width: 100%;
            padding: 0.5rem;
            transition: 0.3s;
            border-radius: 5px;
        }

        .category-btn:hover, .category-btn.active {
            background: var(--light-bg);
            color: var(--secondary-maroon);
            font-weight: 700;
            padding-left: 1rem;
        }

        .product-grid-section { flex-grow: 1; }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            transition: 0.3s;
            position: relative;
            animation: fadeIn 0.5s ease-in-out;
        }

        .product-card:hover {
            box-shadow: 0 15px 35px rgba(212, 175, 55, 0.2);
            transform: translateY(-8px);
            border-color: var(--primary-gold);
        }

        .product-img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            background: #f4f4f4;
        }

        .product-info { padding: 1.5rem; text-align: center; }

        .product-title {
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            color: var(--text-dark);
            height: 2.5rem;
            overflow: hidden;
        }

        .product-price {
            font-size: 1.3rem;
            color: var(--secondary-maroon);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .btn-buy {
            background: linear-gradient(135deg, var(--primary-gold), #b59020);
            color: #fff;
            border: none;
            padding: 0.8rem 2rem;
            width: 100%;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.4s;
            text-transform: uppercase;
            border-radius: 4px;
        }
        
        .btn-buy:hover {
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.4);
            transform: scale(1.02);
        }

        /* Info Footer */
        .info-footer {
            background: #222;
            color: #ccc;
            padding: 4rem 5%;
            font-size: 0.95rem;
            text-align: left;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
            max-width: 1200px;
            margin: auto;
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

        .social-icons {
            margin-bottom: 1rem;
        }
        .social-icons a {
            margin: 0 10px;
            font-size: 1.2rem;
            transition: 0.3s;
        }
        .social-icons a:hover {
            color: var(--primary-gold);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 900px) {
            .catalog-container { flex-direction: column; }
            .sidebar { width: 100%; border-right: none; border-bottom: 1px solid #eee; }
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
                <h1>Royal Gold Collection</h1>
                <p>Timeless Beauty in 22K & 24K Gold</p>
            </div>
        </div>

        <div class="catalog-container">
            <aside class="sidebar">
                <h3>Categories</h3>
                <ul class="category-list">
                    <li><button type="button" class="category-btn active" onclick="renderProducts('all', this)">All Products</button></li>
                    <li><button type="button" class="category-btn" onclick="renderProducts('necklace', this)">Necklaces</button></li>
                    <li><button type="button" class="category-btn" onclick="renderProducts('bangles', this)">Bangles</button></li>
                    <li><button type="button" class="category-btn" onclick="renderProducts('earrings', this)">Earrings</button></li>
                    <li><button type="button" class="category-btn" onclick="renderProducts('rings', this)">Rings</button></li>
                </ul>
            </aside>

            <div class="product-grid-section">
                <div class="product-grid" id="productGrid">
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
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-pinterest"></i></a>
            </div>
            <p>&copy; <%= DateTime.Now.Year %> Shree Jewelers. All Rights Reserved. | Designed with <i class="fas fa-heart" style="color: var(--secondary-maroon)"></i></p>
        </footer>

    </form>

    <script>
        // Data Object containing at least 6 products per requested category
        const goldProducts = [
            // BANGLES (6 Items)
            { id: 1, category: 'bangles', title: 'Antique Temple Kada', price: '₹ 1,85,000', img: 'images/gold (2).jpg' },
            { id: 2, category: 'bangles', title: 'Filigree Gold Bangles', price: '₹ 95,000', img: 'images/gold (5).jpg' },
            { id: 3, category: 'bangles', title: 'Bridal Wedding Set', price: '₹ 3,20,000', img: 'images/gold (16).jpg' },
            { id: 4, category: 'bangles', title: 'Daily Wear Gold Pipe', price: '₹ 45,000', img: 'images/gold (22).jpg' },
            { id: 5, category: 'bangles', title: 'Meenakari Floral Bangles', price: '₹ 1,15,000', img: 'images/gold (28).jpg' },
            { id: 6, category: 'bangles', title: 'Solid 24K Gold Valayal', price: '₹ 2,10,000', img: 'images/gold (32).jpg' },

            // RINGS (6 Items)
            { id: 7, category: 'rings', title: 'Solitaire Gold Ring', price: '₹ 25,000', img: 'images/gold (6).jpg' },
            { id: 8, category: 'rings', title: 'Traditional Vanki Ring', price: '₹ 18,000', img: 'images/gold (10).jpg' },
            { id: 9, category: 'rings', title: 'Floral Statement Ring', price: '₹ 42,000', img: 'images/gold (18).jpg' },
            { id: 10, category: 'rings', title: 'Classic Engagement Band', price: '₹ 35,000', img: 'images/gold (24).jpg' },
            { id: 11, category: 'rings', title: 'Ruby Studded Gold Ring', price: '₹ 55,000', img: 'images/gold (30).jpg' },
            { id: 12, category: 'rings', title: 'Modern Geometric Ring', price: '₹ 22,000', img: 'images/gold (12).jpg' },

            // NECKLACES (6 Items)
            { id: 13, category: 'necklace', title: 'Maharani Choker Set', price: '₹ 4,50,000', img: 'images/gold (1).jpg' },
            { id: 14, category: 'necklace', title: 'Temple Lakshmi Haar', price: '₹ 2,80,000', img: 'images/gold (3).jpg' },
            { id: 15, category: 'necklace', title: 'Antique Kundan Mala', price: '₹ 3,10,000', img: 'images/gold (15).jpg' },
            { id: 16, category: 'necklace', title: 'Modern Link Necklace', price: '₹ 1,20,000', img: 'images/gold (21).jpg' },
            { id: 17, category: 'necklace', title: 'Lightweight Daily Chain', price: '₹ 65,000', img: 'images/gold (27).jpg' },
            { id: 18, category: 'necklace', title: 'Royal Gold Guttapusalu', price: '₹ 5,40,000', img: 'images/gold (13).jpg' },

            // EARRINGS (6 Items)
            { id: 19, category: 'earrings', title: 'Antique Jhumka Drops', price: '₹ 85,000', img: 'images/gold (4).jpg' },
            { id: 20, category: 'earrings', title: 'Modern Gold Hoops', price: '₹ 32,000', img: 'images/gold (7).jpg' },
            { id: 21, category: 'earrings', title: 'Bridal Chandbalis', price: '₹ 1,45,000', img: 'images/gold (14).jpg' },
            { id: 22, category: 'earrings', title: 'Daily Wear Studs', price: '₹ 12,000', img: 'images/gold (17).jpg' },
            { id: 23, category: 'earrings', title: 'Traditional Ear Chains', price: '₹ 58,000', img: 'images/gold (23).jpg' },
            { id: 24, category: 'earrings', title: 'Long Leafy Drops', price: '₹ 48,000', img: 'images/gold (29).jpg' }
        ];

        function renderProducts(filter, btn) {
            // Update UI Active State
            const buttons = document.querySelectorAll('.category-btn');
            buttons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const grid = document.getElementById('productGrid');
            grid.innerHTML = ''; // Clear current grid

            // Filter logic
            const filteredData = filter === 'all' 
                ? goldProducts 
                : goldProducts.filter(p => p.category === filter);

            // Create HTML for each product
            filteredData.forEach(p => {
                const productHTML = `
                    <div class="product-card">
                        <img src="${p.img}" class="product-img" alt="${p.title}" 
                             onerror="this.src='https://via.placeholder.com/300x300/D4AF37/fff?text=${p.category}'"/>
                        <div class="product-info">
                            <div class="product-title">${p.title}</div>
                            <div class="product-price">${p.price}</div>
                            <button type="button" class="btn-buy" onclick="addToCart('${p.title}')">BUY NOW</button>
                        </div>
                    </div>
                `;
                grid.innerHTML += productHTML;
            });
        }

        function addToCart(name) {
            alert(name + " has been added to your cart!");
        }

        // Initialize Page
        window.onload = () => {
            renderProducts('all', document.querySelector('.category-btn.active'));
        };
    </script>
</body>
</html>