<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.note.taker.helper.FactoryProvider" %>
<%@ page import="com.tanver.web.note.taker.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/4/22
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Note</title>
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
    // fetch note id
    int note_id = Integer.parseInt(request.getParameter("note_id").trim());
    Session s = FactoryProvider.getSessionFactory().openSession();
    Note note = s.get(Note.class, note_id);
%>

<%--    edit form--%>
<div class="container">
    <div class="container col-md-10" style="text-align: center">

        <h1 style="text-align: center">Note Details</h1>

        <div class="card">
            <div class="card-header">
                Title: <span><b><%=note.getTitle()%></b></span><br>
                Author: <span><b><%=note.getUser().getName()%></b></span><br>
                Date: <span><%=note.getAddedDate()%></span>
            </div>
            <div class="card-body">
                <p><%=note.getContent()%>
                </p>
            </div>

        </div>
        <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
        <a href="edit-note.jsp?note_id=<%=note.getId()%>" class="btn btn-warning">Update</a>
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
