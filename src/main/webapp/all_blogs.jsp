<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.note.taker.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tanver.web.note.taker.entities.Note" %>
<%@ page import="com.tanver.web.note.taker.entities.Blog" %>
<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 25/11/22
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Blogs</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>


<div class="container">
    <h1 class="text-uppercase">All Blogs:</h1>
    <div class="row">
        <div class="col-12">

            <div class="row row-cols-3" style="margin-left: 10px">
                <%
                    Session s = FactoryProvider.getSessionFactory().openSession();
                    Query query = s.createQuery("from Blog n order by n.addedDate desc");
                    List<Blog> blogList = query.list();
                    for (Blog blog : blogList) {
                        if (blog.getContent().length() > 50)
                            blog.setContent(blog.getContent().substring(0, 49));
                %>

                <div class="card mt-3" style="width: 18rem;">
                    <img class="card-img-top m-4" src="image/notepad.png"
                         style="max-width: 100px">
                    <div class="card-body px-5">
                        <h5 class="card-title"><%=blog.getTitle()%>
                        </h5>
                        <p class="card-text"><%=blog.getContent()%>
                        </p>
                        <p><b class="text-primary"><%=blog.getAddedDate()%>
                        </b></p>
                        <%--                    <div class="container mt-4">--%>
                        <a href="DeleteServlet?blog_id=<%=blog.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="edit-blog.jsp?blog_id=<%=blog.getId()%>" class="btn btn-warning">Update</a>
                        <a href="details-blog.jsp?blog_id=<%=blog.getId()%>" class="btn btn-primary">Details</a>
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
