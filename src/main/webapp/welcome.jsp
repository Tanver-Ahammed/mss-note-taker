<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 12/31/21
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Welcome To MMT</title>
    <%@include file="all_js_css.jsp" %>
    <%--    <style>--%>
    <%--        body {--%>
    <%--            background: antiquewhite;--%>
    <%--        }--%>
    <%--    </style>--%>
</head>
<body class="welcome-body">


<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>

<%--Login restiction--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<br>

<div align="center">
    <h1>Welcome to ICT Note Taker</h1>
</div>

<br>

<div class="container col-md-8">
    <h1>Message From ICT</h1>
    <hr>
    <h2>Welcome to ICT</h2>
    <p>If you are a authenticated user, You can write and show notes this side.</p>
</div>

<%--footer--%>
<footer class="bg-light text-center text-lg-start">
    <div class="text-center p-3">
        © 2022 Copyright. All rights reserved.
        <a href="developer.jsp" style="right: 0">Developer</a>
    </div>
</footer>

</body>
</html>
