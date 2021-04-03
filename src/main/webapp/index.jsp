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
        <a href="index.php" style="..."><h1 class="title">Bookstore</h1></a>
        <ul class="links">
            <li><a href="index.php" style="...">Home</a></li>
            <li><a href="register-servlet" style="text-decoration: none; color: white">Contact</a></li>
            <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
        </ul>
    </nav>
    <main>
        <div class="featured-items">
            <div class="book-window">
                <h2 class="section-title" id="demo">FEATURED</h2>
                <a href="Sample1.html"><img src="SampleBook1.jpg" class="images" height="500" width="300" alt=""></a>
            </div>

            <div class="book-window">
                <h2 class="section-title" id="demo2">TOP SELLERS</h2>
                <a href="Sample2.html"><img src="resources/SampleBook2.jpg" class="images" height="500" width="300" alt=""></a>
            </div>

        </div>
    </main>
    <footer>Copyright &copy; 2021</footer>
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