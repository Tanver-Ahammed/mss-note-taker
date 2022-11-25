<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>
<%@ page import="com.tanver.web.notetaker.entities.Blog" %><%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/4/22
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Blog</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<%
    // fetch blog id
    int blog_id = Integer.parseInt(request.getParameter("blog_id").trim());
    Session s = FactoryProvider.getSessionFactory().openSession();
    Blog blog = s.get(Blog.class, blog_id);
%>

<%--    edit form--%>
<div class="container">
    <div class="container col-md-10" style="text-align: center">

        <h1 style="text-align: center">Blog Details</h1>

        <div class="card">
            <div class="card-header">
                Title: <span><b><%=blog.getTitle()%></b></span><br>
                Date: <span><%=blog.getAddedDate()%></span>
            </div>
            <div class="card-body">
                <p><%=blog.getContent()%>
                </p>
            </div>
        </div>

    </div>
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
