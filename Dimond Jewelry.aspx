<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dimond Jewelry.aspx.cs" Inherits="Dimond_Jewelry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Diamond Collection | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* Reusing Core Styles */
        :root {
            --primary-gold: #D4AF37;
            --secondary-maroon: #800000;
            --diamond-accent: #B2EBF2; /* Ice Blue Accent */
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
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,20,40,0.7)), url('images/dimond (30).jpg'); /* Blue tint */
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            margin-top: 60px;
            border-bottom: 5px solid var(--diamond-accent);
        }

        .page-hero h1 {
            font-size: 3.5rem;
            color: #fff;
            text-shadow: 0 0 15px rgba(178, 235, 242, 0.8); /* Glow effect */
            margin-bottom: 0.5rem;
        }
        
        .page-hero p {
            color: #E0F7FA;
            font-size: 1.2rem;
            letter-spacing: 1px;
        }

        /* Catalog Layout */
        .catalog-container {
            display: flex;
            padding: 4rem 5%;
            max-width: 1300px;
            margin: auto;
            gap: 3rem;
        }

        /* Sidebar Filters */
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
            border-bottom: 2px solid var(--diamond-accent);
            padding-bottom: 0.5rem;
            display: inline-block;
            color: #006064; /* Dark Cyan/Blue for header */
        }

        .category-list li {
            margin-bottom: 1rem;
        }

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
            background: #E0F7FA;
            color: #006064;
            font-weight: 700;
            padding-left: 1rem;
            border-left: 3px solid var(--diamond-accent);
        }

        /* Product Grid */
        .product-grid-section {
            flex-grow: 1;
        }

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
            box-shadow: 0 10px 25px rgba(178, 235, 242, 0.4); /* Light Blue Shadow */
            transform: translateY(-5px);
            border-color: var(--diamond-accent);
        }

        .product-img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            background: #f4f4f4;
        }

        .product-info {
            padding: 1.5rem;
            text-align: center;
        }

        .product-title {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            color: var(--text-dark);
        }

        .product-price {
            font-size: 1.3rem;
            color: #00838F; /* Cyan price for Diamond */
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .btn-buy {
            background: #333;
            color: #fff;
            border: none;
            padding: 0.8rem 2rem;
            width: 100%;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            text-transform: uppercase;
        }

        .btn-buy:hover {
            background: #0097A7;
            box-shadow: 0 5px 15px rgba(0, 151, 167, 0.3);
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

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 900px) {
            .catalog-container { flex-direction: column; }
            .sidebar { width: 100%; margin-bottom: 2rem; }
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
                <h1>Exquisite Diamond Collection</h1>
                <p>Forever Brilliance, Crafted for You</p>
            </div>
        </div>

        <!-- Catalog -->
        <div class="catalog-container">
            
            <!-- Sidebar -->
            <aside class="sidebar">
                <h3>Collections</h3>
                <ul class="category-list">
                    <li><button type="button" class="category-btn active" onclick="filterProducts('all', this)">All Products</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('rings', this)">Solitaire Rings</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('necklaces', this)">Diamond Necklaces</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('earrings', this)">Stud Earrings</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('bracelets', this)">Tennis Bracelets</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('pendants', this)">Pendants</button></li>
                </ul>
            </aside>

            <!-- Product Grid -->
            <div class="product-grid-section">
                <div class="product-grid" id="productGrid">
                    
                    <!-- Rings -->
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (1).jpg" class="product-img" alt="Diamond Ring" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Solitaire+Ring'"/>
                        <div class="product-info">
                            <div class="product-title">Classic Solitaire Ring</div>
                            <div class="product-price">₹ 45,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Classic Solitaire Ring')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Necklaces -->
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (2).jpg" class="product-img" alt="Diamond Necklace" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Necklace'"/>
                        <div class="product-info">
                            <div class="product-title">Floral Diamond Necklace</div>
                            <div class="product-price">₹ 1,25,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Floral Diamond Necklace')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Earrings -->
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (3).jpg" class="product-img" alt="Diamond Earrings" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Studs'"/>
                        <div class="product-info">
                            <div class="product-title">Princess Cut Studs</div>
                            <div class="product-price">₹ 35,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Princess Cut Studs')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Bracelets -->
                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (4).jpg" class="product-img" alt="Diamond Bracelet" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Tennis+Bracelet'"/>
                        <div class="product-info">
                            <div class="product-title">Elegant Tennis Bracelet</div>
                            <div class="product-price">₹ 75,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Elegant Tennis Bracelet')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Pendants -->
                     <div class="product-card" data-category="pendants">
                        <img src="images/dimond (5).jpg" class="product-img" alt="Diamond Pendant" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Heart+Pendant'"/>
                        <div class="product-info">
                            <div class="product-title">Heart Shaped Pendant</div>
                            <div class="product-price">₹ 22,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Heart Shaped Pendant')">BUY NOW</button>
                        </div>
                    </div>
                     
                     <!-- More Products -->
                     <div class="product-card" data-category="rings">
                        <img src="images/dimond (7).jpg" class="product-img" alt="Diamond Ring" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Infinity+Ring'"/>
                        <div class="product-info">
                            <div class="product-title">Infinity Diamond Ring</div>
                            <div class="product-price">₹ 55,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Infinity Diamond Ring')">BUY NOW</button>
                        </div>
                    </div>

                     <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (8).jpg" class="product-img" alt="Diamond Necklace" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Set'"/>
                        <div class="product-info">
                            <div class="product-title">Bridal Set</div>
                            <div class="product-price">₹ 2,55,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Bridal Set')">BUY NOW</button>
                        </div>
                    </div>

                </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (6).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 6</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 6')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (9).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 9</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 9')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (10).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 10</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 10')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (11).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 11</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 11')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="pendants">
                        <img src="images/dimond (12).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 12</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 12')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (13).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 13</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 13')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (14).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 14</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 14')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (15).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 15</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 15')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (16).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 16</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 16')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="pendants">
                        <img src="images/dimond (17).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 17</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 17')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (18).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 18</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 18')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (19).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 19</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 19')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (20).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 20</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 20')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (21).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 21</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 21')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="pendants">
                        <img src="images/dimond (22).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 22</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 22')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (23).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 23</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 23')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (24).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 24</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 24')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (25).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 25</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 25')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (26).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 26</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 26')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="pendants">
                        <img src="images/dimond (27).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 27</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 27')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (28).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 28</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 28')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (29).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 29</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 29')">BUY NOW</button>
                        </div>
                    </div>

                    <div class="product-card" data-category="bracelets">
                        <img src="images/dimond (31).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 31</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 31')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="pendants">
                        <img src="images/dimond (32).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 32</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 32')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/dimond (33).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 33</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 33')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="necklaces">
                        <img src="images/dimond (34).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 34</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 34')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/dimond (35).jpg" class="product-img" alt="Diamond Item" onerror="this.src='https://via.placeholder.com/300x300/E1F5FE/333?text=Diamond+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Diamond Collection Item 35</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Diamond Collection Item 35')">BUY NOW</button>
                        </div>
                    </div>
                </div>
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

    <script>
        function filterProducts(category, btn) {
            // Update active button
            let buttons = document.querySelectorAll('.category-btn');
            buttons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            // Filter logic
            let products = document.querySelectorAll('.product-card');
            
            products.forEach(product => {
                if (category === 'all') {
                    product.style.display = 'block';
                } else {
                    if (product.getAttribute('data-category') === category) {
                        product.style.display = 'block';
                    } else {
                        product.style.display = 'none';
                    }
                }
            });
        }

        function addToCart(productName) {
            alert(productName + " has been added to your cart!");
        }
    </script>
</body>
</html>
