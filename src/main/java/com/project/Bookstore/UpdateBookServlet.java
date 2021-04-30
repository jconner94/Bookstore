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

@WebServlet(name = "updateBookServlet", value ="/update-book-servlet")
public class UpdateBookServlet extends HttpServlet implements AdminInterface {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();

    public boolean adminCheck(HttpServletRequest request) {
        if(request.getSession(false) == null) {
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

            //System.out.println("doGet: with " + request.getParameter("title"));
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

            long isbn = Long.parseLong(request.getParameter("isbn"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String category = request.getParameter("category");
            String publisher = request.getParameter("publisher");
            String description = request.getParameter("description");
            int edition = Integer.parseInt(request.getParameter("edition"));
            int pubYear = Integer.parseInt(request.getParameter("pubYear"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int minThreshold = Integer.parseInt(request.getParameter("minThreshold"));
            double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
            double sellPrice = Double.parseDouble(request.getParameter("sellPrice"));
            String cover;
            if (request.getParameter("newBookCover").equals("")) {
                System.out.println("newBookCover == null");
                cover = request.getParameter("bookCover");
            } else {
                System.out.println("else");
                System.out.println(request.getParameter("newBookCover"));
                cover = request.getParameter("newBookCover");
            }

            Book book = new Book();
            book.setIsbn(isbn);
            book.setTitle(title);
            book.setAuthorName(author);
            book.setCategory(category);
            book.setEdition(edition);
            book.setPublisher(publisher);
            book.setCoverPic(cover);
            book.setPubYear(pubYear);
            book.setCurrentStock(quantity);
            book.setMinimumThreshold(minThreshold);
            book.setBuyPrice(buyPrice);
            book.setSellPrice(sellPrice);
            book.setDescription(description);

            try {
                bookDao.updateBook(book);
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
