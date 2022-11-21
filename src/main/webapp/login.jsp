<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 12/31/21
  Time: 8:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Login MMT</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>

<br>
<%--checking user name password wrong--%>
<%
    if (session.getAttribute("message") == "wrong") {
        out.println("<div class=\"container col-md-5\"  style=\"color:red\">");
        out.println("<b>Your User Name or Password Wrong!!</b>");
        out.println("<b>Please, Try Again....</b>");
        out.println("</div>");
    }
%>

<br>
<div class="container col-md-5">
    <h1>User Login</h1>
    <div class="card">
        <div class="card-body">
            <form action="Login" method="post">
                <fieldset class="form-group">
                    <label><b>Author User Name</b></label>
                    <input type="text" class="form-control" name="username" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label><b>Author Password</b></label>
                    <input type="password" class="form-control" name="password" required="required">
                </fieldset>
                <br>
                <button type="submit" class="btn btn-success">Login</button>
            </form>
        </div>
    </div>
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
