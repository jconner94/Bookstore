<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bookstore | Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css" type="text/css">

    <style>main {padding: 2rem 10rem;}</style>
</head>
<body>
<nav>
    <h1 class="title">Confirmation Page</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search.html"><img src="NavIcons/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="account.html"><img src="NavIcons/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="NavIcons/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div style="text-align: center;"><h1>Congratulations!</h1></div>
    <div class="login">
        <label><b>Your account has successfully been created.</b></label>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>