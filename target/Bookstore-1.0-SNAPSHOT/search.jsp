<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookstore | Home</title>

    <link rel="stylesheet" href="index.css">

    <style>
        main {
            padding: 2rem 10rem;
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
        <li><a href="search.jsp"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="account.html"><img src="resources/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div class="login">
        <form action="<%= request.getContextPath() %>/search-servlet" id="search" method="post">
            <h1>Search For Books</h1>
            <br>
            <label><b>Book Title, Author, or Genre:</b></label><br>
            <input type="text" placeholder="Enter your search..." id="username" name="search" required>
            <br><br>
            <button type="submit" id="action" value="Submit">Search!</button>
            <br><br>
        </form>
        <p name="searchResult" value=c:out value=${searchResult}></p>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>
<script>
    function checkform() {
        var form1 = document.getElementById('myForm');
        if (form1.username.value != "butts") {
            alert("Search does not match anything in database");
            form1.username.focus();
            return false;
        }
        return true;
    }
</script>