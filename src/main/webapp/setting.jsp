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

<title>Setting Page</title>
<style type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
color:black;


}
</style>
</head>
<body style="background-color:#f7f7f7">


<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_component/navbar.jsp" %>
<div class="container p-3">
<h3 class="text-center"> Hello , "${userobj.name}"</h3>
<div class="row p-5">
<div class="col-md-4">
<a href="editprofile.jsp">
<div class="card">
<div class="card-body text-center">
<div style="color:#b16cb8;"><i class="fas fa-edit fa-3x "> </i></div><h4 class="p-3">Edit Profile</h4>

</div></div></a></div>
<div class="col-md-4">
<a href="userorder.jsp">
<div class="card">
<div class="card-body text-center">
<div style="color:#b16cb8;"><i class="fas fa-box-open fa-3x "> </i></div><h4 class="p-3">Your Order</h4>

</div></div></a></div>

<div class="col-md-4">
<a href="helpline.jsp">
<div class="card">
<div class="card-body text-center">
<div style="color:#b16cb8;"><i class="fas fa-user-circle fa-3x "> </i></div><h4 class="p-3">Help Center</h4>

</div></div></a></div>

</div></div>


<%@include file="all_component/footer.jsp"%> 
 
</body>
</html>