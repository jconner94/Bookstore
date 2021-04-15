<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <h1 class="title">ManageBooks</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search.html"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="login.jsp"><img src="resources/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="Shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <h3 class="section-title" id="demo">MANAGE BOOKS</h3>
    <div class="admin-options">
        <div class="option">
            <img src="resources/cart-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="post" action="addNewBook.jsp">
                    <button type="submit" class="shopButton" name="shopButton">Add New Book</button>
                </form>
            </div>
        </div>

        <div class="option">
            <img src="resources/profile-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="post" action="index.html"> <!-- Needs changing -->
                    <button type="submit" class="shopButton" name="shopButton">Edit Book Info</button>
                </form>
            </div>
        </div>

        <div class="option">
            <img src="resources/search-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="post" action="index.html"> <!-- Needs changing -->
                    <button type="submit" class="shopButton" name="shopButton">Delete Book</button>
                </form>
            </div>
        </div>
    </div>

</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>