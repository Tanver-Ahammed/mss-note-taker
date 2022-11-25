<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tanver.web.notetaker.entities.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/4/22
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
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

<div class="container">
    <h1 class="text-uppercase">All Notes:</h1>
    <div class="row">
        <div class="col-12">

            <div class="row row-cols-3" style="margin-left: 10px">
                <%
                    Session s = FactoryProvider.getSessionFactory().openSession();
                    Query query = s.createQuery("from Note n order by n.addedDate desc");
                    List<Note> noteList = query.list();
                    for (Note note : noteList) {
                        if (note.getContent().length() > 50)
                            note.setContent(note.getContent().substring(0, 49));
                %>

                <div class="card mt-3" style="width: 18rem;">
                    <img class="card-img-top m-4" src="image/notepad.png"
                         style="max-width: 100px">
                    <div class="card-body px-5">
                        <h5 class="card-title"><%=note.getTitle()%>
                        </h5>
                        <p class="card-text"><%=note.getContent()%>
                        </p>
                        <p><b class="text-primary"><%=note.getAddedDate()%>
                        </b></p>
                        <%--                    <div class="container mt-4">--%>
                        <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="edit-note.jsp?note_id=<%=note.getId()%>" class="btn btn-warning">Update</a>
                        <a href="details-note.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Details</a>
                        <%--                    </div>--%>
                    </div>
                </div>

                <%
                    }
                    s.close();
                %>

            </div>
        </div>
    </div>
</div>

<br><br><br>

<%--footer--%>
<footer class="bg-light text-center text-lg-start">
    <div class="text-center p-3">
        © 2022 Copyright. All rights reserved.
        <a href="developer.jsp" style="right: 0">Developer</a>
    </div>
</footer>

</body>
</html>


<%--<%@ page import="org.hibernate.Session" %>--%>
<%--<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>--%>
<%--<%@ page import="org.hibernate.Transaction" %>--%>
<%--<%@ page import="org.hibernate.Query" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="com.tanver.web.notetaker.entities.Note" %>--%>
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: tanver--%>
<%--  Date: 1/4/22--%>
<%--  Time: 9:39 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>All Notes</title>--%>
<%--    <%@include file="all_js_css.jsp" %>--%>
<%--</head>--%>
<%--<body>--%>

<%--&lt;%&ndash;Navbar&ndash;%&gt;--%>
<%--<div class="container-fluid p-0 m-0">--%>
<%--    <%@ include file="navbar.jsp" %>--%>
<%--</div>--%>
<%--<br>--%>

<%--&lt;%&ndash;Login restiction&ndash;%&gt;--%>
<%--<%--%>
<%--    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");--%>
<%--    response.setHeader("Pragma", "no-cache");--%>
<%--    response.setHeader("Expires", "0");--%>
<%--    if (session.getAttribute("username") == null) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>

<%--<div class="container">--%>
<%--    <h1 class="text-uppercase">All Notes:</h1>--%>
<%--    <div class="row">--%>
<%--        <div class="col-12">--%>

<%--            <%--%>
<%--                Session s = FactoryProvider.getSessionFactory().openSession();--%>
<%--                Query query = s.createQuery("from Note n order by n.addedDate desc");--%>
<%--                List<Note> noteList = query.list();--%>
<%--                for (Note note : noteList) {--%>
<%--            %>--%>

<%--            <div class="card mt-3">--%>
<%--                <img class="card-img-top m-4" src="image/notepad.png"--%>
<%--                     style="max-width: 100px">--%>
<%--                <div class="card-body px-5">--%>
<%--                    <h5 class="card-title"><%=note.getTitle()%>--%>
<%--                    </h5>--%>
<%--                    <p class="card-text"><%=note.getContent()%>--%>
<%--                    </p>--%>
<%--                    <p><b class="text-primary"><%=note.getAddedDate()%>--%>
<%--                    </b></p>--%>
<%--                    &lt;%&ndash;                    <div class="container mt-4">&ndash;%&gt;--%>
<%--                    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>--%>
<%--                    <a href="edit-note.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>--%>
<%--                    &lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <%--%>
<%--                }--%>
<%--                s.close();--%>
<%--            %>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<br><br><br>--%>

<%--&lt;%&ndash;footer&ndash;%&gt;--%>
<%--<footer class="bg-light text-center text-lg-start">--%>
<%--    <div class="text-center p-3">--%>
<%--        © 2022 Copyright. All rights reserved.--%>
<%--        <a href="developer.jsp" style="right: 0">Developer</a>--%>
<%--    </div>--%>
<%--</footer>--%>

<%--</body>--%>
<%--</html>--%>
