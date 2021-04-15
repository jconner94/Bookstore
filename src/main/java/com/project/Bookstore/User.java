package com.project.Bookstore;

public class User {
    private int userID;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String street;
    private String city;
    private String state;
    private String cardNum;
    private String expMonth;
    private String expYear;
    private String cvv;
    private boolean isSuspended;
    private boolean isAdmin;

    public User() { }

    public User(int userID, String firstName, String lastName, String email, boolean isSuspended) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.isSuspended = isSuspended;
    }

    public User(int userID, String firstName, String lastName, String email, boolean isSuspended, boolean isAdmin) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.isSuspended = isSuspended;
        this.isAdmin = isAdmin;
    }

    public int getUserID() { return userID; } // getUserId

    public void setUserID(int userID) {
        this.userID = userID;
    } // setUserId

    public String getFirstName() {
        return firstName;
    } // getFirstName

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    } // setFirstName

    public String getLastName() {
        return lastName;
    } // getLastName

    public void setLastName(String lastName) {
        this.lastName = lastName;
    } // setLastName

    public String getEmail() {
        return email;
    } // getEmail

    public void setEmail(String email) {
        this.email = email;
    } // setEmail

    public String getPassword() {
        return password;
    } // getPassword

    public void setPassword(String password) {
        this.password = password;
    } // setPassword

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCardNum() {
        return cardNum;
    }

    public void setCardNum(String cardNum) {
        this.cardNum = cardNum;
    }

    public String getExpMonth() {
        return expMonth;
    }

    public void setExpMonth(String expMonth) {
        this.expMonth = expMonth;
    }

    public String getExpYear() {
        return expYear;
    }

    public void setExpYear(String expYear) {
        this.expYear = expYear;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public boolean getIsSuspended() { return isSuspended; }

    public void setIsSuspended(boolean isSuspended) { this.isSuspended = isSuspended; }

    public boolean getIsAdmin() { return isAdmin; }

    public void setIsAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }

    public String toString() {
        String result = ("UID: " + userID + "\n");
        result += ("firstName: " + firstName + "\n");
        result += ("lastName: " + lastName + "\n");
        result += ("email: " + email + "\n");
        result += ("isSuspended: " +isSuspended + "\n");

        return result;
    }

}
