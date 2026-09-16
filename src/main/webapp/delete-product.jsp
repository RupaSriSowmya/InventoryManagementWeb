<%@ page import="com.inventoryy.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
Product product = (Product) request.getAttribute("product");

if (product == null) {
    response.sendRedirect("products");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Delete Product - Inventory Management System</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f7fb;
    color: #334155;
}

/* ================= HEADER ================= */

.header {
    height: 70px;

    background: linear-gradient(135deg, #2563eb, #1e40af);

    color: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 30px;

    font-size: 20px;
    font-weight: 600;

    box-shadow: 0 4px 14px rgba(0,0,0,0.15);
}

.header a {
    color: white;
    text-decoration: none;

    font-size: 14px;
    font-weight: 500;
}

.header i {
    margin-right: 8px;
}

/* ================= LAYOUT ================= */

.container {
    display: flex;
    min-height: calc(100vh - 70px);
}

/* ================= SIDEBAR ================= */

.sidebar {
    width: 240px;

    background: white;

    min-height: calc(100vh - 70px);

    padding-top: 18px;

    box-shadow: 2px 0 12px rgba(0,0,0,0.08);
}

.sidebar a {
    display: flex;
    align-items: center;

    padding: 15px 22px;

    color: #475569;

    text-decoration: none;

    font-size: 14px;

    border-left: 4px solid transparent;

    transition: 0.2s;
}

.sidebar a i {
    width: 22px;

    margin-right: 8px;

    text-align: center;
}

.sidebar a:hover {
    background: #eff6ff;

    color: #2563eb;

    border-left-color: #2563eb;
}

/* ================= CONTENT ================= */

.content {
    flex: 1;

    padding: 40px;
}

.content h1 {
    margin: 0 0 25px;

    color: #1e293b;

    font-size: 28px;
}

.content h1 i {
    color: #b91c1c;

    margin-right: 8px;
}

/* ================= DELETE CARD ================= */

.delete-card {
    max-width: 650px;

    margin: 20px auto;

    background: white;

    border-radius: 16px;

    padding: 40px;

    text-align: center;

    border: 1px solid #e5e7eb;

    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
}

/* WARNING ICON */

.warning-icon {
    width: 72px;
    height: 72px;

    margin: 0 auto 20px;

    border-radius: 50%;

    background: #fee2e2;

    color: #b91c1c;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 32px;
}

.delete-card h2 {
    margin: 0 0 10px;

    color: #b91c1c;

    font-size: 24px;
}

.delete-card > p {
    margin: 0 0 25px;

    color: #64748b;

    font-size: 15px;
}

/* ================= PRODUCT DETAILS ================= */

.product-details {
    background: #f8fafc;

    border: 1px solid #e2e8f0;

    border-radius: 10px;

    padding: 18px 22px;

    margin-bottom: 28px;

    text-align: left;
}

.detail-row {
    display: flex;

    justify-content: space-between;

    align-items: center;

    padding: 11px 0;

    border-bottom: 1px solid #e2e8f0;

    font-size: 14px;
}

.detail-row:last-child {
    border-bottom: none;
}

.detail-label {
    color: #475569;

    font-weight: 600;
}

.detail-value {
    color: #1e293b;

    font-weight: 500;
}

/* ================= BUTTONS ================= */

.form-actions {
    display: flex;

    justify-content: center;

    gap: 12px;
}

.btn {
    border: none;

    border-radius: 8px;

    padding: 12px 28px;

    color: white;

    text-decoration: none;

    font-size: 14px;

    font-weight: 600;

    cursor: pointer;

    transition: 0.2s;
}

.delete-btn {
    background: #b91c1c;
}

.delete-btn:hover {
    background: #991b1b;

    transform: translateY(-1px);
}

.cancel-btn {
    background: #64748b;
}

.cancel-btn:hover {
    background: #475569;

    transform: translateY(-1px);
}

.btn i {
    margin-right: 7px;
}

/* ================= MOBILE ================= */

@media (max-width: 768px) {

    .container {
        display: block;
    }

    .sidebar {
        width: 100%;

        min-height: auto;
    }

    .content {
        padding: 20px;
    }

    .delete-card {
        padding: 25px;

        margin: 10px 0;
    }

    .form-actions {
        flex-direction: column;
    }

    .btn {
        width: 100%;
    }

}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">

    <div>
        <i class="fa-solid fa-box"></i>
        Inventory Management System
    </div>

    <div>
        <a href="logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>
    </div>

</div>


<div class="container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <a href="dashboard">
            <i class="fa-solid fa-house"></i>
            Dashboard
        </a>

        <a href="products">
            <i class="fa-solid fa-boxes-stacked"></i>
            Products
        </a>

        <a href="add-product.jsp">
            <i class="fa-solid fa-plus"></i>
            Add Product
        </a>

        <a href="stock-management.html">
            <i class="fa-solid fa-chart-column"></i>
            Stock Management
        </a>

        <a href="low-stock">
            <i class="fa-solid fa-triangle-exclamation"></i>
            Low Stock
        </a>

        <a href="logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>


    <!-- CONTENT -->

    <div class="content">

        <h1>
            <i class="fa-solid fa-trash"></i>
            Delete Product
        </h1>


        <div class="delete-card">

            <div class="warning-icon">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>


            <h2>Delete Product?</h2>

            <p>
                Are you sure you want to delete this product?
            </p>


            <!-- PRODUCT DETAILS -->

            <div class="product-details">

                <div class="detail-row">

                    <span class="detail-label">
                        Product Name
                    </span>

                    <span class="detail-value">
                        <%= product.getName() %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="detail-label">
                        Category
                    </span>

                    <span class="detail-value">
                        <%= product.getCategory() %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="detail-label">
                        Price
                    </span>

                    <span class="detail-value">
                        ₹<%= product.getPrice() %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="detail-label">
                        Quantity
                    </span>

                    <span class="detail-value">
                        <%= product.getQuantity() %>
                    </span>

                </div>

            </div>


            <!-- ACTIONS -->

            <form action="delete-product" method="post">

                <input type="hidden"
                       name="id"
                       value="<%= product.getId() %>">


                <div class="form-actions">

                    <button type="submit"
                            class="btn delete-btn">

                        <i class="fa-solid fa-trash"></i>
                        Delete

                    </button>


                    <a href="products"
                       class="btn cancel-btn">

                        <i class="fa-solid fa-xmark"></i>
                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

</body>

</html>