<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.inventoryy.Product" %>


<!DOCTYPE html>

<html>


<head>


<title>
Low Stock Products - Inventory System
</title>



<link rel="stylesheet" href="css/style.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<style>


.warning-box{


background:#fff7ed;

border-left:6px solid #f97316;

padding:20px;

border-radius:12px;

margin-bottom:25px;

}



.warning-box h2{

color:#ea580c;

margin:0;

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








<!-- CONTENT -->


<div class="content">



<h1>

<i class="fa-solid fa-triangle-exclamation"></i>

Low Stock Products

</h1>







<div class="warning-box">


<h2>

Products requiring attention

</h2>


<p>

Products with quantity less than or equal to 5 are shown here.

</p>


</div>









<div class="table-box">



<table>


<tr>


<th>
ID
</th>


<th>
Product Name
</th>


<th>
Category
</th>


<th>
Price
</th>


<th>
Available Quantity
</th>



</tr>







<%


List<Product> products =

(List<Product>)request.getAttribute("products");



if(products != null && products.size() > 0){



for(Product product : products){



%>





<tr>


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


<span class="low">


<i class="fa-solid fa-triangle-exclamation"></i>


<%=product.getQuantity()%>


</span>



</td>



</tr>




<%


}


}

else{


%>




<tr>


<td colspan="5" style="text-align:center;">


<i class="fa-solid fa-circle-check"></i>


No low-stock products found


</td>


</tr>





<%


}


%>




</table>



</div>







<br>



<a href="products"

class="btn btn-primary">


<i class="fa-solid fa-arrow-left"></i>

Back to Products


</a>




<a href="dashboard"

class="btn btn-success">


<i class="fa-solid fa-house"></i>

Dashboard


</a>







</div>





</div>








</body>


</html>