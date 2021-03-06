package com.project.Bookstore;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logoutServlet", value = "/logout-servlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("In logoutServlet");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        HttpSession session = request.getSession(false);
        if(session != null) {
            System.out.println("Invalidating session...");
            session.invalidate();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

}
