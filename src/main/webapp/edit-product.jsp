<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.inventoryy.Product" %>

<%
Product product = (Product) request.getAttribute("product");

if(product == null){
response.sendRedirect("products");
return;
}
%>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Edit Product - Inventory System</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

    /* =========================
       EDIT PRODUCT FORM
    ========================= */

    .product-form {
        max-width: 650px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #334155;
        font-weight: 600;
    }

    .form-group label i {
        color: #2563eb;
        margin-right: 7px;
    }

    .form-group input {
        width: 100%;
        padding: 13px 14px;
        border: 1px solid #cbd5e1;
        border-radius: 9px;
        font-size: 15px;
        outline: none;
        background: white;
        transition: .2s;
    }

    .form-group input:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37,99,235,.10);
    }

    .form-actions {
        display: flex;
        gap: 10px;
        margin-top: 25px;
    }

    /* Softer professional buttons */

    .form-actions .btn-success {
        background: #15803d;
    }

    .form-actions .btn-success:hover {
        background: #166534;
    }

    .form-actions .btn-danger {
        background: #b91c1c;
    }

    .form-actions .btn-danger:hover {
        background: #991b1b;
    }

    @media(max-width:600px) {

        .form-actions {
            flex-direction: column;
        }

        .form-actions .btn {
            width: 100%;
            text-align: center;
        }

    }

</style>

</head>

<body>

<!-- =========================
     HEADER
========================= -->

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

<!-- =========================
     MAIN CONTAINER
========================= -->

<div class="container">


<!-- =========================
     SIDEBAR
========================= -->

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

        <i class="fa-solid fa-chart-line"></i>

        Stock Management

    </a>


    <a href="low-stock">

        <i class="fa-solid fa-triangle-exclamation"></i>

        Low Stock

    </a>


    <a href="logout">

        <i class="fa-solid fa-power-off"></i>

        Logout

    </a>

</div>


<!-- =========================
     CONTENT
========================= -->

<div class="content">


    <h1>

        <i class="fa-solid fa-pen-to-square"></i>

        Edit Product

    </h1>


    <div class="table-box product-form">


        <h2>

            <i class="fa-solid fa-box"></i>

            Product Details

        </h2>


        <!-- =========================
             FORM
        ========================= -->

        <form action="edit-product" method="post">


            <!-- PRODUCT ID -->

            <input
                type="hidden"
                name="id"
                value="<%=product.getId()%>">


            <!-- PRODUCT NAME -->

            <div class="form-group">

                <label>

                    <i class="fa-solid fa-tag"></i>

                    Product Name

                </label>

                <input
                    type="text"
                    name="name"
                    value="<%=product.getName()%>"
                    required>

            </div>


            <!-- CATEGORY -->

            <div class="form-group">

                <label>

                    <i class="fa-solid fa-layer-group"></i>

                    Category

                </label>

                <input
                    type="text"
                    name="category"
                    value="<%=product.getCategory()%>"
                    required>

            </div>


            <!-- PRICE -->

            <div class="form-group">

                <label>

                    <i class="fa-solid fa-money-bill"></i>

                    Price

                </label>

                <input
                    type="number"
                    step="0.01"
                    min="0"
                    name="price"
                    value="<%=product.getPrice()%>"
                    required>

            </div>


            <!-- QUANTITY -->

            <div class="form-group">

                <label>

                    <i class="fa-solid fa-boxes-stacked"></i>

                    Quantity

                </label>

                <input
                    type="number"
                    name="quantity"
                    value="<%=product.getQuantity()%>"
                    min="0"
                    required>

            </div>


            <!-- BUTTONS -->

            <div class="form-actions">

                <button
                    type="submit"
                    class="btn btn-success">

                    <i class="fa-solid fa-floppy-disk"></i>

                    Update Product

                </button>


                <a
                    href="products"
                    class="btn btn-danger">

                    <i class="fa-solid fa-xmark"></i>

                    Cancel

                </a>

            </div>


        </form>


    </div>


</div>
```

</div>

</body>

</html>
