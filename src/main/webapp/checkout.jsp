<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
         <%@ page import="com.DAO.*, com.DB.*, com.entity.*, com.admin.servlet.*, java.util.List" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_component/allCss.jsp" %> 

<title>Cart</title>
</head>
<body style="background-color:#f7f7f7">

<%@ include file="all_component/navbar.jsp" %> 


<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>


<c:if test="${not empty succMsg }">
<div class="alert alert-success" role="alert"> ${succMsg} </div>
<c:remove var="succMsg" scope="session" />
</c:if>
<c:if test="${not empty failedMsg }">
<div class="alert alert-danger text-center" role="alert"> ${failedMsg} </div>
<c:remove var="failedMsg" scope="session"/>
</c:if>


<div class="container p-3">
<div class="row">
<div class="col-md-6">
<div class="card bg-white">
<div class="card-body">
<h3 class="text-center" style="	color:#b16cb8;
">Your Selected Item</h3><br>
<table class="table table-stripeda">
  <thead style="background-color:black;color:white">
    <tr >
      <th scope="col">Cake Name</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
 
    </tr>
  </thead>
  <tbody>
  
  <%User u =(User) session.getAttribute("userobj");
  CartDAOImpl dao= new CartDAOImpl(DBConnect.getConn()); 
  List<Cart> cart= dao.getCakeByUser(u.getId());
  Double totalprice=0.00;
  for(Cart ca : cart){
  totalprice= ca.getTotalprice();
  %>
    <tr>
      <th scope="row"><%=ca.getCakename() %></th>
      <td><%=ca.getPrice() %></td>
      <td>
      <a href="removecake?ckid=<%=ca.getCkid()%>&&uid=<%=ca.getUid()%>&&cid=<%=ca.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
     
      
    </tr> 
    <%
    }%>
    
    <tr>
    <td>Total Price</td>
    <td></td>
    <td><%=totalprice %></td>
    </tr>
  </tbody>
</table>



</div></div></div>

<div class="col-md-6">
<div class="card bg-white">
<div class="card-body">
<h3 class="text-center" style="	color:#b16cb8;
">Your Details for Order</h3><br>
<form action="order" method="post"> 
<input type="hidden" value="${userobj.id}" name="id" >

<div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Name</label>
      <input name="name" type="text" class="form-control" id="inputEmail4" value="${userobj.name}" required></div>
    <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Email</label>
      <input name="email" type="email" class="form-control" id="inputEmail4" value="${userobj.email}" required></div></div>
     
     <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Phone Number</label>
      <input name="phone" type="number" class="form-control" id="inputEmail4" value="${userobj.phone_no}" required></div>
   <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Address</label>
      <input name="address" type="text" class="form-control" id="inputEmail4" required></div></div>
      
      <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Landmark</label>
      <input name="landmark" type="text" class="form-control" id="inputEmail4" required></div>
   <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">City</label>
      <input name="city" type="text" class="form-control" id="inputEmail4" required></div></div>
      
            <div class="form-row">
      
      <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">State</label>
      <input name="state" type="text" class="form-control" id="inputEmail4" required></div>
   <div class="form-group col-md-6">
      <label for="inputEmail4" class="form-label">Pincode</label>
      <input name="pincode" type="text" class="form-control" id="inputEmail4" required></div></div>
      
     
     <div class="form-group ">
      <label for="inputEmail4" class="form-label" >Payment Mode</label>
      <select class="form-control" name="payment">
      <option value="noselect">--Select--</option>
            <option value="COD">Cash On Delivery</option>
      </select></div>
      
      <div class="text-center">
      
      <button class="btn btn-demo">Order Now</button>
      <a href="index.jsp" btn-demo" class="btn btn-demo">Continue Shopping</a>
      </div>
      
</form>


</div></div></div>

</div></div>
<%@include file="all_component/footer.jsp"%> 

</body>
</html>