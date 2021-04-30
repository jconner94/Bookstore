package com.project.Bookstore;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.Integer;
import java.lang.Double;

@WebServlet(name = "deleteBookServlet", value ="/delete-book-servlet")
public class DeleteBookServlet extends HttpServlet implements AdminInterface {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();

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

            try {
                Book book = bookDao.getBookByTitle(request.getParameter("title"));
                request.setAttribute("Book", book);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/Book.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(adminCheck(request)) {
            response.getWriter().append("Served at: ").append(request.getContextPath());
            response.setContentType("text/html");
            System.out.println("doPost");

            try {
                bookDao.deleteBookByTitle(request.getParameter("title"));
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/ManageBooks.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
