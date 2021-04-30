package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class CartDao {
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";

    public int addBookToCart(String title, int userID) throws ClassNotFoundException {

        Book book = new BookDao().getBookByTitle(title);


        String INSERT_CART_SQL = "INSERT INTO cart" +
                " (coverPic, title, isbn, quantityInStock, sellPrice, customerID)" +
                " VALUES (?, ?, ?, ?, ?, ?);";
        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement insertBookStatement = conn.prepareStatement(INSERT_CART_SQL);

            insertBookStatement.setString(1, book.getCoverPic());
            insertBookStatement.setString(2, book.getTitle());
            insertBookStatement.setLong(3, book.getIsbn());
            insertBookStatement.setInt(4, book.getCurrentStock());
            insertBookStatement.setDouble(5, book.getSellPrice());
            insertBookStatement.setInt(6, userID);

            result = insertBookStatement.executeUpdate();


        } catch (SQLException e) {
            System.out.println("SQL Error in addToCart");
            e.printStackTrace();
        }

        return result;
    } //addBookToCart
}
