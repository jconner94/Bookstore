<?php

require('database.php');

$query = 'SELECT * FROM book WHERE `isbn` = 978037572 OR `isbn` = 978043906';

$statement = $db->prepare($query);
$statement->execute();
$books = $statement->fetchAll();
$statement->closeCursor();
?>



<!DOCTYPE html>
<html lang="en">
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
        <a href="index.html" style="text-decoration: none; color: white"><h1 class="title">Bookstore</h1></a>
        <ul class="links">
            <li><a href="index.html" style="text-decoration: none; color: white">Home</a></li>
            <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
            <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
        </ul>
        <ul class="icons">
            <li><a href="search.html"><img src="../resources/search-icon.svg" alt="" class="top-icon"></a></li>
            <li><a href="../../web/jsps/login.jsp">
                <img src="../resources/profile-icon.svg" class="top-icon" id="entry" alt=""></a></li>
            <li><a href="shop.html"><img src="../resources/cart-icon.svg" alt="" class="top-icon"></a></li>
        </ul>
    </nav>
    <main>
        <div class="featured-items">
            <?php foreach ($books as $book) : ?>
                <div class="book-window">
                    <h2 class="section-title" id="demo">FEATURED</h2>
                    <a href="Sample1.html"><img src="resources/<?php echo $book['coverPic'] ?>.jpg" class="images" height="500" width="300" alt=""></a>
                </div>
            <?php endforeach; ?>
        </div>
    </main>
    <footer>Copyright &copy; 2021</footer>
</body>
</html>