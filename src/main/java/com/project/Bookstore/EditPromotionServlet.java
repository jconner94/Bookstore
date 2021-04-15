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

@WebServlet(name = "editPromotionServlet", value ="/edit-promotion-servlet")
public class EditPromotionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PromotionDao promoDao = new PromotionDao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");

        Promotion promo = null;
        String promoCode = request.getParameter("promoID");

        try {
            promo = promoDao.getPromo(promoCode);
        } catch (ClassNotFoundException e) {
            System.out.println("ClassNotFoundException in doGet");
            e.printStackTrace();
        }

        if(promo == null) {
            System.out.println("Promo not found");
            request.setAttribute("isSent", "nf");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminMain.jsp");
            dispatcher.forward(request, response);
        } else if(promo.getIsSent()) {
            System.out.println("as");
            request.setAttribute("isSent", "Promotion Already Sent!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminMain.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("Promo found and not sent");
            request.setAttribute("promoID", promo.getPromoCode());
            request.setAttribute("title", promo.getTitle());
            request.setAttribute("percentage", (promo.getPercentage()) * 100);
            request.setAttribute("startDay", promo.getStartDay());
            request.setAttribute("startMonth", promo.getStartMonth());
            request.setAttribute("startYear", promo.getStartYear());
            request.setAttribute("endDay", promo.getEndDay());
            request.setAttribute("endMonth", promo.getEndMonth());
            request.setAttribute("endYear", promo.getEndYear());
            request.setAttribute("description", promo.getDescription());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/editPromotion.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Promotion promo = null;
        String promoCode = request.getParameter("promoID");
        String title = request.getParameter("title");
        int percentageInt;
        percentageInt = Integer.parseInt(request.getParameter("percentage"));
        double percentage = (double)percentageInt / 100;
        String startDay = request.getParameter("startDay");
        String startMonth = request.getParameter("startMonth");
        String startYear = request.getParameter("startYear");
        String endDay = request.getParameter("endDay");
        String endMonth = request.getParameter("endMonth");
        String endYear = request.getParameter("endYear");
        String description = request.getParameter("description");

        promo = new Promotion(promoCode, title, description,
                startYear, startMonth, startDay,
                endYear, endMonth, endDay,
                percentage);

        //Promotion promo = new Promotion(promoCode, title, description,
        //        startYear, startMonth, startDay,
        //        endYear, endMonth, endDay,
        //        percentage);

        try {
            promoDao.editPromotion(promo);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/successfulPromo.jsp");
        dispatcher.forward(request, response);
    }
}
