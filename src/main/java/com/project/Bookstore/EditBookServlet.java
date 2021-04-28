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

@WebServlet(name = "editBookServlet", value ="/edit-book-servlet")
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        Book[] books = null;

        try {
            books = bookDao.getAllBooks();
            request.setAttribute("Count", books.length);
            request.setAttribute("Books", books);
            for(int i = 0; i < books.length; i++) {
                String number = "book" + (i+1);
                request.setAttribute((number + "title"), books[i].getTitle());
                request.setAttribute((number + "author"), books[i].getAuthorName());
                request.setAttribute((number + "category"), books[i].getCategory());
                request.setAttribute((number + "edition"), books[i].getEdition());
                request.setAttribute((number + "publisher"), books[i].getPublisher());
                request.setAttribute((number + "pubyear"), books[i].getPubYear());
                request.setAttribute((number + "quantity"), books[i].getCurrentStock());
                request.setAttribute((number + "minimum"), books[i].getMinimumThreshold());
                request.setAttribute((number + "buyprice"), books[i].getBuyPrice());
                request.setAttribute((number + "sellprice"), books[i].getSellPrice());
                request.setAttribute((number + "isbn"), books[i].getIsbn());
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/EditBooks.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*Book[] books = null;

        try {
            books = bookDao.getAllBooks();
            request.setAttribute("Count", books.length);
            for(int i = 0; i < books.length; i++) {
                String number = "book" + (i+1);
                request.setAttribute((number + "title"), books[i].getTitle());
                request.setAttribute((number + "author"), books[i].getAuthorName());
                request.setAttribute((number + "category"), books[i].getCategory());
                request.setAttribute((number + "edition"), books[i].getEdition());
                request.setAttribute((number + "publisher"), books[i].getPublisher());
                request.setAttribute((number + "pubyear"), books[i].getPubYear());
                request.setAttribute((number + "quantity"), books[i].getCurrentStock());
                request.setAttribute((number + "minimum"), books[i].getMinimumThreshold());
                request.setAttribute((number + "buyprice"), books[i].getBuyPrice());
                request.setAttribute((number + "sellprice"), books[i].getSellPrice());
                request.setAttribute((number + "isbn"), books[i].getIsbn());
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }*/
        try {
            bookDao.getBookSearch(request.getParameter("query"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/ManageBooks.jsp");
        dispatcher.forward(request, response);
    }
}
