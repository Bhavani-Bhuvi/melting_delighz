<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<div class="container-fluid" style="height:10px;background-color:#b16cb8"></div>
<div class="container-fluid p-3" >
<div class="row">
<div class="col-md-3">
<h3 style="color:#b16cb8"><i class="fa-solid fa-cake-candles"></i> Melting Delightz</h3></div>
<div class="col-md-5">
 <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
      <button class="btn btn-demo my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
<c:if test="${not empty userobj }"> 
<div class="col-md-4">
<a href="checkout.jsp" class="btn btn-demo "><i class="fa-solid fa-cart-plus"></i> Cart</a>
<a href="login.jsp" class="btn btn-demo"><i class="fa-solid fa-user-plus"></i> ${userobj.name}</a>
<a href="logout" class="btn btn-demo"><i class="fa-solid fa-sign-in-alt"></i> Logout</a>

</div>

</c:if>

<c:if test="${empty userobj }">

<div class="col-md-1"></div>

<div class="col-md-3">
<a href="login.jsp" class="btn btn-demo"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
<a href="register.jsp" class="btn btn-demo"><i class="fa-solid fa-user-plus"></i> Register</a>
</div></c:if>

</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active active">
        <a class="nav-link " href="theme_cakes.jsp">Theme Cakes</a> </li>
        <li class="nav-item active active">
        <a class="nav-link" href="dessert.jsp">Desserts </a>     </li>
       <li class="nav-item active active">
        <a class="nav-link" href="flavour_cakes.jsp" >Flavour Cakes        </a>   </li>
      
    
    </ul>
    <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit"><i class="fa-solid fa-gear"></i> Setting</a>
         <a href="contactus.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit"><i class="fa-solid fa-phone"></i> Contact Us</a>
            
    </form>
  </div>
</nav>