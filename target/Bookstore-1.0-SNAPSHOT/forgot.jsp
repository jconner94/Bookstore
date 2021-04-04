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
        <li><a href="search.html"><img src="NavIcons/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="account.html"><img src="NavIcons/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="NavIcons/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div class="login">
        <form action="forgot.html" id="myForm">
            <h1>Forgot Password</h1>
            <br>
            <label><b>Enter the email associated with your account, and we will send you your password:</b></label><br>
            <input type="text" placeholder="email..." id="username" required>
            <br><br>
            <button type="submit" id="submit" onClick="sendEmail()">Send Me Email</button>
            <br><br>
        </form>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>

<script
        src="https://smtpjs.com/v3/smtp.js">
</script>

<script type="text/javascript">
    function sendEmail() {
        var form1 = document.getElementById('myForm');
        Email.send({
            Host: "smtp.gmail.com",
            Username: "bookstore3c@gmail.com",
            Password: "strongestpassword#1",
            To: String(form1.username.value),
            From: "bookstore3c@gmail.com",
            Subject: "Forgot Password",
            Body: "Hello " + "${firstName}" ", \nThe password to your account is, " + "${password}",
        })
        alert("Email sent to given address! Email might take up to 5 minutes to send. If you did not recieve an email, please try again.")
    }
</script>
</head>