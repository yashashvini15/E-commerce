<%@ page import="entity.User" %>
<%
    User user =(User)session.getAttribute("current-user");
    System.out.println("normal.jsp " +user);
    if(user==null){
        session.setAttribute("message" , "Your not signed in");
        response.sendRedirect("login.jsp");
        return;
    }else {
        if(user.getUserType().equalsIgnoreCase("admin")){
            session.setAttribute("message" ,"You cannot access this page..!");
            response.sendRedirect("admin.jsp");
            return;
        }
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<%@include file="components/message.jsp"%>
<h1> this is normal user panel </h1>

</body>
</html>
