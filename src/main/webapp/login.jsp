<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<%--    div.container>div.row>div.col-md-4.offset-md-4  click tab(shortcut) --%>
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body py-5" style="background-image: url('images/image4.jpg');  background-size: cover; background-position: center;">
                    <%@include file="components/message.jsp"%>
                    <form action="Login" method="post">
                        <H3 class="text-center my-3 text-white" >Sign in here</H3>
                        <div class="form-group">
                            <label id="email" class="text-white">Email address</label>
                            <input required type="email" class="form-control" name="email" placeholder="Enter email" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label id="password" class="text-white">Password</label>
                            <input required type="password" class="form-control" name="password" placeholder="Enter password">
                        </div>
                        <div class="container text-center">
                            <a href="register.jsp" class="text-center d-block">Not registered yet ?</a><br>
                            <button type="submit" class="btn btn-primary custom_bg">Sign in</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
