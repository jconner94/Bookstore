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



@WebServlet(name = "checkoutServlet", value = "/checkout-servlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookDao bookDao = new BookDao();
    private CartDao cartDao = new CartDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");
        Book[] cart = null;
        int uid = Integer.parseInt(request.getSession().getAttribute("uid").toString());
        try {
            cart = cartDao.getCurrentCart(Integer.parseInt(request.getSession().getAttribute("uid").toString()));
            for(int i = 0; i < cart.length; i++) {
                System.out.println(cart[i].getTitle());
            }
            request.getSession().setAttribute("Cart", cart);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Cart.jsp");
        //RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
            dispatcher.forward(request, response);
    }

}
