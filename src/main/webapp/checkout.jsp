<%
    User user = (User) session.getAttribute("current-user");
    System.out.println("admin.jsp " + user);
    if (user == null) {
        session.setAttribute("message", "You are not signed in");
        response.sendRedirect("login.jsp");
        return;
    }
%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <%@ include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/message.jsp"%>
<%@include file="components/navbar.jsp"%>

<div class="container">
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Items in bag</h3>
                    <div class="cart-body"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Price Details</h3>
                    <form action="#">
                        <div class="form-group">
                            <label name="email">Email</label>
                            <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label name="name">Name </label>
                            <input value="<%=user.getUserName()%>" type="email" class="form-control" id="name" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label name="shippingaddress">Shipping address</label>
                            <textarea  class="form-control" id=shippingaddress" placeholder="Enter your Shipping address" rows="3"><%=user.getUserAddress()%></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Order now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="components/common_modal.jsp"%>
</body>
</html>
