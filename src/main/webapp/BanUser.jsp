<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ban User | Home</title>

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
    <a href="index.jsp" style="text-decoration: none; color: white"><h1 class="title">Bookstore</h1></a>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search-servlet"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="logout-servlet"><img src="resources/logout-icon.png" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <form action="<%= request.getContextPath() %>/ban-servlet" id="BanUser" method="post">
        <label for="userid">Enter User ID:</label>
        <input type="text" id="userid" name="userid"><br>
        Select Action:<br>
        <input type="radio" id="ban" name="ban" value="1">
        <label for="ban">Ban Account</label><br>
        <input type="radio" id="ban" name="ban" value="0">
        <label for="ban">Unban Account</label><br>
        <button type="submit" id="action" value="Submit">
            Submit Changes</button>
    </form>
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
<!--<div>
<h1>Bookstore Project</h1>
<form action="/register" method="post">
<p>
First Name: <input type="text" name="firstName" placeholder="First Name..." required />
</p>
<p>
Last Name: <input type="text" name="lastName" placeholder="Last Name..." required />
</p>
<p>
<button type="submit" name="info" value="Submit">Click Here</button>
</p>
</form>
</div>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>-->