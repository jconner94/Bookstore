package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.*;

public class PromotionDao {
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";

    public int addPromo(Promotion promo) throws ClassNotFoundException {
        String INSERT_PROMO_SQL = "INSERT INTO promotion" +
                " (promoCode, startDate, percentage, expireDate," +
                " title, description, isSent)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement insertPromoStatement = conn.prepareStatement(INSERT_PROMO_SQL);
            insertPromoStatement.setString(1, promo.getPromoCode());
            insertPromoStatement.setString(2, promo.getFormattedStartDate());
            insertPromoStatement.setDouble(3, promo.getPercentage());
            insertPromoStatement.setString(4, promo.getFormattedEndDate());
            insertPromoStatement.setString(5, promo.getTitle());
            insertPromoStatement.setString(6, promo.getDescription());
            insertPromoStatement.setBoolean(7, promo.getIsSent());

            result = insertPromoStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL Error in addPromo");
            e.printStackTrace();
        } // try/catch

        return result;
    }

    public Promotion getPromo(String promoCode) throws ClassNotFoundException {
        String GET_PROMO_SQL = "SELECT * FROM promotion WHERE promoCode = ?";

        Promotion promo = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement getPromoStatement = conn.prepareStatement(GET_PROMO_SQL);
            getPromoStatement.setString(1, promoCode);
            ResultSet rs = getPromoStatement.executeQuery();
            if(rs.next()) {
                String promoID = rs.getString("promoCode");
                String startYear = rs.getDate("startDate").toString().split("-")[0];
                String startMonth = rs.getDate("startDate").toString().split("-")[1];
                String startDay = rs.getDate("startDate").toString().split("-")[2];
                double percentage = rs.getDouble("percentage");
                String endYear = rs.getDate("expireDate").toString().split("-")[0];
                String endMonth = rs.getDate("expireDate").toString().split("-")[1];
                String endDay = rs.getDate("expireDate").toString().split("-")[2];
                String title = rs.getString("title");
                String description = rs.getString("description");
                boolean isSent = rs.getBoolean("isSent");

                promo = new Promotion(promoID, title, description,
                        startYear, startMonth, startDay,
                        endYear, endMonth, endDay, percentage, isSent);

            }
        } catch(SQLException e) {
            System.out.println("SQLException in getPromo");
            e.printStackTrace();
        }

        return promo;
    }

    public int editPromotion(Promotion promo) throws ClassNotFoundException {
        String EDIT_PROMO_SQL = "UPDATE promotion SET startDate = ?, percentage = ?, expireDate = ?, title = ?, description = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement editStatement = conn.prepareStatement(EDIT_PROMO_SQL);
            editStatement.setString(1, promo.getFormattedStartDate());
            editStatement.setDouble(2, promo.getPercentage());
            editStatement.setString(3, promo.getFormattedEndDate());
            editStatement.setString(4, promo.getTitle());
            editStatement.setString(5, promo.getDescription());

            result = editStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException in editPromotion");
            e.printStackTrace();
        }

        return result;
    }

    public int updatePromoSendStatus(String promoCode) throws ClassNotFoundException {
        String UPDATE_SEND_SQL = "UPDATE promotion SET isSent = 1 WHERE promoCode = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement sendStatement = conn.prepareStatement(UPDATE_SEND_SQL);
            sendStatement.setString(1, promoCode);
            result = sendStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException in updatePromoSendStatus");
            e.printStackTrace();
        }

        return result;
    }
}
