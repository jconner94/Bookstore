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

    public int getUserID() {
        return userID;
    } // getUserId

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

}
