package com.tanver.web.notetaker.web;

import com.tanver.web.notetaker.entities.User;
import com.tanver.web.notetaker.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "RegistrationServlet", value = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        try {
            PrintWriter out = response.getWriter();

            // note's title content fetch
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String password = request.getParameter("password");

            User user = new User(name, email, address, password);

            // hibernate save
            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // save()
            session.save(user);

            transaction.commit();
            session.close();
            out.println("<h1 style='text-align:center'>Registration successful...</h1>");
            out.println("<h1 style='text-align:center'><a href='login.jsp'>Login</a></h1>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
