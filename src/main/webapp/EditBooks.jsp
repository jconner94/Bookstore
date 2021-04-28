<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>"
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.Bookstore.Book"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/AdminMain.jsp" id="addBook" method="post">
    <h1>Test</h1>
    <table>
        <tr>
            <th>Cover</th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Edition</th>
            <th>Publisher</th>
            <th>Publication Year</th>
            <th>Quantity in Stock</th>
            <th>Minimum Threshold</th>
            <th>Buy Price</th>
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
                <td>${book.minimumThreshold}</td>
                <td>$${book.buyPrice}</td>
                <td>$${book.sellPrice}</td>
                <td>${book.isbn}</td>
                <td><button>Edit</button></td>
                <td><button>Delete</button></td>
            </tr>
        </c:forEach>
    </table>
    <button type="submit" id="submit">Return to Admin Page</button>
    <br><br>
</form>
<form action="<%= request.getContextPath() %>/edit-book-servlet" id="addBook" method="post">
    <input type="text" name="query">
    <button type="submit">Search</button>
</form>
</body>
</html>
