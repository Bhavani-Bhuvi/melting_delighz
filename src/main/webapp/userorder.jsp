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

<title>Edit Profile</title>
</head>
<body style="background-color:#f7f7f7">

<%@ include file="all_component/navbar.jsp" %> 

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<div class="container">

<table class="table table-striped mt-5 p-4">
  <thead style="background-color:#b16cb8; color:white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Cake Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Mode</th>
      
    </tr>
  </thead>
  <tbody>
  
   <% User u =(User) session.getAttribute("userobj");
  OrderDAOImpl dao= new OrderDAOImpl(DBConnect.getConn()); 
  List<CakeOrder> clist= dao.getCake(u.getEmail());
  for(CakeOrder c : clist){
  %>
    <tr>
      <th scope="row"><%=c.getOrderid() %></th>
      <td><%=c.getName()%></td>
      <td><%=c.getCakename()%></td>
      <td><%=c.getPrice()%></td> 
            <td><%=c.getPayment()%></td>
      
    </tr>
   <%
    }%>
  </tbody>
</table></div>

<%@ include file="all_component/footer.jsp" %> 

</body>
</html>