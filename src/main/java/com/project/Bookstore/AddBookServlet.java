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

@WebServlet(name = "addBookServlet", value ="/add-book-servlet")
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/addNewBook.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer isbn = new Integer(0);
        isbn = Integer.parseInt(request.getParameter("isbn"));

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String edition = request.getParameter("edition");
        String publisher = request.getParameter("publisher");

        Integer pubYear = new Integer(0);
        pubYear = Integer.parseInt(request.getParameter("pubYear"));

        Integer quantity = new Integer(1);
        quantity = Integer.parseInt(request.getParameter("quantity"));

        Integer minThreshold = new Integer(1);
        minThreshold = Integer.parseInt(request.getParameter("minThreshold"));

        Double buyPrice = new Double(0);
        buyPrice = Double.parseDouble(request.getParameter("buyPrice"));

        Double sellPrice = new Double(0);
        sellPrice = Double.parseDouble(request.getParameter("sellPrice"));

        /*  File bookCover = request.getParameter("bookCover"); */

        Book book = new Book();
        book.setIsbn(isbn);
        book.setTitle(title);
        book.setAuthorName(author);
        book.setEdition(edition);
        book.setPublisher(publisher);
        book.setPubYear(pubYear);
        book.setCurrentStock(quantity);
        book.setMinimumThreshold(minThreshold);
        book.setBuyPrice(buyPrice);
        book.setSellPrice(sellPrice);

        try {
            bookDao.addBook(book);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/ManageBooks.html");
        dispatcher.forward(request, response);
    }
}
