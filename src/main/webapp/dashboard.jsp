<%@ page import="java.util.List" %>
<%@ page import="com.inventoryy.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

String username =
(String)session.getAttribute("username");


if(username == null){

    response.sendRedirect("index.html");

    return;

}


%>



<!DOCTYPE html>

<html>


<head>


<title>
Inventory Dashboard
</title>



<style>

*{
    box-sizing:border-box;
}

body{
    margin:0;
    font-family:'Segoe UI',Arial,sans-serif;
    background:#f4f7fb;
    color:#333;
}

/* HEADER */

.header{
    height:70px;
    background:linear-gradient(135deg,#2563eb,#1e40af);
    color:white;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 30px;
    font-size:22px;
    font-weight:600;
    box-shadow:0 4px 12px rgba(0,0,0,0.20);
}

.header span{
    font-size:15px;
    font-weight:400;
}

.header a{
    color:white;
    text-decoration:none;
    font-size:15px;
}

.header a:hover{
    opacity:.8;
}


/* MAIN CONTAINER */

.container{
    display:flex;
    min-height:calc(100vh - 70px);
}


/* SIDEBAR */

.sidebar{
    width:240px;
    background:white;
    min-height:calc(100vh - 70px);
    box-shadow:2px 0 10px rgba(0,0,0,0.10);
    padding-top:20px;
}

.sidebar a{
    display:block;
    padding:16px 25px;
    text-decoration:none;
    color:#374151;
    font-size:16px;
    border-left:5px solid transparent;
    transition:.3s;
}

.sidebar a:hover{
    background:#eff6ff;
    color:#2563eb;
    border-left:5px solid #2563eb;
}


/* CONTENT */

.content{
    padding:35px;
    flex:1;
}

.content h1{
    margin-top:0;
    color:#1e293b;
}


/* DASHBOARD CARDS */

.cards{
    display:flex;
    gap:25px;
    width:100%;
    margin-top:25px;
}

.card{
    background:white;
    padding:25px;
    flex:1;
    min-height:140px;
    border-radius:15px;
    border:1px solid #eef2f7;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    transition:.3s;
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0 12px 25px rgba(0,0,0,0.12);
}

.card p{
    color:#64748b;
    font-size:16px;
    margin:0 0 10px 0;
}

/* BLUE - TOTAL PRODUCTS */

.card:nth-child(1) h2{
    color:#2563eb;
}

/* GREEN - IN STOCK */

.card:nth-child(2) h2{
    color:#16a34a;
}

/* RED - LOW STOCK */

.card:nth-child(3) h2{
    color:#dc2626;
}

.card h2{
    font-size:30px;
    margin:10px 0 0;
}

.cards .card:nth-child(1){
    border-left:5px solid #2563eb;
}

.cards .card:nth-child(1) h2{
    color:#2563eb;
}

.cards .card:nth-child(2){
    border-left:5px solid #15803d;
}

.cards .card:nth-child(2) h2{
    color:#15803d;
}

.cards .card:nth-child(3){
    border-left:5px solid #b91c1c;
}

.cards .card:nth-child(3) h2{
    color:#b91c1c;
}

/* PRODUCTS TABLE */

.products{
    margin-top:30px;
    background:white;
    padding:25px;
    border-radius:15px;
    border:1px solid #eef2f7;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
}

.products h2{
    margin-top:0;
    color:#1e293b;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#2563eb;
    color:white;
    padding:15px;
    text-align:left;
}

td{
    padding:15px;
    border-bottom:1px solid #e5e7eb;
    color:#374151;
}

tr:hover{
    background:#f8fafc;
}


/* LOW STOCK */

.low{
    color:#dc2626;
    font-weight:bold;
}


/* MOBILE */

@media(max-width:768px){

    .header{
        height:auto;
        padding:15px 20px;
        font-size:18px;
    }

    .container{
        display:block;
    }

    .sidebar{
        width:100%;
        min-height:auto;
        display:flex;
        flex-wrap:wrap;
        padding:0;
    }

    .sidebar a{
        flex:1 1 50%;
        text-align:center;
        padding:14px 10px;
        border-left:none;
    }

    .sidebar a:hover{
        border-left:none;
        border-bottom:3px solid #2563eb;
    }

    .content{
        padding:20px;
    }

    .cards{
        flex-direction:column;
    }

    .card{
        width:100%;
    }

    .products{
        overflow-x:auto;
    }

    table{
        min-width:650px;
    }
}

</style>


</head>



<body>



<div class="header">


📦 Inventory Management System


<span>

Welcome, <%= username %>


&nbsp;&nbsp;


<a href="logout">
🚪 Logout
</a>


</span>


</div>





<div class="container">


<div class="sidebar">


<a href="dashboard">

🏠 Dashboard

</a>



<a href="products">

📦 Products

</a>



<a href="add-product.jsp">

➕ Add Product

</a>



<a href="stock-management.html">

📊 Stock Management

</a>



<a href="low-stock">

⚠ Low Stock

</a>



<a href="logout">

🚪 Logout

</a>



</div>





<div class="content">


<h1>
Dashboard
</h1>



<div class="cards">


<div class="card">

<p>
Total Products
</p>

<h2>

<%= request.getAttribute("totalProducts") %>

</h2>


</div>




<div class="card">


<p>
In Stock
</p>


<h2>

<%= request.getAttribute("inStock") %>

</h2>


</div>




<div class="card">


<p>
Low Stock
</p>


<h2 class="low">

<%= request.getAttribute("lowStock") %>

</h2>


</div>



</div>





<div class="products">


<h2>
Recent Products
</h2>



<table>


<tr>

<th>ID</th>

<th>Name</th>

<th>Category</th>

<th>Price</th>

<th>Quantity</th>

</tr>



<%


List<Product> products =
(List<Product>)request.getAttribute("products");


for(Product p : products){


%>



<tr>


<td>
<%=p.getId()%>
</td>



<td>
<%=p.getName()%>
</td>



<td>
<%=p.getCategory()%>
</td>



<td>
₹<%=p.getPrice()%>
</td>



<td>

<%

if(p.getQuantity()<=5){

%>


<span class="low">

<%=p.getQuantity()%> ⚠

</span>


<%

}
else{

%>


<%=p.getQuantity()%>


<%

}

%>


</td>



</tr>



<%

}

%>



</table>



</div>


</div>


</div>



</body>


</html>