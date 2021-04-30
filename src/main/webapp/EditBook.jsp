<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>"
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.Bookstore.Book"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookstore | Home</title>

    <link rel="stylesheet" href="index.css">

    <style>
        main {
            padding: 2rem 10rem;
        }

        .welcome-message {
            text-align: left;
        }
        .section-title {
            text-align: center;
            margin-top: 8rem;
            margin-bottom: 2rem;
            color: #404040;
        }

        .admin-options {
            display: flex;
            text-align: center;
        }

        .option {
            padding: 2rem;
            width: 12rem;
            height: 15rem;
            background-color: #404040;
            margin: 0 4rem;
            opacity: 1;
            transition: .5s ease;
        }

    </style>

</head>
<body>
<nav>
    <h1 class="title">Edit ${Book.title}</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search-servlet"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="logout-servlet"><img src="resources/logout-icon.png" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
<br><br>
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
