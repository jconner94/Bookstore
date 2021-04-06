package com.project.Bookstore;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "forgotServlet", value = "/forgot-servlet")
public class ForgotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public ForgotServlet() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

        User user = new User();
        user.setUserID(1);

        try {
            String[] userInfo = userDao.fetchUserInfo(user);
            request.setAttribute("userID", userInfo[0]);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/forgot.jsp");
            dispatcher.forward(request, response);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        } // try/catch

    } // doGet

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String password = request.getParameter("password");

        try {
            userDao.changePassword(userID, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } // try/catch

        RequestDispatcher dispatcher = request.getRequestDispatcher("/successfulForgot.jsp");
        dispatcher.forward(request, response);
    } // doPost
}