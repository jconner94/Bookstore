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
        if(request.getSession().getAttribute("uid") == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login-servlet");
            dispatcher.forward(request, response);
        } else {
            String cover = request.getParameter("bookCover");
            String title = request.getParameter("title");
            boolean remove = false;
            if (request.getParameter("remove") != null) {
                remove = true;
            }
            if (remove) {
                removeBook(request, response, title);
            } else {

                Book book = null;

                try {
                    book = bookDao.getBookByTitle(title);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

                Long isbn = new Long(0);
                isbn = book.getIsbn();

                Integer quantity = new Integer(1);
                quantity = book.getCurrentStock();

                Double sellPrice = new Double(0);
                sellPrice = book.getSellPrice();

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
    }

    private void removeBook(HttpServletRequest request, HttpServletResponse response, String title) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getSession().getAttribute("uid").toString());

        try {
            cartDao.removeBookFromCart(userID, title);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Cart.jsp");
        dispatcher.forward(request, response);
    }
}
