<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Silver Jewelry.aspx.cs" Inherits="Silver_Jewelry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Silver Collection | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        /* Reusing Core Styles */
        :root {
            --primary-gold: #D4AF37;
            --secondary-maroon: #800000;
            --silver-accent: #A0A0A0; /* Distinctive Silver Accent */
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
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/silver (6).jpg'); /* Fallback/Same Hero */
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            margin-top: 60px;
            border-bottom: 5px solid var(--silver-accent);
        }

        .page-hero h1 {
            font-size: 3.5rem;
            color: #fff; /* White title for Silver page */
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
            margin-bottom: 0.5rem;
        }
        
        .page-hero p {
            color: #ddd;
            font-size: 1.2rem;
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
            border-bottom: 2px solid var(--silver-accent);
            padding-bottom: 0.5rem;
            display: inline-block;
            color: var(--text-dark);
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
            background: #f0f0f0;
            color: #000;
            font-weight: 700;
            padding-left: 1rem;
            border-left: 3px solid var(--silver-accent);
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
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            transform: translateY(-5px);
            border-color: var(--silver-accent);
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
            color: var(--secondary-maroon);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .btn-buy {
            background: var(--text-dark);
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
            background: var(--silver-accent);
            color: #000;
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
                <h1>Sterling Silver Collection</h1>
                <p>Pure Elegance for Every Occasion</p>
            </div>
        </div>

        <!-- Catalog -->
        <div class="catalog-container">
            
            <!-- Sidebar -->
            <aside class="sidebar">
                <h3>Silver Categories</h3>
                <ul class="category-list">
                    <li><button type="button" class="category-btn active" onclick="filterProducts('all', this)">All Products</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('anklets', this)">Anklets (Payal)</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('chains', this)">Chains</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('rings', this)">Rings</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('earrings', this)">Earrings</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('bracelets', this)">Bracelets</button></li>
                    <li><button type="button" class="category-btn" onclick="filterProducts('utensils', this)">Silver Utensils</button></li>
                </ul>
            </aside>

            <!-- Product Grid -->
            <div class="product-grid-section">
                <div class="product-grid" id="productGrid">
                    
                    <!-- Anklets -->
                    <div class="product-card" data-category="anklets">
                        <img src="images/silver (1).jpg" class="product-img" alt="Silver Anklet" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Payal'"/>
                        <div class="product-info">
                            <div class="product-title">Traditional Wedding Payal</div>
                            <div class="product-price">₹ 15,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Traditional Wedding Payal')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Chains -->
                    <div class="product-card" data-category="chains">
                        <img src="images/silver (2).jpg" class="product-img" alt="Silver Chain" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Chain'"/>
                        <div class="product-info">
                            <div class="product-title">Men's Sterling Chain</div>
                            <div class="product-price">₹ 8,500</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Mens Sterling Chain')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Rings -->
                    <div class="product-card" data-category="rings">
                        <img src="images/silver (3).jpg" class="product-img" alt="Silver Ring" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Ring'"/>
                        <div class="product-info">
                            <div class="product-title">Gemstone Silver Ring</div>
                            <div class="product-price">₹ 3,200</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Gemstone Silver Ring')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Earrings -->
                    <div class="product-card" data-category="earrings">
                        <img src="images/silver (4).jpg" class="product-img" alt="Silver Earrings" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Earrings'"/>
                        <div class="product-info">
                            <div class="product-title">Oxidized Jhumkas</div>
                            <div class="product-price">₹ 2,800</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Oxidized Jhumkas')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Bracelets -->
                     <div class="product-card" data-category="bracelets">
                        <img src="images/silver (5).jpg" class="product-img" alt="Silver Bracelet" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Bracelet'"/>
                        <div class="product-info">
                            <div class="product-title">Charm Bracelet</div>
                            <div class="product-price">₹ 4,500</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Charm Bracelet')">BUY NOW</button>
                        </div>
                    </div>

                    <!-- Utensils -->
                     <div class="product-card" data-category="utensils">
                        <img src="images/silver (7).jpg" class="product-img" alt="Silver Plate" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Pooja+Thali'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Pooja Thali Set</div>
                            <div class="product-price">₹ 25,000</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Pooja Thali Set')">BUY NOW</button>
                        </div>
                    </div>
                     
                     <!-- More Products -->
                     <div class="product-card" data-category="anklets">
                        <img src="images/silver (8).jpg" class="product-img" alt="Silver Anklet" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Designer+Anklet'"/>
                        <div class="product-info">
                            <div class="product-title">Designer Anklet</div>
                            <div class="product-price">₹ 6,500</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Designer Anklet')">BUY NOW</button>
                        </div>
                    </div>
                     <div class="product-card" data-category="earrings">
                        <img src="images/silver (18).jpg" class="product-img" alt="Silver Earrings" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Earrings'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Studs</div>
                            <div class="product-price">₹ 2,500</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Studs')">BUY NOW</button>
                        </div>
                    </div>

                </div>

                    <div class="product-card" data-category="chains">
                        <img src="images/silver (9).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 9</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 9')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/silver (10).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 10</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 10')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/silver (11).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 11</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 11')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/silver (12).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 12</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 12')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="utensils">
                        <img src="images/silver (13).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 13</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 13')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="anklets">
                        <img src="images/silver (14).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 14</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 14')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="chains">
                        <img src="images/silver (15).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 15</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 15')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="rings">
                        <img src="images/silver (16).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 16</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 16')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="earrings">
                        <img src="images/silver (17).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 17</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 17')">BUY NOW</button>
                        </div>
                    </div>
                    <div class="product-card" data-category="bracelets">
                        <img src="images/silver (19).jpg" class="product-img" alt="Silver Item" onerror="this.src='https://via.placeholder.com/300x300/C0C0C0/333?text=Silver+Item'"/>
                        <div class="product-info">
                            <div class="product-title">Silver Collection Item 19</div>
                            <div class="product-price">₹ PA</div>
                            <button type="button" class="btn-buy" onclick="addToCart('Silver Collection Item 19')">BUY NOW</button>
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
