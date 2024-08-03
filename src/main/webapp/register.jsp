<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/20/2024
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
    <%@include file="components/navbar.jsp"%>
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
           <div class="card">
               <%@include file="components/message.jsp"%>
               <div class="card-body py-5" style="background-image: url('images/image3.jpg'); background-size: cover; background-position: center; ">
                   <form action="Register" method="post">
                       <H3 class="text-center my-3 text-white" >Sign up here</H3>
                       <div class="form-group text-white">
                           <label id="username">Enter username</label>
                           <input required type="text" class="form-control" name="username" placeholder="Enter here " aria-describedby="Enter Name">
                       </div>
                       <div class="form-group text-white">
                           <label id="email">Enter email</label>
                           <input required type="email" class="form-control" name="email" placeholder="Enter email" aria-describedby="emailHelp">
                       </div>
                       <div class="form-group text-white">
                           <label id ="password">Enter password</label>
                           <input required type="password" class="form-control" name="password" placeholder="Enter password" aria-describedby="passwordHelp">
                       </div>
                       <div class="form-group text-white">
                           <label id="phone">Enter phone no </label>
                           <input required type="text" class="form-control" name="phone" placeholder="Enter phone" aria-describedby="phoneHelp">
                       </div>
                       <div class="form-group text-white">
                           <label id="address">Enter address</label>
                           <textarea required type="text" class="form-control" name="address" placeholder="Enter password"></textarea>
                       </div>
                       <div class="container text-center" >
                           <a href="login.jsp" class="text-center d-block text-white"> Already Signed up ? Login here!</a><br/>
                           <button type="submit" class="btn btn-outline-primary ">Register</button>
                           <button type="reset" class="btn btn-outline-warning">Reset</button>
                       </div>
                   </form>
               </div>
           </div>
        </div>
    </div>

</body>
</html>
