<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
         <%@ page import="com.DAO.*, com.DB.*, com.entity.*, com.admin.servlet.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="allCss.jsp" %> 

<title>Admin:Orders</title>
</head>
<body>
<%@ include file="navbar.jsp" %> 

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>
<h3 class="text-center">Hello Admin</h3>
<table class="table table-stripeda">
  <thead style="background-color:black;color:white">
    <tr >
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>      
      <th scope="col">Phone No</th>
      <th scope="col">Cake Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
 </tr>
  </thead>
  <tbody>
  
   <% 
  OrderDAOImpl dao= new OrderDAOImpl(DBConnect.getConn()); 
  List<CakeOrder> clist= dao.getAllOrder();
  for(CakeOrder c : clist){
  %>
    <tr>
      <th scope="row"><%=c.getOrderid() %></th>
      <td><%=c.getName() %></td>
      <td><%=c.getEmail() %></td>
      <td><%=c.getFulladd() %></td>
      <td><%=c.getPhone() %></td>
      <td><%=c.getCakename() %></td>
      <td><%=c.getPrice() %></td>
      <td><%=c.getPayment() %></td>
      
      
    </tr>
  <%
    }%>
  </tbody>
</table>
<%@ include file="footer.jsp" %> 
</body>
</html>