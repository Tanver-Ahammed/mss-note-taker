<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/3/22
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp" %>
    <title>Registration</title>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<%--    add form--%>
<div class="container col-md-6">
    <div class="card">
        <div class="card-body">
            <h1>User Registration</h1>
            <br>
            <form action="RegistrationServlet" method="post">
                <div class="mb-3">
                    <label for="user-name">User Name</label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           id="user-name" required
                           placeholder="Enter Your Name Here"
                           aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="user-email">User Email</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           id="user-email" required
                           placeholder="Enter Your Email Here"
                           aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="user-address">User Address</label>
                    <input type="text"
                           name="address"
                           class="form-control"
                           id="user-address" required
                           placeholder="Enter Your Address Here"
                           aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="user-password">User Password</label>
                    <input type="password"
                           name="password"
                           class="form-control"
                           id="user-password" required
                           placeholder="Enter Your Address Here"
                           aria-describedby="emailHelp"/>
                </div>

                <%--        <div class="container text-center">--%>
                <button type="submit" class="btn btn-primary">Registration</button>
                <%--        </div>--%>
            </form>
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
