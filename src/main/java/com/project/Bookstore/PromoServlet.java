package com.project.Bookstore;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PromoServlet", value = "/promo-servlet")
public class PromoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    public PromoServlet() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

        User user = new User();
        user.setUserID(1);

        try {// don't think we have promo SQL stuff yet?
            String[] userInfo = userDao.fetchUserInfo(user);
            request.setAttribute("userID",  userInfo[0]);
            request.setAttribute("firstName",  userInfo[1]);
            request.setAttribute("lastName",  userInfo[2]);
            request.setAttribute("password", userInfo[3]);
            request.setAttribute("email",  userInfo[4]);
            request.setAttribute("street",  userInfo[5]);
            request.setAttribute("city",  userInfo[6]);
            request.setAttribute("state",  userInfo[7]);
            request.setAttribute("cardNum",  userInfo[8]);
            request.setAttribute("expMonth",  userInfo[9]);
            request.setAttribute("expYear",  userInfo[10]);
            request.setAttribute("cvv",  userInfo[11]);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/editPromotion.jsp");
            dispatcher.forward(request, response);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        } // try/catch

    } // doGet

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//same thing, need promo stuff in SQL
        String userID = request.getParameter("userID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String cardNum = request.getParameter("cardNum");
        String expMonth = request.getParameter("expMonth");
        String expYear = request.getParameter("expYear");
        String cvv = request.getParameter("cvv");

        int id = Integer.valueOf(userID);

        User user = new User();
        user.setUserID(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setStreet(street);
        user.setCity(city);
        user.setState(state);
        user.setCardNum(cardNum);
        user.setExpMonth(expMonth);
        user.setExpYear(expYear);
        user.setCvv(cvv);

        try {
            userDao.editUserInfo(user);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } // try/catch

        RequestDispatcher dispatcher = request.getRequestDispatcher("/successfulPromo.jsp");
        dispatcher.forward(request, response);
    } // doPost
}