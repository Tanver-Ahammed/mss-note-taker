package com.tanver.web.note.taker.web;

import com.tanver.web.note.taker.helper.FactoryProvider;
import com.tanver.web.note.taker.entities.Blog;
import com.tanver.web.note.taker.entities.User;
import com.tanver.web.note.taker.services.UserService;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SaveBlogServlet", value = "/SaveBlogServlet")
public class SaveBlogServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            PrintWriter out = response.getWriter();

            // blog's title content fetch
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Blog blog = new Blog(title, content, new Date());

            // hibernate save
            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // set user in the blog
            User user = new UserService().getUserByEmail(session,
                    request.getSession().getAttribute("username").toString());
            blog.setUser(user);

            // save()
            session.save(blog);

            transaction.commit();
            session.close();
            out.println("<h1 style='text-align:center'>Blog is added successfully.</h1>");
            out.println("<h1 style='text-align:center'><a href='all_blogs.jsp'>View All</a></h1>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
