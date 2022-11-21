<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 12/31/21
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Developer's Page</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body class="developer-body">

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>


<br>
<div class="container col-md-5">
    <img src="image/Tanver.jpg" height="300" width="270">
    <h2>Md. Tanver Ahammed</h2>
    <b>Student ICT, MBSTU</b><br>
    <b>Java Developer</b>
</div>
<div  class="container col-md-5">
    <ul>
        <li><a href="https://www.facebook.com/md.tanver.ahammed.756/" target="_blank"><b>Facebook</b></a></li>
        <li><a href="https://www.linkedin.com/in/md-tanver-ahammed-1968211b8/"target="_blank"><b>LinkedIn</b></a></li>
        <li><a href="https://github.com/Tanver-Ahammed" target="_blank"><b>Github</b></a></li>
    </ul>
</div>


<%--footer--%>
<footer class="bg-light text-center text-lg-start">
    <div class="text-center p-3">
        © 2005-2021 Copyright. All rights reserved.
        <a href="developer.jsp" style="right: 0">Developer</a>
    </div>
</footer>

</body>
</html>
