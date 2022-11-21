package com.tanver.web.notetaker.web;

import com.tanver.web.notetaker.entities.User;
import com.tanver.web.notetaker.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // hibernate save
            Session s = FactoryProvider.getSessionFactory().openSession();
            Query query = s.createQuery("from User u where u.email = '" +
                    username + "' and u.password = '" + password + "'");
            List<User> users = query.list();

            HttpSession httpSession = request.getSession();
            if (users.size() > 0) {
                httpSession.setAttribute("username", username);
                response.sendRedirect("welcome.jsp");
            } else {
                httpSession.setAttribute("message", "wrong");
                out.println("Your username or Password is wrong!!");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

    }

}
