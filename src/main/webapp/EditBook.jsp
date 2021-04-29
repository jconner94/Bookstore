<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>"
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.Bookstore.Book"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/update-book-servlet" id="addBook" method="post">
    <h1>Edit ${Book.title}</h1>
    <br>
    <label><b>ISBN:</b></label>
    <input type="text" name="isbn" value="${Book.isbn}" id="isbn" required maxlength="13">
    <br><br>
    <label><b>Title:</b></label>
    <input type="text" name="title" value="${Book.title}" id="title" required>
    <br><br>
    <label><b>Author(s):</b></label>
    <input type="text" name="author" value="${Book.authorName}" id="author" required>
    <br><br>
    <label><b>Category:</b></label>
    <input type="text" name="category" value="${Book.category}" id="category" required>
    <br><br>
    <label><b>Edition:</b></label>
    <input type="text" name="edition" value="${Book.edition}" id="edition" required>
    <br><br>
    <label><b>Publisher:</b></label>
    <input type="text" name="publisher" value="${Book.publisher}" id="publisher" required>
    <br><br>
    <label><b>Publication Year:</b></label>
    <input type="text" name="pubYear" value="${Book.pubYear}" id="year" required>
    <br><br>
    <label><b>Quantity In Stock:</b></label>
    <input type="text" name="quantity" value="${Book.currentStock}" id="quantity" required>
    <br><br>
    <label><b>Minimum Threshold:</b></label>
    <input type="text" name="minThreshold" value="${Book.minimumThreshold}" id="minthreshold" required>
    <br><br>
    <label><b>Buying Price:</b></label>
    <input type="text" name="buyPrice" value="${Book.buyPrice}" id="buyprice" required>
    <br><br>
    <label><b>Selling Price:</b></label>
    <input type="text" name="sellPrice" value="${Book.sellPrice}" id="sellprice" required>
    <br><br>
    <label><b>Description:</b></label>
    <textarea name="description" id="description" maxlength="4096" required>${Book.description}</textarea>
    <br><br>
    <label><b>Book Cover:</b></label>
    <br>
    <img src="${pageContext.request.contextPath}/resources/${Book.coverPic}" class="images" height="500" width="300" alt="">
    <br>
    <input type="text" name="bookCover" value="${Book.coverPic}" id="bookcover" readonly>
    <br>
    <input type="file" name="newBookCover" id="bookcover">
    <br><br>
    <button type="submit" id="submit">Submit Changes</button>
    <br><br>
    <button type="submit" formaction="ManageBooks.jsp" id="submit">Return to Manage Books Page</button>
    <br><br>
</form>
<form action="<%= request.getContextPath() %>/edit-book-servlet" id="addBook" method="post">
    <input type="text" name="query">
    <button type="submit">Search</button>
</form>
</body>
</html>
