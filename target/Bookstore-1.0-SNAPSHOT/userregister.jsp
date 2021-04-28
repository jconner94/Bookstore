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
        <li><a href="search.jsp"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<br><br>
<div class = "editLogin">
    <h1>Create Account (*=required)</h1>
    <form action="<%= request.getContextPath() %>/register-servlet" id="createAcct" method="post">
        <br><br>
        <label><b>*First Name</b></label><br>
        <input type="text" name="firstName" placeholder="First Name..." id="username" required/>
        <br><br>
        <label><b>*Last Name</b></label><br>
        <input type="text" name="lastName" placeholder="Last Name..." id="username" required/>
        <br><br>
        <label><b>*Email</b></label><br>
        <input type="text" name="email" placeholder="Email..." id="username2" required/>
        <br><br>
        <label><b>*Password</b></label><br>
        <label>(Must contain at least one uppercase letter, one lowercase letter, one number, and must be at least 8 characters long)</label><br>
        <input type="password" name="password" placeholder="Password..." pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="username" required/>
        <br><br>
        <label><b>*Confirm Password</b></label><br>
        <input type="password" name="confPassword" placeholder="Confirm Password..." id="username" required/>
        <br><br>
        <label><b>Street Address</b></label><br>
        <input type="text" name="street" placeholder="Street Address..." id="username" />
        <br><br>
        <label><b>City</b></label><br>
        <input type="text" name="city" placeholder="City..." id="username" />
        <br><br>
        <label><b>State</b></label><br>
        <select name="state">
            <option value=""></option>
            <option value="AL">Alabama</option>
            <option value="AK">Alaska</option>
            <option value="AZ">Arizona</option>
            <option value="AR">Arkansas</option>
            <option value="CA">California</option>
            <option value="CO">Colorado</option>
            <option value="CT">Connecticut</option>
            <option value="DE">Delaware</option>
            <option value="DC">District Of Columbia</option>
            <option value="FL">Florida</option>
            <option value="GA">Georgia</option>
            <option value="HI">Hawaii</option>
            <option value="ID">Idaho</option>
            <option value="IL">Illinois</option>
            <option value="IN">Indiana</option>
            <option value="IA">Iowa</option>
            <option value="KS">Kansas</option>
            <option value="KY">Kentucky</option>
            <option value="LA">Louisiana</option>
            <option value="ME">Maine</option>
            <option value="MD">Maryland</option>
            <option value="MA">Massachusetts</option>
            <option value="MI">Michigan</option>
            <option value="MN">Minnesota</option>
            <option value="MS">Mississippi</option>
            <option value="MO">Missouri</option>
            <option value="MT">Montana</option>
            <option value="NE">Nebraska</option>
            <option value="NV">Nevada</option>
            <option value="NH">New Hampshire</option>
            <option value="NJ">New Jersey</option>
            <option value="NM">New Mexico</option>
            <option value="NY">New York</option>
            <option value="NC">North Carolina</option>
            <option value="ND">North Dakota</option>
            <option value="OH">Ohio</option>
            <option value="OK">Oklahoma</option>
            <option value="OR">Oregon</option>
            <option value="PA">Pennsylvania</option>
            <option value="RI">Rhode Island</option>
            <option value="SC">South Carolina</option>
            <option value="SD">South Dakota</option>
            <option value="TN">Tennessee</option>
            <option value="TX">Texas</option>
            <option value="UT">Utah</option>
            <option value="VT">Vermont</option>
            <option value="VA">Virginia</option>
            <option value="WA">Washington</option>
            <option value="WV">West Virginia</option>
            <option value="WI">Wisconsin</option>
            <option value="WY">Wyoming</option>
        </select><br>
        <br><br>
        <label><b>Credit Card Number</b></label><br>
        <input type="tel" name="cardNum" inputmode="numeric" pattern="[0-9\s]{13,19}"
               autocomplete="Card Number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx" id="username" />
        <br><br>
        <label><b>Card Expiration Date</b></label><br>

        <select name="expMonth">
            <option value=""></option>
            <option value="01">01-January</option>
            <option value="02">02-February</option>
            <option value="03">03-March</option>
            <option value="04">04-April</option>
            <option value="05">05-May</option>
            <option value="06">06-June</option>
            <option value="07">07-July</option>
            <option value="08">08-August</option>
            <option value="09">09-September</option>
            <option value="10">10-October</option>
            <option value="11">11-November</option>
            <option value="12">12-December</option>
        </select><!--<br>
        <br><br>-->
        <select name="expYear">
            <option value=""></option>
            <option value="21">2021</option>
            <option value="22">2022</option>
            <option value="23">2023</option>
            <option value="24">2024</option>
            <option value="25">2025</option>
            <option value="26">2026</option>
            <option value="27">2027</option>
            <option value="28">2028</option>
            <option value="29">2029</option>
            <option value="30">2030</option>
        </select><br>
        <br><br>
        <label><b>Security Code</b></label><br>
        <input type="text" name="cvv" inputmode="numeric" pattern="[0-9\s]{3}"
               autocomplete="CVV" maxlength="3" placeholder="xxx" id="username" />
        <br><br>
        <button type="submit" id="create" onClick = "if(checkPass()) { sendEmail()} else {return false}" value="Submit">
            Create Account</button>
    </form>
</div>
<br><br>
</body>

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