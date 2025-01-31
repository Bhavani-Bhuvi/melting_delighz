`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.DAO.*, com.DB.*, com.entity.*, com.admin.servlet.*, java.util.List" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="all_component/allCss.jsp" %> 
<title>Theme Cakes</title>
</head>
<body style="background-color:#f7f7f7">.
<%
User u= (User) session.getAttribute("userobj");
%>

 
  <c:if test="${not empty addCart }">
<div id="toast">${addCart}</div>
<script type="text/javascript">
showToast();
function showToast(content){
	$('#toast').addClass("display");
	$('#toast').html(content);
	setTimeout(()=>){
		 $("#toast").removeClass("display");
		  
	},10000)

}
</script><c:remove var="addCart" scope="session"/>

</c:if>
<%@ include file="all_component/navbar.jsp" %> 

<div class="container mt-3">
<h3 class="text-center mb-3">Theme Cakes</h3>
<div class="row">
<%
  CakesDAOImpl dao= new CakesDAOImpl(DBConnect.getConn()); 
  List<CakeDetails> list=dao.getThemeCakes();
  for(CakeDetails c : list){%>
<div class="col-md-3">
  
<div class="card" style="width:17rem;">
    <img src="images/<%=c.getPhoto() %>"
             alt="...">
    <div class="card-body">
  
    <h5><%= c.getCakename() %> </h5>
<h6>₹<%= c.getPrice() %></h6>
<h6>Flavour: <%= c.getFlavour() %></h6><br>
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
%>    <a href="viewdetails.jsp?id=<%=c.getCakeId()%>" class="btn btn-demo my-2 my-sm-0 ml-2">View Details</a>
</div>

    </div></div></div>


<% }%></div></div>

<br><br>
  

<%@ include file="all_component/footer.jsp" %> 	
</body>
</html>

