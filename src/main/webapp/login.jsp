<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_component/allCss.jsp" %> 

<title>Login : Melting Delightz</title>
</head>
<body style="background-color:#f7f7f7">

<%@ include file="all_component/navbar.jsp" %> 
<div class="container p-3" style="align:center">
<div class="row mt-2">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Login Page</h4>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger"> ${failedMsg} </p>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<c:if test="${not empty succMsg }">
<p class="text-center text-success"> ${succMsg} </p>
<c:remove var="succMsg" scope="session" />
</c:if>
<form action="login" method="post">
 
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" >
  </div>

  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password" >
  </div>
  <div class="text-center p-3 ">  <button type="submit" class="btn btn-demo">Login</button><br><br>
  <a href="register.jsp">Create Account</a>
  </div>
</form>
</div>
</div>
</div></div>
</div>
<%@ include file="all_component/footer.jsp" %> 
</body>
</html>