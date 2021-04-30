<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.project.Bookstore.Book" %>
<%@ page import="com.project.Bookstore.BookDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${Book.title}</title>

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
    <h1 class="title">Bookstore</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search.html"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="account.html"><img src="resources/profile-icon.svg" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div>
        <img src="${pageContext.request.contextPath}/resources/${Book.coverPic}" height="500" width="300" alt="">
        <h1>${Book.title}</h1>
        <ul class="book-info">
            <li>${Book.authorName}</li>
            <li>${Book.category}</li>
            <br><br>
            <li>${Book.description}</li>
            <br><br>
            <li>Published by ${Book.publisher}</li>
            <li>Edition: ${Book.edition}</li>
            <li>Current Stock: ${Book.currentStock}</li>
            <li>Price: $${Book.sellPrice}</li>
        </ul>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>