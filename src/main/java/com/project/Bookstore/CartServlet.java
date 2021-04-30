package com.project.Bookstore;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "cart", value = "/cart-servlet")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CartServlet() {
        super();
    }

    private CartDao cartDao = new CartDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cover = request.getParameter("bookCover");
        String title = request.getParameter("title");

        Long isbn = new Long(0);
        isbn = Long.parseLong(request.getParameter("isbn"));

        Integer quantity = new Integer(1);
        quantity = Integer.parseInt(request.getParameter("quantity"));

        Double sellPrice = new Double(0);
        sellPrice = Double.parseDouble(request.getParameter("sellPrice"));

        Integer userID = new Integer(-1);
        userID = Integer.parseInt(request.getSession().getAttribute("uid").toString());

        Cart cart = new Cart();

        cart.setCoverPic(cover);
        cart.setTitle(title);
        cart.setIsbn(isbn);
        cart.setCurrentStock(quantity);
        cart.setSellPrice(sellPrice);
        cart.setUserID(userID);

        try {
            cartDao.addBookToCart(title, userID);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);

    }
}
