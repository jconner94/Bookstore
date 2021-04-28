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
    private final String dbPass = "SqLSqrt1337!";

    public int addBook(Book book) throws ClassNotFoundException {
        String INSERT_BOOK_SQL = "INSERT INTO book" +
                " (isbn, category, authorName, title, coverPic," +
                " edition, publisher, publicationYear, quantityInStock," +
                " minimumThresh, buyPrice, sellPrice)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

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
            insertBookStatement.setInt(8,book.getPubYear());
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

    public String[] findBook(String book) throws ClassNotFoundException {
        String FIND_BOOK_SQL = "SELECT * FROM book WHERE title = ?";

        String[] result = new String[13];

        Class.forName("com.mysql.jdbc.Driver");
        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement findBookStatement = conn.prepareStatement(FIND_BOOK_SQL);
            findBookStatement.setString(1, book);
            ResultSet rs = findBookStatement.executeQuery();

            if(rs.next()) {
                result[0] = "" + rs.getInt(1);
                for(int i = 1; i < result.length; i++) {
                    result[i] = rs.getString(i+1);
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error in findBook");
            e.printStackTrace();
        }

        return result;
    }
}
