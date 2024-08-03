<%@ page import="helper.FactoryProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<h1>Creating session factory object</h1>
<%
    out.println(FactoryProvider.getFactory());
%>
</body>
</html>