<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_component/allCss.jsp" %> 

<title>Order Success</title>
</head>
<body style="background-color:#f7f7f7">
<%@ include file="all_component/navbar.jsp" %> 
<br><br>
<div class="container text-center mt-3">
<i class="fas fa-check-circle fa-5x text-success"></i>
<h1>Thank You</h1>
<h2>Your Order Successfully Placed</h2>
<h5>With in 7 Days. Your product will be delivered in your address.</h5>
<a href="index.jsp" class="btn btn-demo mt-3"><i class="fa-solid fa-house-chimney"></i> Home</a>
<a href="userorder.jsp" class="btn btn-demo mt-3">View Order</a>


</div>
<br><br><br>
<%@ include file="all_component/footer.jsp" %> 

</body>
</html>