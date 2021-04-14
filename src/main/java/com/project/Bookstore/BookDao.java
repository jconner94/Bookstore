package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDao {
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";

    public int addBook(Book book) throws ClassNotFoundException {
        String INSERT_BOOK_SQL = "INSERT INTO book" +
                " (isbn, category, authorName, title, coverPic," +
                " edition, publisher, publicationYear, quantityInStock," +
                " minimumThresh, buyPrice, sellPrice)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement insertBookStatement = conn.prepareStatement(INSERT_BOOK_SQL);
            insertBookStatement.setInt(1, book.getIsbn());
            insertBookStatement.setString(2, book.getCategory());
            insertBookStatement.setString(3, book.getAuthorName());
            insertBookStatement.setString(4, book.getTitle());
            insertBookStatement.setString(5, book.getCoverPic());
            insertBookStatement.setString(6, book.getEdition());
            insertBookStatement.setString(7, book.getPublisher());
            insertBookStatement.setInt(9, book.getCurrentStock());
            insertBookStatement.setInt(10, book.getMinimumThreshold());
            insertBookStatement.setDouble(11, book.getBuyPrice());
            insertBookStatement.setDouble(12, book.getSellPrice());

            result = insertBookStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL Error in addBook");
            e.printStackTrace();
        } // try/catch

        return result;
    } // addBook STILL NEED PUBLICATION YEAR FOR SQL
}
