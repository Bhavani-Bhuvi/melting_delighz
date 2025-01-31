<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.DAO.*, com.DB.*, com.entity.*, com.admin.servlet.*, java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.back-img{
background:url("images/bg.jpg");
height:80vh;
width:100%;
background-repeat:no-repeat;
background-size:cover;
}

</style>
<%@ include file="all_component/allCss.jsp" %> 
<title>Melting Delightz : Index Page</title>

</head>
<body style="background-color:#f7f7f7">
<%
User u= (User) session.getAttribute("userobj");
%>

<%@ include file="all_component/navbar.jsp" %> 
<div class="container-fluid back-img" ></div>


<!-- Start Theme Cake -->

<div class="container mt-3">
<h3 class="text-center mb-3">Theme Cakes</h3>
<div class="row">
<%
  CakesDAOImpl dao= new CakesDAOImpl(DBConnect.getConn());
  List <CakeDetails> list = dao.getEggless();
  for(CakeDetails c : list){%>
<div class="col-md-3">
  
<div class="card" style="width:17rem;">
    <img src="images/<%=c.getPhoto() %>"
             alt="...">
    <div class="card-body">
  
    <p><%= c.getCakename() %> </p>
    <p><%= c.getFlavour() %></p>
    
<h6>₹<%= c.getPrice() %></h6><br>
<div class="row">
<%
if(u == null){
%>
<a href="login.jsp" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
  <%}
else{ %>
 <a href="cart?id=<%=c.getCakeId()%>&&uid=<%=u.getId()%>"
  class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
 
<%}
%>
 
	    <a href="viewdetails.jsp?id=<%=c.getCakeId() %>" class="btn btn-demo my-2 my-sm-0 ml-2">View Details</a>

 
   
</div>

    </div></div></div>


<% }%></div></div>

<div class="text-center mt-3">
<a href="theme_cakes.jsp" class="btn btn-outline-demo my-button my-2 my-sm-0 ml-2 ">View All</a></div><br>

<!-- End Theme Cake -->


<!-- Start Dessert Cake -->

<div class="container-fluid mt-3" style="background-color:#f7e2f9;" ><br>
<h3 class="text-center mb-3">Dessert</h3>
<div class="container ">

<div class="row">
<%
  CakesDAOImpl dao1= new CakesDAOImpl(DBConnect.getConn());
  List <CakeDetails> list1 = dao1.getEgg();
  for(CakeDetails c : list1){%>
<div class="col-md-3">
  
<div class="card" style="width:17rem;">
    <img src="images/<%=c.getPhoto() %>"
             alt="...">
    <div class="card-body">
  
   <p><%= c.getCakename() %> </p>
    <p><%= c.getFlavour() %></p>
    
<h6>₹<%= c.getPrice() %></h6><br>
<div class="row">

<%
if(u == null){
%>
<a href="login.jsp" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
  <%}
else{ %>
<a href="cartServlet" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
<%}
%>
    <a href="viewdetails.jsp?id=<%=c.getCakeId() %>" class="btn btn-demo my-2 my-sm-0 ml-2">View Details</a>
</div>

    </div></div></div>


<% }%></div><br></div>

</div>

<div class="text-center mt-3">
<a href="dessert.jsp" class="btn btn-outline-demo my-button my-2 my-sm-0 ml-2 ">View All</a></div><br><br>



<div class="container mt-3">
<h3 class="text-center mb-3">Flavour Cakes</h3>
<div class="row">
<%
  CakesDAOImpl dao2= new CakesDAOImpl(DBConnect.getConn());
  List <CakeDetails> list2 = dao2.getFlavour();
  for(CakeDetails c : list2){%>
<div class="col-md-3">
  
<div class="card" style="width:17rem;">
    <img src="images/<%=c.getPhoto() %>"
             alt="...">
    <div class="card-body">
  
   <p><%= c.getCakename() %> </p>
    <p><%= c.getFlavour() %></p>
    
<h6>₹<%= c.getPrice() %></h6><br>
<div class="row">

<%
if(u == null){
%>
<a href="login.jsp" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
  <%}
else{ %>
<a href="cartServlet" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
<%}
%>

    <a href="viewdetails.jsp?id=<%=c.getCakeId() %>" class="btn btn-demo my-2 my-sm-0 ml-2">View Details</a>
</div>

    </div></div></div>


<% }%></div></div>

<div class="text-center mt-3">
<a href="flavour_cakes.jsp" class="btn btn-outline-demo my-button my-2 my-sm-0 ml-2 ">View All</a></div><br>


<!-- End Flavour Cake -->

<%@ include file="all_component/footer.jsp" %> 



