<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
    <h1 class="title">Manage Users</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search.jsp"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="login.jsp"><img src="resources/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <h3 class="section-title" id="demo">MANAGE USERS</h3>
    <% ArrayList users = (ArrayList)request.getAttribute("users"); %>
    <table style="width:100%">
        <tr>
            <th>User ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Suspended?</th>
        </tr>
        <% for (int i = 0; i < users.size(); i++) { %>
            <tr>This is a table row</tr>
        <% } %>
    </table>


</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>