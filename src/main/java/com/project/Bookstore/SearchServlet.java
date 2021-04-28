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
import java.lang.Integer;
import java.lang.Double;

@WebServlet(name = "searchServlet", value ="/search-servlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("username");
        String[] desp = new String[13];
        PrintWriter writer = response.getWriter();
        writer.print(search);
        try {
            desp = bookDao.findBook(search);
            int i = 0;
            String htmlRespone = "";
            while (desp[i] != null && i < 13) {
                htmlRespone += "<h2>" + desp[i] + "</h2><br>";
                i++;
            }
            writer.println(htmlRespone);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
