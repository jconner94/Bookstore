<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.project.Bookstore.Book" %>
<%@ page import="com.project.Bookstore.BookDao" %>
<%@ page import="com.project.Bookstore.Cart"%>
<%@ page import="com.project.Bookstore.CartDao" %>
<% BookDao bookDao = new BookDao(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookstore | Home</title>

    <link rel="stylesheet" href="index.css">

    <style>
        main {
            padding: .5rem;
            text-align: center;
        }
    </style>
</head>

<body>
<nav>
    <a href="index.jsp" style="text-decoration: none; color: white"><h1 class="title">${firstName}'s Cart</h1></a>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.jsp" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="greeting">
        <% if(session.getAttribute("firstName") == null) { %>
        <li> Hi Guest!</li>
        <% } else {%>
        <li>Hi ${firstName}!</li>
        <% if((Boolean) session.getAttribute("isAdmin")) { %>
        <li><a href="AdminMain.jsp" style="text-decoration: none; color: white">Admin Home</a></li>
        <% } %>
        <% } %>
    </ul>
    <ul class="icons">
        <% if(session.getAttribute("uid") == null) { %>
        <li><a href="login-servlet"><img src="${pageContext.request.contextPath}/resources/profile-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="register-servlet"><img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <% } else {%>
        <li><a href="logout-servlet"><img src="${pageContext.request.contextPath}/resources/logout-icon.png" alt="" class="top-icon" id="logoutIcon"/></a></li>
        <li><a href="edit-servlet"><img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <li><a href="cart-servlet"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
        <% } %>
        <li><a href="search-servlet"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<main>
    <h1>Purchased Books:</h1>
    <% int uid = Integer.parseInt(session.getAttribute("uid").toString()); %>
    <% double totalPrice = 0;%>
    <% double shippingPrice = 10.00;
        double tax; %>
    <% try { session.setAttribute("Books", new CartDao().getCurrentCart(uid)); }
    catch(ClassNotFoundException e) { e.printStackTrace(); }%>
    <table class="table-cart">
        <tbody>
        <tr>
            <th style="text-align: left"></th>
            <th style="text-align: left">Name</th>
            <th style="text-align: left">ISBN</th>
            <th style="text-align: right">Quantity</th>
            <th style="text-align: right">Price</th>
        </tr>
        <c:forEach var="book" items="${Books}">
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/${book.coverPic}" class="images" height="200" width="120" alt=""></td>
                <td>${book.title}</td>
                <td>${book.isbn}</td>
                <td>${book.currentStock}</td>
                <td>$${book.sellPrice}</td>
                <form>
                    <td><button type="submit" formaction="${pageContext.request.contextPath}/cart-servlet?bookCover=${book.coverPic}&title=${book.title}&remove=true" id="cartButton" formmethod="post">Remove from Cart</button></td>
                </form>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form method="post" action="${pageContext.request.contextPath}/checkout-servlet">
        <button type="submit" id="cartButton">Go to Checkout</button>
    </form>
</main>
<footer>Copyright &copy; 2021</footer>
<ul class="greeting">
    <% if(session.getAttribute("firstName") != null) { %>
    <script type = "text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <% } %>
</ul>
</body>
</html>