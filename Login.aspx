<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | Shree Jewelers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />
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
            background-color: var(--light-bg);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/gold (22).jpg');
            background-size: cover;
            background-position: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
            border-top: 5px solid var(--primary-gold);
        }

        h2 {
            font-family: 'Playfair Display', serif;
            color: var(--secondary-maroon);
            margin-bottom: 2rem;
            font-size: 2rem;
        }

        .form-group {
            margin-bottom: 1.2rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 700;
            color: var(--text-dark);
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: 'Lato', sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-gold);
            box-shadow: 0 0 5px rgba(212, 175, 55, 0.5);
        }

        .btn-login {
            width: 100%;
            padding: 1rem;
            background: var(--secondary-maroon);
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
            margin-top: 1rem;
        }

        .btn-login:hover {
            background: #a00000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(128, 0, 0, 0.4);
        }

        .error-message {
            color: #d9534f;
            margin-top: 1rem;
            font-size: 0.9rem;
            font-weight: 700;
        }

        .logo-text {
            color: var(--primary-gold);
            font-size: 1.5rem;
            font-weight: 700;
            letter-spacing: 2px;
            margin-bottom: 0.5rem;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <span class="logo-text">SHREE JEWELERS</span>
            <h2>Member Login</h2>
            
            <div class="form-group">
                <label>User Name</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>User ID</label>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" placeholder="Enter User ID"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
            
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
