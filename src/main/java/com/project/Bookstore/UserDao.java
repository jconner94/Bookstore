package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";

    public int registerUser(User user) throws ClassNotFoundException {
        String FETCH_ID_SQL = "SELECT MAX(userID) FROM users";
        String INSERT_USERS_SQL = "INSERT INTO users" +
                " (userID, firstName, lastName, email, password," +
                " street, city, state, cardNum, expMonth, expYear, cvv)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement idStatement = conn.prepareStatement(FETCH_ID_SQL);
            ResultSet rs = idStatement.executeQuery();
            int maxID = 0;

            if(rs.next()) {
                maxID = rs.getInt("MAX(userID)");
            }

            maxID++; // ID for new user

            PreparedStatement insertUserStatement = conn.prepareStatement(INSERT_USERS_SQL);
            insertUserStatement.setInt(1, maxID);
            insertUserStatement.setString(2, user.getFirstName());
            insertUserStatement.setString(3, user.getLastName());
            insertUserStatement.setString(4, user.getEmail());
            insertUserStatement.setString(5, user.getPassword());
            insertUserStatement.setString(6, user.getStreet());
            insertUserStatement.setString(7, user.getCity());
            insertUserStatement.setString(8, user.getState());
            insertUserStatement.setString(9,  user.getCardNum());
            insertUserStatement.setString(10, user.getExpMonth());
            insertUserStatement.setString(11,  user.getExpYear());
            insertUserStatement.setString(12, user.getCvv());

            result = insertUserStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in registerUser");
            e.printStackTrace();
        } // try/catch

        return result;
    } // registerUser

    public String[] fetchUserInfo(User user) throws ClassNotFoundException {
        String FETCH_USER_INFO = "SELECT * FROM users WHERE userID = 1"; // Needs updating for dynamic use

        String[] result = new String[12];

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement userStatement = conn.prepareStatement(FETCH_USER_INFO);
            ResultSet rs = userStatement.executeQuery();

            if(rs.next()) {
                result[0] = "" + rs.getInt(1);
                for(int i = 1; i < 10; i++) {
                    result[i] = rs.getString(i+1);
                }
            }
        } catch(SQLException e) {
            System.out.println("SQL Error in fetchUserInfo");
            e.printStackTrace();
        } // try/catch

        return result;
    } // fetchUserInfo

    public int editUserInfo(User user) throws ClassNotFoundException {
        String UPDATE_USER_SQL = "UPDATE users SET firstName = ?, lastName = ?," +
                "password = ?, street = ?, city = ?, state = ?, cardNum = ?," +
                "expMonth = ?, expYear = ?, cvv = ?" +
                "WHERE userID = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement editStatement = conn.prepareStatement(UPDATE_USER_SQL);
            editStatement.setString(1, user.getFirstName());
            editStatement.setString(2,  user.getLastName());
            editStatement.setString(3, user.getPassword());
            editStatement.setString(4, user.getStreet());
            editStatement.setString(5, user.getCity());
            editStatement.setString(6, user.getState());
            editStatement.setString(7, user.getCardNum());
            editStatement.setString(8, user.getExpMonth());
            editStatement.setString(9, user.getExpYear());
            editStatement.setString(10, user.getCvv());
            editStatement.setInt(11, user.getUserID());

            result = editStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in editUserInfo");
            e.printStackTrace();
        }

        return result;
    } // editUserInfo

    public String[] getLoginInfo(String email, String password) throws ClassNotFoundException {
        String LOGIN_INFO_SQL = "SELECT userId, firstName FROM users WHERE email = ? AND password = ? limit 1";

        String[] result = new String[2];

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement loginStatement = conn.prepareStatement(LOGIN_INFO_SQL);
            loginStatement.setString(1, email);
            loginStatement.setString(2, password);
            ResultSet rs = loginStatement.executeQuery();
            result[0] = rs.getString(1);
            result[1] = rs.getString(2);
        } catch(SQLException e) {
            System.out.println("SQL Error in getLoginInfo");
            e.printStackTrace();
        }

        return result;
    } // getLoginInfo
}
