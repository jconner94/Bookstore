<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
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
    <h1 class="title">Admin Home</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
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
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <br><br>
    <% session.setAttribute("deleteTitle", request.getParameter("title")); %>
    <% session.setAttribute("deleteCover", request.getParameter("cover")); %>
    <form name="confirmDelete" action="<%= request.getContextPath() %>/delete-book-servlet?title=${deleteTitle}" method="post">
        <img src="${pageContext.request.contextPath}/resources/${deleteCover}" class="images" height="500" width="300" alt="">
        <br>
        <h3>${deleteTitle}</h3>
        <br><br>
        <h5>Are you sure you want to delete ${deleteTitle}?</h5>
        <br>
        <button type="submit">Yes</button>
        <button type="submit" formaction="ManageBooks.jsp">No</button>
    </form>

</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>