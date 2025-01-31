<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="allCss.jsp" %> 
<style type="text/css">
a{
text-decoration:none;
color:black
}
a:hover{
text-decoration:none;
color:black
}
</style>

<title>Admin Home Page</title>
</head>
<body style="background-color:#f7f7f7">
<%@ include file="navbar.jsp" %> 

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>

<div class="container">
<div class="row p-5">

<div class="col-md-3">
<a href="add_cakes.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
<h4>Add Cakes</h4>
------------
</div></div></a></div>
<div class="col-md-3">
<a href="allcakes.jsp">

<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-cake-candles fa-3x text-success"></i><br>
<h4>All Cakes</h4>
------------
</div></div></a></div>
<div class="col-md-3">
<a href="orders.jsp">

<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
<h4>Orders</h4>
------------
</div></div></a></div>

<div class="col-md-3">
<a data-toggle="modal" data-target="#exampleModalCenter">
<div class="card">
<div class="card-body text-center">
<i class="fas fa-sign-in-alt fa-3x text-primary"></i><br>
<h4>Logout</h4>
------------
</div></div></a></div>
</div>
</div>
<div style="margin-top:170px">
<%@ include file="footer.jsp" %> 
</div>

</body>
</html>