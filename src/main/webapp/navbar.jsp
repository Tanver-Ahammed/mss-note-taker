<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/3/22
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>

<nav class="navbar navbar-expand-lg navbar-dark purple">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Note Taker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="registration.jsp">User Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add_notes.jsp">Add Note</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add_blogs.jsp">Add Blogs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_notes.jsp">Show Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_blogs.jsp">Show Blogs</a>
                </li>
            </ul>
            <form class="d-flex">
                <%--                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
                <%--                <button class="btn btn-outline-light" type="submit">Search</button>--%>
                <a class="btn btn-outline-light" href="login.jsp">Login</a>
            </form>
            <div class="ontainer-fluid">
                <form class="d-flex" action="Logout">
                    <button class="btn btn-success" type="submit">Logout</button>
                </form>
            </div>
        </div>
    </div>
</nav>