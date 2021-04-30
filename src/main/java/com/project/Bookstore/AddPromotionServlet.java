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

@WebServlet(name = "addPromotionServlet", value ="/add-promotion-servlet")
public class AddPromotionServlet extends HttpServlet implements AdminInterface {
    private static final long serialVersionUID = 1L;

    private PromotionDao promoDao = new PromotionDao();

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

            RequestDispatcher dispatcher = request.getRequestDispatcher("/addPromotion.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(adminCheck(request)) {
            String promoCode = request.getParameter("promoID");
            String title = request.getParameter("title");
            int percentageInt;
            percentageInt = Integer.parseInt(request.getParameter("percentage"));
            double percentage = (double) percentageInt / 100;
            String startDay = request.getParameter("startDay");
            String startMonth = request.getParameter("startMonth");
            String startYear = request.getParameter("startYear");
            String endDay = request.getParameter("endDay");
            String endMonth = request.getParameter("endMonth");
            String endYear = request.getParameter("endYear");
            String description = request.getParameter("description");

            Promotion promo = new Promotion(promoCode, title, description,
                    startYear, startMonth, startDay,
                    endYear, endMonth, endDay,
                    percentage);

            try {
                promoDao.addPromo(promo);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/successfulPromo.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
