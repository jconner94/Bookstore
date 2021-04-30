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
    <a href="index.jsp" style="text-decoration: none; color: white"><h1 class="title">Bookstore</h1></a>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.html" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="icons">
        <li><a href="login-servlet"><img src="${pageContext.request.contextPath}/resources/profile-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="register-servlet">
            <img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <li><a href="search.jsp"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<main>
    <div class="login">
        <form action="forgot.jsp" id="myForm">
            <h1>Forgot Password</h1>
            <br>
            <label><b>Enter the email associated with your account, and we will send you a code to reset your password:</b></label><br>
            <input type="text" placeholder="email..." id="username" required>
            <br><br>
            <button type="submit" id="submit" onClick="sendEmail()">Send Me Email</button>
            <br><br>
        </form>
    </div>
    <div class="login">
        <form action="successfulForgot.html" id="passForm">
            <h1>Reset Password</h1>
            <br>
            <label><b>Enter the code sent via email, then update your password:</b></label><br>
            <input type="text" placeholder="code..." id="username" required>
            <br><br>
            <input type="password" name="password" placeholder="new password..." id="username2" required>
            <br><br>
            <input type="password" placeholder="confirm password..." id="username3" required>
            <br><br>
            <button type="submit" id="submit" onClick="if(checkCode()) {if(checkPass()){sendEmail()} else {return false}}else return false">Send Me Email</button>
            <br><br>
        </form>
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
            Body: "Use this code to reset your password: \n 08923471",
        })
        alert("Email sent to given address! Email might take up to 5 minutes to send. If you did not recieve an email, please try again.")
    }
</script>

<script>
    function checkPass() {
        let form1 = document.getElementById('passForm');
        if(form1.username2.value !== form1.username3.value) {
            alert("Password must match confirmation!");
            form1.username2.focus();
            return false;
        }
        return true;
    }
</script>

<script>
    function checkCode() {
        let form1 = document.getElementById('passForm');
        if(String(form1.username.value) !== "08923471") {
            alert("Invalid code!");
            form1.username.focus();
            return false;
        }
        return true;
    }
</script>
</head>