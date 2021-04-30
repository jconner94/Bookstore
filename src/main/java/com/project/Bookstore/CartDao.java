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

    public Book[] getCurrentCart(int userID) throws ClassNotFoundException {
        String GET_COUNT_SQL = "SELECT COUNT(*) FROM cart WHERE customerID = ?;";
        String GET_CART_SQL = "SELECT title FROM cart WHERE customerID = ?;";

        Class.forName("com.mysql.jdbc.Driver");

        Book[] cartContents = null;

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement countStatement = conn.prepareStatement(GET_COUNT_SQL);
            countStatement.setInt(1, userID);
            int count = 0;
            ResultSet rs = countStatement.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
            cartContents = new Book[count];

            PreparedStatement cartStatement = conn.prepareStatement(GET_CART_SQL);
            cartStatement.setInt(1, userID);
            rs = cartStatement.executeQuery();

            int index = 0;

            while(rs.next()) {
                cartContents[index] = new BookDao().getBookInfoForCart(rs.getString(1));
                index++;
            }
        } catch (SQLException e) {
            System.out.println("SQLException in getCurrentCart");
            e.printStackTrace();
        }

        return cartContents;
    }

    public int removeBookFromCart(int userID, String title) throws ClassNotFoundException {
        String REMOVE_BOOK_SQL = "DELETE FROM cart WHERE customerID = ? AND title = ?;";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement removeStatement = conn.prepareStatement(REMOVE_BOOK_SQL);
            removeStatement.setInt(1, userID);
            removeStatement.setString(2, title);
            result = removeStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException in removeBookFromCart");
            e.printStackTrace();
        }

        return result;
    }
}
