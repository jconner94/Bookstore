<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookstore | Home</title>

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
    <a href="loggedInIndex.jsp" style="text-decoration: none; color: white"><h1 class="title">Bookstore</h1></a>
    <ul class="links">
        <li><a href="loggedInIndex.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="icons">
        <li><a href="logout-servlet"><img src="${pageContext.request.contextPath}/resources/logout-icon.png" alt="" class="top-icon" id="logoutIcon"/></a></li>
        <li><a href="edit-servlet">
            <img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <li><a href="search.html"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet">Y</a></li>
    </ul>
</nav>
<main>
    <div class="featured-items">
        <div class="book-window">
            <h2 class="section-title" id="demo">FEATURED</h2>
            <a href="Sample1.html"><img src="resources/TheDevilInTheWhiteCity.jpg" class="images" height="500" width="300" alt=""></a>
            <br><br>
            <button type="submit" id="submit2" >Add to Cart</button>
            <br><br>
        </div>

        <div class="book-window">
            <h2 class="section-title" id="demo2">TOP SELLERS</h2>
            <a href="Sample2.html"><img src="resources/HarryPotterAndTheChamberOfSecrets.jpg" class="images" height="500" width="300" alt=""></a>
            <br><br>
            <button type="submit" id="submit2" >Add to Cart</button>
            <br><br>
        </div>

    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>


<script type = "text/javascript" >
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>