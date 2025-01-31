<%@ page import="com.DAO.*, com.DB.*, com.entity.*, com.admin.servlet.*, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="allCss.jsp" %> 

<title>Admin:All Cakes</title>
</head>
<body>
<%@ include file="navbar.jsp" %> 
<h3 class="text-center">Hello Admin</h3>

<c:if test="${not empty succMsg }">
<p class="text-center text-success"> ${succMsg} </p>
<c:remove var="succMsg" scope="session" />
</c:if>
<c:if test="${not empty failedMsg }">
<p class="text-center text-danger"> ${failedMsg} </p>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>

<table class="table table-stripeda">
  <thead style="background-color:black;color:white">
    <tr >
      <th scope="col">Id</th>
      <th scope="col">Image</th>      
      <th scope="col">Cake Name</th>
      <th scope="col">Flavour</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  CakesDAOImpl dao= new CakesDAOImpl(DBConnect.getConn());
  List <CakeDetails> list = dao.getAllCakes();
  for(CakeDetails c : list){%>
   <tr>
      
            <td><%=c.getCakeId() %></td>
            <td>
     
               <img src="../images/<%=c.getPhoto() %>"
             style="width:50px;height:50px;" alt="...">      
            </td>            
            <td><%=c.getCakename() %></td>
            <td><%=c.getFlavour() %></td>            
            <td><%=c.getPrice() %></td>
            <td><%=c.getStatus() %></td>
<td>      
      <a href="edit_cakes.jsp?id=<%=c.getCakeId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
            <a href="../delete?id=<%=c.getCakeId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
      
      </td>
      
    </tr>
  
  
  
  <% }%>
  
 
   
   
  </tbody>
</table>
<%@ include file="footer.jsp" %> 
</body>
</html>