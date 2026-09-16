<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.inventoryy.Product" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Products - Inventory Management System</title>

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>

        /* =========================
           PRODUCT TOOLBAR
        ========================= */

        .product-toolbar {

            display: flex;

            gap: 15px;

            margin-top: 20px;

            margin-bottom: 20px;

            align-items: center;

        }


        .search-box {

            position: relative;

            flex: 1;

        }


        .search-box i {

            position: absolute;

            left: 15px;

            top: 14px;

            color: #64748b;

        }


        .search-box input {

            padding-left: 42px;

            margin: 0;

        }


        .category-filter {

            width: 220px;

        }


        .category-filter select {

            margin: 0;

        }


        .product-count {

            color: #64748b;

            font-size: 14px;

            margin-bottom: 15px;

        }


        .no-results {

            text-align: center;

            padding: 30px;

            color: #64748b;

        }


        /* =========================
           ACTION BUTTONS
        ========================= */

        .action-buttons {

            display: flex;

            gap: 8px;

        }


        .edit-btn {

            background: #16a34a;

        }


        .delete-btn {

            background: #dc2626;

        }


        /* =========================
           MOBILE
        ========================= */

        @media(max-width:768px) {

            .product-toolbar {

                flex-direction: column;

                align-items: stretch;

            }


            .category-filter {

                width: 100%;

            }


            .table-box {

                overflow-x: auto;

            }

        }
		/* =========================
   PRODUCTS PAGE POLISH
========================= */

.content h1 {
    color: #1e293b;
    margin-top: 0;
    margin-bottom: 20px;
}

/* Add Product button */
.btn-primary {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    box-shadow: 0 4px 10px rgba(37, 99, 235, 0.20);
}

.btn-primary:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af);
}

/* Product table container */
.table-box {
    margin-top: 25px;
    border: 1px solid #e5e7eb;
}

/* Table heading */
.table-box h2 {
    color: #1e293b;
    margin-top: 0;
    margin-bottom: 20px;
}

/* Table header */
#productTable th {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: white;
    padding: 15px;
    font-size: 14px;
}

/* Table cells */
#productTable td {
    padding: 15px;
    vertical-align: middle;
}

/* Product rows */
#productTable tbody tr {
    transition: 0.2s;
}

#productTable tbody tr:hover {
    background: #f8fafc;
}

/* Search box */
.search-box input {
    height: 44px;
    border: 1px solid #cbd5e1;
    border-radius: 10px;
}

/* Category dropdown */
.category-filter select {
    height: 44px;
    border-radius: 10px;
    border: 1px solid #cbd5e1;
}

/* Quantity warning */
.low {
    color: #b91c1c;
    font-weight: 700;
}
/* Action buttons */
.action-buttons .btn {
    padding: 9px 13px;
    font-size: 13px;
}

.edit-btn {
    background: #15803d;
}

.delete-btn {
    background: #b91c1c;
}

.edit-btn:hover {
    background: #166534;
}

.delete-btn:hover {
    background: #991b1b;
}
/* Product count */
.product-count {
    background: #f8fafc;
    padding: 10px 12px;
    border-radius: 8px;
    display: inline-block;
}

#visibleCount {
    font-weight: 700;
    color: #2563eb;
}
    </style>

</head>


<body>


<!-- =========================
     HEADER
========================= -->

<div class="header">

    <div>

        <i class="fa-solid fa-boxes-stacked"></i>

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

        <i class="fa-solid fa-boxes-stacked"></i>

        Products

    </h1>


    <a href="add-product.jsp"
       class="btn btn-primary">

        <i class="fa-solid fa-plus"></i>

        Add Product

    </a>



    <div class="table-box">


        <h2>

            Product Inventory

        </h2>



        <!-- SEARCH + FILTER -->

        <div class="product-toolbar">


            <div class="search-box">

                <i class="fa-solid fa-magnifying-glass"></i>

                <input
                    type="text"
                    id="searchInput"
                    placeholder="Search product name or category..."
                    onkeyup="filterProducts()">

            </div>



            <div class="category-filter">

                <select
                    id="categoryFilter"
                    onchange="filterProducts()">

                    <option value="all">

                        All Categories

                    </option>


                    <%

                    List<Product> products =
                    (List<Product>)request.getAttribute("products");


                    if(products != null){

                        java.util.Set<String> categories =
                        new java.util.HashSet<>();


                        for(Product product : products){

                            categories.add(
                                product.getCategory()
                            );

                        }


                        for(String category : categories){

                    %>

                    <option value="<%=category%>">

                        <%=category%>

                    </option>

                    <%

                        }

                    }

                    %>

                </select>

            </div>


        </div>



        <div class="product-count">

            Showing
            <span id="visibleCount">0</span>
            products

        </div>



        <!-- PRODUCT TABLE -->

        <table id="productTable">


            <thead>

                <tr>

                    <th>ID</th>

                    <th>Product Name</th>

                    <th>Category</th>

                    <th>Price</th>

                    <th>Quantity</th>

                    <th>Actions</th>

                </tr>

            </thead>



            <tbody>


            <%

            if(products != null){

                for(Product product : products){

            %>


            <tr class="product-row">


                <td>

                    <%=product.getId()%>

                </td>



                <td>

                    <%=product.getName()%>

                </td>



                <td>

                    <%=product.getCategory()%>

                </td>



                <td>

                    Rs. <%=product.getPrice()%>

                </td>



                <td>


                    <%

                    if(product.getQuantity() <= 5){

                    %>

                    <span class="low">

                        <%=product.getQuantity()%>

                        <i class="fa-solid fa-triangle-exclamation"></i>

                    </span>

                    <%

                    }
                    else{

                    %>

                    <%=product.getQuantity()%>

                    <%

                    }

                    %>


                </td>



                <td>

                    <div class="action-buttons">


                        <a
                            href="edit-product?id=<%=product.getId()%>"
                            class="btn edit-btn">

                            <i class="fa-solid fa-pen"></i>

                            Edit

                        </a>



                        <a
                            href="delete-product?id=<%=product.getId()%>"
                            class="btn delete-btn"
                            onclick="return confirm('Delete this product?');">

                            <i class="fa-solid fa-trash"></i>

                            Delete

                        </a>


                    </div>

                </td>


            </tr>


            <%

                }

            }

            %>


            </tbody>


        </table>



        <div
            id="noResults"
            class="no-results"
            style="display:none;">

            <i class="fa-solid fa-box-open"></i>

            <br><br>

            No products found.

        </div>


    </div>


</div>


</div>



<!-- =========================
     SEARCH SCRIPT
========================= -->

<script>

function filterProducts() {


    const searchInput =
        document.getElementById("searchInput")
        .value
        .toLowerCase();


    const categoryFilter =
        document.getElementById("categoryFilter")
        .value
        .toLowerCase();


    const rows =
        document.querySelectorAll(".product-row");


    let visible = 0;


    rows.forEach(function(row) {


        const name =
            row.cells[1]
            .textContent
            .toLowerCase();


        const category =
            row.cells[2]
            .textContent
            .toLowerCase();


        const matchesSearch =
            name.includes(searchInput) ||
            category.includes(searchInput);


        const matchesCategory =
            categoryFilter === "all" ||
            category === categoryFilter;


        if(matchesSearch && matchesCategory){

            row.style.display = "";

            visible++;

        }
        else{

            row.style.display = "none";

        }

    });


    document.getElementById("visibleCount")
        .textContent = visible;


    if(visible === 0){

        document.getElementById("noResults")
            .style.display = "block";

    }
    else{

        document.getElementById("noResults")
            .style.display = "none";

    }

}


/* Show count when page opens */

filterProducts();

</script>


</body>

</html>