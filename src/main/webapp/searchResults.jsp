<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>"
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.Bookstore.Book"%>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/search-servlet" id="addBook" method="get">
    <h1>Search Results:</h1>
    <table>
        <tr>
            <th></th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Edition</th>
            <th>Publisher</th>
            <th>Publication Year</th>
            <th>Quantity in Stock</th>
            <th>Sell Price</th>
            <th>ISBN</th>
        </tr>
        <c:forEach var="book" items="${Books}">
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/${book.coverPic}" class="images" height="500" width="300" alt=""></td>
                <td>${book.title}</td>
                <td>${book.authorName}</td>
                <td>${book.category}</td>
                <td>${book.edition}</td>
                <td>${book.publisher}</td>
                <td>${book.pubYear}</td>
                <td>${book.currentStock}</td>
                <td>$${book.sellPrice}</td>
                <td>${book.isbn}</td>
                <td><button type="submit" formaction="${pageContext.request.contextPath}/cart-servlet?bookCover=${book.coverPic}&title=${book.title}" id ="cartButton" formmethod="post">Add to Cart</button></td>
            </tr>
        </c:forEach>
    </table>
    <button type="submit" id="submit">Return to Search</button>
    <br><br>
</form>
<% session.removeAttribute("Books"); %>
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