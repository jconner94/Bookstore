package com.project.Bookstore;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = null;

        try {
            user = userDao.getLoginInfo(email, password);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }

        if(user != null && user.getUserID() > 0) {
            if(user.getIsSuspended()) {
                session.setAttribute("email", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/suspended.jsp");
                dispatcher.forward(request, response);
            } else if(user.getIsAdmin()) {
                session.setAttribute("uid", user.getUserID());
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("email", user.getEmail());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminMain.html");
                dispatcher.forward(request, response);
            } else {
                session.setAttribute("uid", user.getUserID());
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("email", user.getEmail());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loggedInIndex.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }

    }
}
