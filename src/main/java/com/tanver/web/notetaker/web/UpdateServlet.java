package com.tanver.web.notetaker.web;

import com.tanver.web.notetaker.entities.Blog;
import com.tanver.web.notetaker.entities.Note;
import com.tanver.web.notetaker.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // hibernate session create
            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // fetch note data
            String note_id = request.getParameter("note_id");
            String blog_id = request.getParameter("blog_id");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            if (note_id != null) {
                int noteId = Integer.parseInt(note_id);
                Note note = session.get(Note.class, noteId);
                note.setTitle(title);
                note.setContent(content);
                note.setAddedDate(new Date());
                response.sendRedirect("all_notes.jsp");
            } else if (blog_id != null) {
                int blogId = Integer.parseInt(blog_id);
                Blog blog = session.get(Blog.class, blogId);
                blog.setTitle(title);
                blog.setContent(content);
                blog.setAddedDate(new Date());
                response.sendRedirect("all_blogs.jsp");
            }

            transaction.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
