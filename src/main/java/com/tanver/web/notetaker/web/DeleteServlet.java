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
            if (note_id != null) {
                int noteId = Integer.parseInt(note_id.trim());
                Note note = session.get(Note.class, noteId);
                session.delete(note);
                response.sendRedirect("all_notes.jsp");
            } else if (blog_id != null) {
                int blogId = Integer.parseInt(blog_id.trim());
                Blog blog = session.get(Blog.class, blogId);
                session.delete(blog);
                response.sendRedirect("all_blogs.jsp");
            }
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
