<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="css/style.css">
    <meta charset="UTF-8">

    <title>Search Result - Inventory Management</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f6f8;
        }

        .header {
            background: #222;
            color: white;
            padding: 20px;
            font-size: 24px;
        }

        .container {
            display: flex;
        }

        .sidebar {
            width: 220px;
            background: white;
            min-height: calc(100vh - 68px);
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            padding: 15px 25px;
            text-decoration: none;
            color: #333;
        }

        .sidebar a:hover {
            background: #eee;
        }

        .content {
            padding: 30px;
            flex: 1;
        }

        .content h1 {
            margin-top: 0;
        }

        .result-card {
            background: white;
            width: 500px;
            padding: 25px;
            margin-top: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .detail {
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .detail strong {
            display: inline-block;
            width: 130px;
        }

        .not-found {
            background: white;
            padding: 25px;
            margin-top: 25px;
            width: 450px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            color: #1565c0;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

    <div class="header">
        📦 Inventory Management System
    </div>

    <div class="container">

        <div class="sidebar">

            <a href="dashboard">🏠 Dashboard</a>

            <a href="products">📦 Products</a>

            <a href="add-product.html">➕ Add Product</a>

            <a href="stock-management.html">📊 Stock Management</a>

            <a href="low-stock">⚠ Low Stock</a>

            <a href="index.html">🚪 Logout</a>

        </div>

        <div class="content">

            <h1>🔍 Search Result</h1>

            <% if (request.getAttribute("message") != null) { %>

                <div class="not-found">

                    <h3>❌ <%= request.getAttribute("message") %></h3>

                    <p>
                        Please check the product ID and try again.
                    </p>

                </div>

            <% } else { %>

                <div class="result-card">

                    <div class="detail">
                        <strong>Product ID:</strong>
                        <%= request.getAttribute("id") %>
                    </div>

                    <div class="detail">
                        <strong>Product Name:</strong>
                        <%= request.getAttribute("name") %>
                    </div>

                    <div class="detail">
                        <strong>Category:</strong>
                        <%= request.getAttribute("category") %>
                    </div>

                    <div class="detail">
                        <strong>Price:</strong>
                        ₹<%= request.getAttribute("price") %>
                    </div>

                    <div class="detail">
                        <strong>Quantity:</strong>
                        <%= request.getAttribute("quantity") %>
                    </div>

                </div>

            <% } %>

            <a class="back-link" href="search-product.html">
                ← Search Another Product
            </a>

            <br>

            <a class="back-link" href="products">
                ← Back to Products
            </a>

        </div>

    </div>

</body>

</html>