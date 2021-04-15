package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
