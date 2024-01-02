package com.tanver.web.note.taker.web;

import com.tanver.web.note.taker.helper.FactoryProvider;
import com.tanver.web.note.taker.entities.Blog;
import com.tanver.web.note.taker.entities.Note;
import com.tanver.web.note.taker.entities.User;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // fetch note id
            String note_id = request.getParameter("note_id");
            String blog_id = request.getParameter("blog_id");

            String sessionUserEmail = request.getSession().getAttribute("username").toString();

            if (note_id != null) {
                int noteId = Integer.parseInt(note_id.trim());
                Note note = session.get(Note.class, noteId);
                String noteEmail = session.get(User.class, note.getUser().getId()).getEmail();
                if (sessionUserEmail.equals(noteEmail)) {
                    session.delete(note);
                    response.sendRedirect("all_notes.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }
            } else if (blog_id != null) {
                int blogId = Integer.parseInt(blog_id.trim());
                Blog blog = session.get(Blog.class, blogId);
                String blogEmail = session.get(User.class, blog.getUser().getId()).getEmail();
                if (sessionUserEmail.equals(blogEmail)) {
                    session.delete(blog);
                    response.sendRedirect("all_blogs.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }
            }
            transaction.commit();
            session.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            response.sendRedirect("login.jsp");
        }

    }

}
