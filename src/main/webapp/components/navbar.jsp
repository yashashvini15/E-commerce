<%@ page import="entity.User" %>
<%User user1 =(User)session.getAttribute("current-user");%>
<nav class="navbar navbar-expand-lg navbar-dark custom_bg">
  <a class="navbar-brand" href="#"><h4>Let's Shop</h4></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp"><h5>Home</h5><span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item">
            <a class="nav-link" href="about.jsp"><h5>About</h5></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="contact.jsp"><h5>Contact</h5></a>
        </li>
<%--      <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">--%>
<%--          <h5>Select Category </h5>--%>
<%--        </a>--%>
<%--        <div class="dropdown-menu">--%>
<%--          <a class="dropdown-item" href="#">Action</a>--%>
<%--          <a class="dropdown-item" href="#">Another action</a>--%>
<%--          <div class="dropdown-divider"></div>--%>
<%--          <a class="dropdown-item" href="#">Something else here</a>--%>
<%--        </div>--%>
<%--      </li>--%>

    </ul>
<%--cart--%>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#cart" ><i class="fas fa-cart-plus"  style="font-size: 25px; color: white" ></i><span class="ml-0 cart-items">(0)</span></a>
      </li>

    <%
      if(user1==null){
    %>
      <li class="nav-item active">
        <a class="nav-link" href="login.jsp" ><h5>Sign in</h5></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp"><h5>Register </h5></a>
      </li>
    </ul>
    <%
      }else{
    %>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp" : "home.jsp"%>"><h5><%=user1.getUserName()%></h5></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Logout"><h5>Signout</h5></a>
      </li>
    </ul>
    <%
      }
    %>
  </div>
</nav>