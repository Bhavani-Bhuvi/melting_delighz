<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*, com.DB.*, com.entity.*, java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_component/allCss.jsp" %> 
<title>Insert title here</title>

</head>
<body style="background-color:#f7f7f7">
<%
User u= (User) session.getAttribute("userobj");
%>
<%@ include file="all_component/navbar.jsp" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
CakeDetails c = dao.getCakeById(id);
%>
<div class="container p-3">

<div class="row">

<div class="col-md-5 text-center p-5 border bg-white">

<img src="images/<%=c.getPhoto()%>" style="height:250px;width:250px" ><br>
<h5 class=mt-3><%=c.getCakename() %></h5>
<p><%=c.getFlavour() %></p>
	
																															
</div>


<div class="col-md-7  p-5 border bg-white ">
<h6>Product Description</h6>
<p>This cake is available in six flavors: chocolate, butterscotch, vanilla, strawberry, black forest, and pineapple.</p>
<div>
<div ><img src="images/delivery.avif" class="prod-info-1" alt="prod-info"></div><br>
<div class="row p-2">
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
<%
if(u == null){
%>
<a href="login.jsp" class="btn btn-demo my-2 my-sm-0 mr-2 ml-2">Buy Now | <i class="fa-solid fa-indian-rupee-sign"></i> <%=c.getPrice() %></a>
  <%}
else{ %>
 <a href="cart?id=<%=c.getCakeId()%>&&uid=<%=u.getId()%>"
  class="btn btn-demo my-2 my-sm-0 mr-2 ml-2">Buy Now | <i class="fa-solid fa-indian-rupee-sign"></i> <%=c.getPrice() %></a>
 
<%}
%>     
</div>

</div>

</div></div>
</div>
<%@ include file="all_component/footer.jsp" %> 	

</body>
</html>