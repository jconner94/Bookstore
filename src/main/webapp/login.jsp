<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Account | Home</title>

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
    </ul>
    <ul class="icons">
        <li><a href="login-servlet"><img src="${pageContext.request.contextPath}/resources/profile-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="register-servlet">
            <img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <li><a href="search.html"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<div class = "login">
    <h1>Customer Login</h1>
    <form action="<%= request.getContextPath() %>/login-servlet" id="login" method="post">
        <label><b>Email</b></label><br>
        <input type="text" name="email" placeholder="Email..." id="username2" required/>
        <br><br>
        <label><b>Password</b></label><br>
        <input type="password" name="password" placeholder="Password..." id="username" required/>
        <br><br>
        <button type="submit" id="create" onClick = "funcCaller()" value="Submit">
            Login</button>
    </form>
</div>

<div class = "editLogin">
    <h1>Admin Login</h1>
    <form action="AdminMain.html" id="login" method="post">
        <label><b>Email</b></label><br>
        <input type="text" name="email" placeholder="Email..." id="username2" required/>
        <br><br>
        <label><b>Password</b></label><br>
        <input type="password" name="password" placeholder="Password..." id="username" required/>
        <br><br>
        <button type="submit" id="create" onClick = "funcCaller()" value="Submit">
            Login</button>
    </form>
</div>
</body>

<script>
    function funcCaller(){
        checkPass();
        sendEmail();
    }
</script>

<script>
    function checkPass() {
        let form1 = document.getElementById('createAcct');
        if(form1.password.value !== form1.confPassword.value) {
            alert("Password must match confirmation!");
            form1.password.focus();
            return false;
        }
        return true;
    }
</script>

<script>
    function checkEmail() {
        console.log("in checkEmail");
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        let form1 = document.getElementById('createAcct');
        let emailCheck = form1.email.value;

        if(re.test(emailCheck)) {
            return true
        } else {
            alert("Invalid Email Address!");
            return false
        }
    }
</script>

<script>
    function validationChecks() {
        return checkPass() && checkEmail();
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#registerForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },

                password: "required",
            },
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                },

                password: "Please enter password"
            }
        });
    });
</script>
</html>
<script
        src="https://smtpjs.com/v3/smtp.js">
</script>

<script type="text/javascript">
    function sendEmail() {
        var form1 = document.getElementById('createAcct');
        Email.send({
            Host: "smtp.gmail.com",
            Username: "bookstore3c@gmail.com",
            Password: "strongestpassword#1",
            To: String(form1.username2.value),
            From: "bookstore3c@gmail.com",
            Subject: "Account Creation Successful",
            Body: "This is a confirmation email letting you know that you have created an account on the bookstore website",
        })
        alert("Email sent to given address! Email might take up to 5 minutes to send. If you did not recieve an email, please try again.")
    }
</script>
</head>