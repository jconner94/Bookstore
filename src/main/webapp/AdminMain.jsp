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
        <li><a href="contact.jsp" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search-servlet"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="logout-servlet"><img src="resources/logout-icon.png" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <h3 class="section-title" id="demo">OPTIONS</h3>
    <div class="admin-options">
        <div class="option">
            <img src="resources/cart-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="post" action="ManageBooks.jsp">
                    <button type="submit" class="shopButton" name="shopButton">Manage Books</button>
                </form>
            </div>
        </div>

        <div class="option">
            <img src="resources/profile-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="get" action="ban-servlet"> <!-- Needs changing -->
                    <button type="submit" class="shopButton" name="shopButton">Manage Users</button>
                </form>
            </div>
        </div>

        <div class="option">
            <img src="resources/search-icon.svg" class="images" width="100%" height="100%">
            <div class="middle">
                <form method="get" action="add-promotion-servlet"> <!-- Needs changing -->
                    <button type="submit" class="shopButton" name="shopButton">Add Promotion</button>
                </form>
                <br>
                <form method="get" action="edit-promotion-servlet"> <!-- Needs changing -->
                    <input type="text" name="promoID" placeholder="Promo Code" id="editForm" required>
                    <button type="submit" class="shopButton" name="shopButton">Edit Promotion</button>
                </form>
                <br>
                <form method="get" action="send-promotion-servlet">
                    <input type="text" name="promoID" placeholder="Promo Code" id="editForm" required>
                    <button type="submit" class="shopButton" name="shopButton">Send Promotion</button>
                </form>
            </div>
        </div>
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