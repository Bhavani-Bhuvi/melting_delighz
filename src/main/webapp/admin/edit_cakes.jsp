
<%@ page import="com.DAO.*, com.DB.*, com.entity.*, java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="allCss.jsp" %> 

<title>Admin : Edit Cakes</title>
</head>
<body style="background-color:#f7f7f7">
<%@ include file="navbar.jsp" %> 
<div class="container p-3">
<div class="row  ">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body ">
<h4 class="text-center">Edit Cake</h4>




<%
int id = Integer.parseInt(request.getParameter("id"));
CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
CakeDetails c = dao.getCakeById(id);
%>

<form action="../editcakes" method="post"  >
<input type="hidden" name="id" value="<%=c.getCakeId() %>">
<div class="form-group">
    <label for="exampleInputEmail1" >Cake Name</label>
    <input name="cname" type="text" class="form-control" id="exampleInputEmail1" value="<%=c.getCakename()%>">
    <div id="emailHelp" ></div>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1" >Flavour</label>
    <input name="flavour" type="text" class="form-control" id="exampleInputEmail1" value="<%=c.getFlavour() %>">
    <div id="emailHelp" ></div>
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1" >Price</label>
    <input name="price" type="number" class="form-control" id="exampleInputEmail1" value="<%=c.getPrice() %>">
    <div id="exampleInputPassword1"></div>
  </div>
 
    <div class="form-group">
    <label for="inputState" > Cake Status</label>
    <select id="inputState" name="status" class="form-control">
    <%
    if("Active".equals(c.getStatus())){
    %>
        	  <option value="Active">Active</option>
    <option value="Inactive">Inactive</option>
    <%
    } else{
    	%>
    	      <option value="Inactive">Inactive</option>
    	    	  <option value="Active">Active</option>
<%
    }
    %>
</select>
     </div> 
  
   
  
     
     <button type="submit" class="btn btn-primary">Update</button>

</form>

</div></div></div></div></div>

</body>
</html>