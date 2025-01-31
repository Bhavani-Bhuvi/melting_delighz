<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="allCss.jsp" %> 

<title>Admin : Add Cakes</title>

</head>
<body style="background-color:#f7f7f7">
<%@ include file="navbar.jsp" %> 

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>
<div class="container p-3">
<div class="row  ">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body ">
<h4 class="text-center">Add Cakes</h4>

<c:if test="${not empty succMsg }">
<p class="text-center text-success"> ${succMsg} </p>
<c:remove var="succMsg" scope="session" />
</c:if>
<c:if test="${not empty failedMsg }">
<p class="text-center text-danger"> ${failedMsg} </p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
<form action="../add_cakes" method="post" enctype="multipart/form-data">


<div class="form-group">
    <label for="exampleInputEmail1" >Cake Name</label>
    <input name="cname" type="text" class="form-control" id="exampleInputEmail1" >
    <div id="emailHelp" ></div>
     <label for="exampleInputEmail1" >Flavour</label>
    <input name="flavour" type="text" class="form-control" id="exampleInputEmail1" >
    <div id="emailHelp" ></div>
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1" >Price</label>
    <input name="price" type="number" class="form-control" id="exampleInputEmail1" >
    <div id="exampleInputPassword1"></div>
  </div>
  
    <div class="form-group">
    <label for="inputState" > Cake Status</label>
    <select name="status" class="form-control" id="inputState">
  <option selected>--Select--</option>
  <option value="Active">Active</option>
  <option value="Inactive">Inactive</option>
</select>
     </div> 
  
   
    <div class="form-group">
  <label for="exampleFormControlFile1">Upload</label>
  <input type="file" class="form-control" id="exampleFormControlFile1" name="photo">
</div>
     
<button type="submit"  class="btn btn-primary">Add</button>

</form>

</div></div></div></div></div>


</body>
</html>