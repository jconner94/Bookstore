package com.project.Bookstore;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private final String jdbcUrl = "jdbc:mysql://:localhost:3306/bookstore";
    private final String dbUser = "root";
    private final String dbPass = "root";
    private final String encrypt = "root";

    public int registerUser(User user) throws ClassNotFoundException {
        String FETCH_ID_SQL = "SELECT MAX(userID) FROM users";
        String INSERT_USERS_SQL = "INSERT INTO users" +
                " (userID, firstName, lastName, email, password," +
                " street, city, state, cardNum, expMonth, expYear, cvv)" +
                " VALUES (?, ?, ?, ?, aes_encrypt(?, ?), ?, ?, ?, aes_encrypt(?, ?)," +
                " ?, ?, aes_encrypt(?, ?));";

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
            insertUserStatement.setString(6, encrypt);
            insertUserStatement.setString(7, user.getStreet());
            insertUserStatement.setString(8, user.getCity());
            insertUserStatement.setString(9, user.getState());
            insertUserStatement.setString(10,  user.getCardNum());
            insertUserStatement.setString(11, encrypt);
            insertUserStatement.setString(12, user.getExpMonth());
            insertUserStatement.setString(13,  user.getExpYear());
            insertUserStatement.setString(14, user.getCvv());
            insertUserStatement.setString(15, encrypt);

            System.out.println(insertUserStatement);

            result = insertUserStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in registerUser");
            e.printStackTrace();
        } // try/catch

        return result;
    } // registerUser

    public String[] fetchUserInfo(User user) throws ClassNotFoundException {
        String FETCH_USER_INFO = "SELECT * FROM users WHERE userID = ?";

        String[] result = new String[12];

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement userStatement = conn.prepareStatement(FETCH_USER_INFO);
            userStatement.setInt(1, user.getUserID());
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
                "password = aes_encrypt(?, ?), street = ?, city = ?, state = ?, " +
                "cardNum = aes_encrypt(?, ?), expMonth = ?, expYear = ?, cvv = aes_encrypt(?, ?)" +
                "WHERE userID = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement editStatement = conn.prepareStatement(UPDATE_USER_SQL);
            editStatement.setString(1, user.getFirstName());
            editStatement.setString(2,  user.getLastName());
            editStatement.setString(3, user.getPassword());
            editStatement.setString(4, encrypt);
            editStatement.setString(5, user.getStreet());
            editStatement.setString(6, user.getCity());
            editStatement.setString(7, user.getState());
            editStatement.setString(8, user.getCardNum());
            editStatement.setString(9, encrypt);
            editStatement.setString(10, user.getExpMonth());
            editStatement.setString(11, user.getExpYear());
            editStatement.setString(12, user.getCvv());
            editStatement.setString(13, encrypt);
            editStatement.setInt(14, user.getUserID());

            result = editStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in editUserInfo");
            e.printStackTrace();
        }

        return result;
    } // editUserInfo

    public User getLoginInfo(String email, String password) throws ClassNotFoundException {
        String LOGIN_INFO_SQL = "SELECT userID, firstName, lastName , isSuspended, isAdmin FROM `users` WHERE email = ? AND password = aes_encrypt(?, ?)";

        User user = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement loginStatement = conn.prepareStatement(LOGIN_INFO_SQL);
            loginStatement.setString(1, email);
            loginStatement.setString(2, password);
            loginStatement.setString(3, encrypt);
            ResultSet rs = loginStatement.executeQuery();

            if(rs.next()) {
                int userID = rs.getInt("userID");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                boolean isSuspended = rs.getBoolean("isSuspended");
                boolean isAdmin = rs.getBoolean("isAdmin");
                user = new User(userID, firstName, lastName, email, isSuspended, isAdmin);
            }

        } catch(SQLException e) {
            System.out.println("SQL Error in getLoginInfo");
            e.printStackTrace();
        }

        return user;
    } // getLoginInfo

    public int changePassword(int userID, String password) throws ClassNotFoundException {
        String PASSWORD_CHANGE_SQL = "UPDATE users SET password = aes_encrypt(?, ?), WHERE userID = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement passwordStatement = conn.prepareStatement(PASSWORD_CHANGE_SQL);
            passwordStatement.setString(1, password);
            passwordStatement.setString(2, encrypt);
            passwordStatement.setInt(3, userID);
            result = passwordStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in changePassword");
            e.printStackTrace();
        } // try/catch

        return result;
    }

    public int changeUserSuspension(int userID, boolean suspendStatus) throws ClassNotFoundException {
        String UPDATE_STATUS_URL = "UPDATE users SET isSuspended = ?, WHERE userID = ?";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement suspendStatement = conn.prepareStatement(UPDATE_STATUS_URL);
            suspendStatement.setBoolean(1, suspendStatus);
            suspendStatement.setInt(2, userID);
            result = suspendStatement.executeUpdate();
        } catch(SQLException e) {
            System.out.println("SQL Error in changeUserSuspension");
            e.printStackTrace();
        }

        return result;
    }

    public void banUser(int userID, int status) throws ClassNotFoundException {
        String BAN_USER_ACCOUNT = "UPDATE users SET isSuspended = ?, WHERE userID = ?";

        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            PreparedStatement banStatement = conn.prepareStatement(BAN_USER_ACCOUNT);
            banStatement.setInt(1, status);
            banStatement.setInt(2, userID);
            banStatement.executeQuery();

        } catch(SQLException e) {
            System.out.println("SQL Error in getLoginInfo");
            e.printStackTrace();
        }
    }
}
