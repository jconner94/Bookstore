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

@WebServlet(name = "manageUsersServlet", value = "/manage-users-servlet")
public class ManageUsersServlet extends HttpServlet implements AdminInterface {
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

            HttpSession session = request.getSession();

            try {
                User[] users = userDao.getUserList();
                String[][] userAttributes = new String[users.length][5];
                for (int i = 0; i < users.length; i++) {
                    //    System.out.println(users[i].toString());
                    userAttributes[i][0] = "" + users[i].getUserID();
                    userAttributes[i][1] = users[i].getFirstName();
                    userAttributes[i][2] = users[i].getLastName();
                    userAttributes[i][3] = users[i].getEmail();
                    userAttributes[i][4] = "" + users[i].getIsSuspended();
                }

                session.setAttribute("users", users);

            } catch (ClassNotFoundException e) {
                System.out.println("Class Not Found in ManageUsersServlet");
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/manageUsers.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
