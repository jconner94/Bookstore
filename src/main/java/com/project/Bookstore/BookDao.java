package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class BookDao {
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";

    public int addBook(Book book) throws ClassNotFoundException {
        String INSERT_BOOK_SQL = "INSERT INTO book" +
                " (isbn, category, authorName, title, coverPic," +
                " edition, publisher, publicationYear, quantityInStock," +
                " minimumThresh, buyPrice, sellPrice, description)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement insertBookStatement = conn.prepareStatement(INSERT_BOOK_SQL);
            insertBookStatement.setLong(1, book.getIsbn());
            insertBookStatement.setString(2, book.getCategory());
            insertBookStatement.setString(3, book.getAuthorName());
            insertBookStatement.setString(4, book.getTitle());
            insertBookStatement.setString(5, book.getCoverPic());
            insertBookStatement.setInt(6, book.getEdition());
            insertBookStatement.setString(7, book.getPublisher());
            insertBookStatement.setInt(8,book.getPubYear());
            insertBookStatement.setInt(9, book.getCurrentStock());
            insertBookStatement.setInt(10, book.getMinimumThreshold());
            insertBookStatement.setDouble(11, book.getBuyPrice());
            insertBookStatement.setDouble(12, book.getSellPrice());
            insertBookStatement.setString(13, book.getDescription());

            result = insertBookStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL Error in addBook");
            e.printStackTrace();
        } // try/catch

        return result;
    } // addBook STILL NEED PUBLICATION YEAR FOR SQL

    public Book[] getAllBooks() throws ClassNotFoundException {
        String COUNT_BOOKS_SQL = "SELECT COUNT(*) FROM book";
        String SELECT_BOOKS_SQL = "SELECT * FROM book ORDER BY title";

        Book[] books = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement countBooksStatement = conn.prepareStatement(COUNT_BOOKS_SQL);
            ResultSet rs = countBooksStatement.executeQuery();
            int count = 0;

            if(rs.next()) {
                count = rs.getInt(1);
            }

            books = new Book[count];

            PreparedStatement selectBooksStatement = conn.prepareStatement(SELECT_BOOKS_SQL);
            rs = selectBooksStatement.executeQuery();
            int index = 0;
            while(rs.next()) {
                Book book = new Book();
                book.setIsbn(rs.getLong("isbn"));
                book.setCategory(rs.getString("category"));
                book.setAuthorName(rs.getString("authorName"));
                book.setTitle(rs.getString("title"));
                book.setCoverPic(rs.getString("coverPic"));
                book.setEdition(rs.getInt("edition"));
                book.setPublisher(rs.getString("publisher"));
                book.setPubYear(rs.getInt("publicationYear"));
                book.setCurrentStock(rs.getInt("quantityInStock"));
                book.setMinimumThreshold(rs.getInt("minimumThresh"));
                book.setBuyPrice(rs.getDouble("buyPrice"));
                book.setSellPrice(rs.getDouble("sellPrice"));
                book.setDescription(rs.getString("description"));
                books[index] = book;
                index++;
            }

        } catch (SQLException e) {
            System.out.println("SQL Error in getAllBooks");
            e.printStackTrace();
        }

        return books;
    }

    public Book[] getBookSearch(String query) throws ClassNotFoundException {
        String[] words = query.split(" ");
        String[] categories = {"title", "authorName", "category"};
        String COUNT_BOOKS_SQL = "SELECT COUNT(*) FROM book WHERE ";
        String BOOK_SEARCH_SQL = "SELECT * FROM book WHERE ";
        String whereClause = "";
        for(int i = 0; i < categories.length; i++) {
            whereClause += categories[i] + " LIKE ";
            for (int j = 0; j < words.length; j++) {
                whereClause += ("'%" + words[j] + "%'");
                if ((j + 1) < words.length) {
                    whereClause += " OR " + categories[i] + " LIKE ";
                } else if ((i + 1) < categories.length) {
                    whereClause += " OR ";
                } else {
                    whereClause += " ORDER BY title;";
                }
            }
        }

        // System.out.println(BOOK_SEARCH_SQL);

        Book[] books = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            PreparedStatement countBooksStatement = conn.prepareStatement(COUNT_BOOKS_SQL + whereClause);
            ResultSet rs = countBooksStatement.executeQuery();
            int count = 0;

            if(rs.next()) {
                count = rs.getInt(1);
            }

            books = new Book[count];

            PreparedStatement searchStatement = conn.prepareStatement(BOOK_SEARCH_SQL + whereClause);
            rs = searchStatement.executeQuery();
            int index = 0;
            while(rs.next()) {
                Book book = new Book();
                book.setIsbn(rs.getLong("isbn"));
                book.setCategory(rs.getString("category"));
                book.setAuthorName(rs.getString("authorName"));
                book.setTitle(rs.getString("title"));
                book.setCoverPic(rs.getString("coverPic"));
                book.setEdition(rs.getInt("edition"));
                book.setPublisher(rs.getString("publisher"));
                book.setPubYear(rs.getInt("publicationYear"));
                book.setCurrentStock(rs.getInt("quantityInStock"));
                book.setMinimumThreshold(rs.getInt("minimumThresh"));
                book.setBuyPrice(rs.getDouble("buyPrice"));
                book.setSellPrice(rs.getDouble("sellPrice"));
                book.setDescription(rs.getString("description"));
                books[index] = book;
                index++;
            }

        } catch (SQLException e) {
            System.out.println("SQLError in getBookSearch");
            e.printStackTrace();
        }

        // for(int i = 0; i < books.length; i++) {
        //    System.out.println(books[i].getTitle() + "\t" + books[i].getAuthorName());
        // }

        return books;
    }

    public Book getBookByTitle(String title) throws ClassNotFoundException {
        String GET_BOOK_SQL = "SELECT * FROM book WHERE title = ?";

        Book book = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement bookStatement = conn.prepareStatement(GET_BOOK_SQL);
            bookStatement.setString(1, title);
            ResultSet rs = bookStatement.executeQuery();

            if(rs.next()) {
                book = new Book();
                book.setIsbn(rs.getLong("isbn"));
                book.setCategory(rs.getString("category"));
                book.setAuthorName(rs.getString("authorName"));
                book.setTitle(rs.getString("title"));
                book.setCoverPic(rs.getString("coverPic"));
                book.setEdition(rs.getInt("edition"));
                book.setPublisher(rs.getString("publisher"));
                book.setPubYear(rs.getInt("publicationYear"));
                book.setCurrentStock(rs.getInt("quantityInStock"));
                book.setMinimumThreshold(rs.getInt("minimumThresh"));
                book.setBuyPrice(rs.getDouble("buyPrice"));
                book.setSellPrice(rs.getDouble("sellPrice"));
                book.setDescription(rs.getString("description"));
            }

        } catch (SQLException e) {
            System.out.println("SQLException in getBookByTitle");
            e.printStackTrace();
        }

        return book;
    }

    public Book getRandomBook() {
        Random r = new Random();
        Book[] books = null;
        try {
            books = getAllBooks();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if(books.length > 0) {
            int rand = r.nextInt(books.length);
            return books[rand];
        } else {
            return null;
        }
    }

}
