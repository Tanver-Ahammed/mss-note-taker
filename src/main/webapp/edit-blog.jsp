<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.tanver.web.notetaker.entities.Note" %>
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

<%--Login restiction--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    // fetch blog id
    int blog_id = Integer.parseInt(request.getParameter("blog_id").trim());
    Session s = FactoryProvider.getSessionFactory().openSession();
    Blog blog = s.get(Blog.class, blog_id);
%>

<%--    edit form--%>
<div class="container">
    <h1>Edit your code.</h1>
    <br>
    <form action="UpdateServlet" method="post">
        <input value="<%=blog_id%>" name="blog_id" hidden>
        <div class="mb-3">
            <label for="blog-title">Blog Title</label>
            <input type="text"
                   name="title"
                   class="form-control"
                   id="blog-title" required
                   placeholder="Enter Title Here"
                   aria-describedby="emailHelp"
                   value="<%=blog.getTitle()%>"/>
        </div>
        <div class="mb-3">
            <label for="blog-content" class="form-label">Blog Content</label>
            <textarea
                    id="blog-content" required
                    name="content"
                    class="form-control"
                    placeholder="Enter your content here"
                    style="height: 300px"><%=blog.getContent()%></textarea>
        </div>
        <%--        <div class="container text-center">--%>
        <button type="submit" class="btn btn-success">Save Your Blog</button>
        <%--        </div>--%>
    </form>
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
