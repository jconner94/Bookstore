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
        <li><a href="contact.jsp" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="greeting">
        <% if(session.getAttribute("firstName") == null) { %>
        <li> Hi Guest!</li>
        <% } else {%>
        <li>Hi ${firstName}!</li>
        <% } %>
    </ul>
    <ul class="icons">
        <% if(session.getAttribute("uid") == null) { %>
        <li><a href="login-servlet"><img src="${pageContext.request.contextPath}/resources/profile-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="register-servlet"><img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <% } else {%>
        <li><a href="logout-servlet"><img src="${pageContext.request.contextPath}/resources/logout-icon.png" alt="" class="top-icon" id="logoutIcon"/></a></li>
        <li><a href="edit-servlet"><img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <% } %>
        <li><a href="search-servlet"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<main>
    <div>
        <img src="${pageContext.request.contextPath}/resources/${Book.coverPic}" height="500" width="300" alt="">
        <h1>${Book.title}</h1>
        <script>function getDescription() {
            let desc = String(${Book.description});
            return desc;
        } </script>
        <ul class="book-info">

            <li>${Book.authorName}</li>
            <li>${Book.category}</li>
            <br><br>
            <div id="content">
            <li>${Book.description}</li>
            </div>
            <br><br>
            <li>Published by: ${Book.publisher}</li>
            <li>Edition: ${Book.edition}</li>
            <li>Current Stock: ${Book.currentStock}</li>
            <li>Price: $${Book.sellPrice}</li>
        </ul>
        <form action="<%= request.getContextPath() %>/cart-servlet?bookCover=${Book.coverPic}&title=${Book.title}" id ="cartButton" method="post">
            <button type="submit" id="addCart" value="add">Add to Cart</button>
        </form>
        <form action="<%= request.getContextPath() %>/cart-servlet" id="cartButton" method="get">
            <button type="submit" id="seeCart" value="see">See Cart</button>
        </form>
    </div>
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