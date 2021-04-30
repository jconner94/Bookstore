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

@WebServlet(name = "BanServlet", value = "/ban-servlet")
public class BanServlet extends HttpServlet implements AdminInterface {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public boolean adminCheck(HttpServletRequest request) {
        if(request.getSession(false) != null) {
            HttpSession session = request.getSession();
            boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            return isAdmin;
        } else {
            return false;
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(adminCheck(request)) {
            response.getWriter().append("Served at: ").append(request.getContextPath());
            response.setContentType("text/html");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/BanUser.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(adminCheck(request)) {
            int uid = Integer.parseInt(request.getParameter("userid"));
            int status = Integer.parseInt(request.getParameter("ban"));

            try {
                userDao.banUser(status, uid);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/BanUser.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }

    }
}
