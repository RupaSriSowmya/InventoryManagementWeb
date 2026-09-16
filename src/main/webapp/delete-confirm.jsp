<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/style.css">
<title>Delete Product</title>


<style>

body {

    margin:0;
    font-family:Arial;
    background:#f5f6f8;

}


.header {

    background:#222;
    color:white;
    padding:20px;
    font-size:24px;

}


.container {

    padding:40px;

}


.card {

    background:white;
    width:400px;
    padding:30px;
    border-radius:8px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);

}


button {

    padding:10px 20px;
    border:none;
    border-radius:5px;
    cursor:pointer;

}


.delete {

    background:#c62828;
    color:white;

}


.cancel {

    background:#ddd;
    color:black;
    text-decoration:none;
    padding:10px 20px;
    border-radius:5px;

}


</style>


</head>


<body>


<div class="header">

📦 Inventory Management System

</div>


<div class="container">


<div class="card">


<h2>⚠ Delete Product</h2>


<p>
Are you sure you want to delete this product?
</p>


<form action="delete-product" method="get">


<input 
type="hidden" 
name="id" 
value="<%=request.getAttribute("id")%>"
>


<input
type="hidden"
name="action"
value="delete"
>


<button class="delete" type="submit">

Delete

</button>


<a class="cancel" href="products">

Cancel

</a>


</form>


</div>


</div>


</body>

</html>