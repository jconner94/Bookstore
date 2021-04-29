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
        request.getSession().setAttribute("searchResult","");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String[] desp = new String[13];
        try {
            desp = bookDao.findBook(search);
            String url;
            String htmlResponse = "<html>";
            url = "<img src=\""+request.getContextPath()+"/resources/"+desp[4]+"\" class=\"images\" height=\"500\" width=\"300\" alt=\"\">";
            htmlResponse += url;
            htmlResponse += "<h3> Price: $" + desp[11] + "</h3><br>";
            htmlResponse += "<h3> ISBN: " + desp[0] + "</h3><br>";
            htmlResponse += "<h3> Genre: " + desp[1] + "</h3><br>";
            htmlResponse += "<h3> Author: " + desp[2] + "</h3><br>";
            htmlResponse += "<h3> Title: " + desp[3] + "</h3><br>";
            htmlResponse += "<h3> Edition #: " + desp[5] + "</h3><br>";
            htmlResponse += "<h3> Publisher: " + desp[6] + "</h3><br>";
            htmlResponse += "<h3> Publication Year: " + desp[7] + "</h3><br>";
            htmlResponse += "<h3> Books Left: " + desp[8] + "</h3><br>";
            htmlResponse += "<h3> Trade-in Value: $" + desp[10] + "</h3><br>";
            htmlResponse += "</html>";
            boolean empty = true;
            for(int i=0; i<desp.length; i++) {
                if(desp[i]==null) {
                    empty = true;
                } else {
                    empty = false;
                    i=100;
                }
            }
            if(!empty) {
                request.getSession().setAttribute("searchResult", htmlResponse);
            } else {
                request.getSession().setAttribute("searchResult", "<html><h3>Book Does not Exist</h3></html>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }
}
