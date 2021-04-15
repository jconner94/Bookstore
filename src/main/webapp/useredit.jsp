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
<br><br>
<div class= "editLogin">
    <h1>Edit Profile</h1>
    <form action="<%= request.getContextPath() %>/edit-servlet" id="editAcct" method="post">
        <br><br>
        <label><b>First Name</b></label><br>
        <input type="text" name="firstName" id = "editForm" value="${firstName}" required/>
        <br><br>
        <label><b>Last Name</b></label><br>
        <input type="text" name="lastName" id = "editForm" value="${lastName}"required>
        <br><br>
        <label><b>Email</b></label><br>
        <input type="text" name="email" id="editEmail" value="${email}" readonly/>
        <br><br>
        <label><b>Password</b></label><br>
        <input type="password" name="password" id = "editForm" placeholder="Password" required/>
        <br><br>
        <label><b>Confirm Password</b></label><br>
        <input type="password" name="confPassword" id = "editForm" placeholder="Confirm Password..." required/>
        <br><br>
        <label><b>Street Address</b></label><br>
        <input type="text" name="street" id = "editForm" value="${street}"/>
        <br><br>
        <label><b>City</b></label><br>
        <input type="text" name="city" id = "editForm" value="${city}"/>
        <br><br>
        <label><b>State</b></label><br>
        <select name="state">
            <option value=""></option>
            <option value="AL" selected="@${state} == AL">Alabama</option>
            <option value="AK" selected="@${state} == AK">Alaska</option>
            <option value="AZ" selected="@${state} == AZ">Arizona</option>
            <option value="AR" selected="@${state} == AR">Arkansas</option>
            <option value="CA" selected="@${state} == CA">California</option>
            <option value="CO" selected="@${state} == CO">Colorado</option>
            <option value="CT" selected="@${state} == CT">Connecticut</option>
            <option value="DE" selected="@${state} == DE">Delaware</option>
            <option value="DC" selected="@${state} == DC">District Of Columbia</option>
            <option value="FL" selected="@${state} == FL">Florida</option>
            <option value="GA" selected="@${state} == GA">Georgia</option>
            <option value="HI" selected="@${state} == HI">Hawaii</option>
            <option value="ID" selected="@${state} == ID">Idaho</option>
            <option value="IL" selected="@${state} == IL">Illinois</option>
            <option value="IN" selected="@${state} == IN">Indiana</option>
            <option value="IA" selected="@${state} == IA">Iowa</option>
            <option value="KS" selected="@${state} == KS">Kansas</option>
            <option value="KY" selected="@${state} == KY">Kentucky</option>
            <option value="LA" selected="@${state} == LA">Louisiana</option>
            <option value="ME" selected="@${state} == ME">Maine</option>
            <option value="MD" selected="@${state} == MD">Maryland</option>
            <option value="MA" selected="@${state} == MA">Massachusetts</option>
            <option value="MI" selected="@${state} == MI">Michigan</option>
            <option value="MN" selected="@${state} == MN">Minnesota</option>
            <option value="MS" selected="@${state} == MS">Mississippi</option>
            <option value="MO" selected="@${state} == MO">Missouri</option>
            <option value="MT" selected="@${state} == MT">Montana</option>
            <option value="NE" selected="@${state} == NE">Nebraska</option>
            <option value="NV" selected="@${state} == NV">Nevada</option>
            <option value="NH" selected="@${state} == NH">New Hampshire</option>
            <option value="NJ" selected="@${state} == NJ">New Jersey</option>
            <option value="NM" selected="@${state} == NM">New Mexico</option>
            <option value="NY" selected="@${state} == NY">New York</option>
            <option value="NC" selected="@${state} == NC">North Carolina</option>
            <option value="ND" selected="@${state} == ND">North Dakota</option>
            <option value="OH" selected="@${state} == OH">Ohio</option>
            <option value="OK" selected="@${state} == OK">Oklahoma</option>
            <option value="OR" selected="@${state} == OR">Oregon</option>
            <option value="PA" selected="@${state} == PA">Pennsylvania</option>
            <option value="RI" selected="@${state} == RI">Rhode Island</option>
            <option value="SC" selected="@${state} == SC">South Carolina</option>
            <option value="SD" selected="@${state} == SD">South Dakota</option>
            <option value="TN" selected="@${state} == TN">Tennessee</option>
            <option value="TX" selected="@${state} == TX">Texas</option>
            <option value="UT" selected="@${state} == UT">Utah</option>
            <option value="VT" selected="@${state} == VT">Vermont</option>
            <option value="VA" selected="@${state} == VA">Virginia</option>
            <option value="WA" selected="@${state} == WA">Washington</option>
            <option value="WV" selected="@${state} == WV">West Virginia</option>
            <option value="WI" selected="@${state} == WI">Wisconsin</option>
            <option value="WY" selected="@${state} == WY">Wyoming</option>
        </select>
        <br><br>
        <label><b>Credit Card Number</b></label><br>
        <input type="tel" name="cardNum" inputmode="numeric" pattern="[0-9\s]{13,19}"
               maxlength="19" id ="editForm" placeholder="xxxx xxxx xxxx xxxx"/>
        <br><br>
        <label><b>Card Expiration Date</b></label><br>
        <select name="expMonth">
            <option value=""></option>
            <option value="01" selected="@${expMonth } == 01">01-January</option>
            <option value="02" selected="@${expMonth } == 02">02-February</option>
            <option value="03" selected="@${expMonth } == 03">03-March</option>
            <option value="04" selected="@${expMonth } == 04">04-April</option>
            <option value="05" selected="@${expMonth } == 05">05-May</option>
            <option value="06" selected="@${expMonth } == 06">06-June</option>
            <option value="07" selected="@${expMonth } == 07">07-July</option>
            <option value="08" selected="@${expMonth } == 08">08-August</option>
            <option value="09" selected="@${expMonth } == 09">09-September</option>
            <option value="10" selected="@${expMonth } == 10">10-October</option>
            <option value="11" selected="@${expMonth } == 11">11-November</option>
            <option value="12" selected="@${expMonth } == 12">12-December</option>
        </select>
        <select name="expYear">
            <option value=""></option>
            <option value="21" selected="@${expYear } == 21">2021</option>
            <option value="22" selected="@${expYear } == 22">2022</option>
            <option value="23" selected="@${expYear } == 23">2023</option>
            <option value="24" selected="@${expYear } == 24">2024</option>
            <option value="25" selected="@${expYear } == 25">2025</option>
            <option value="26" selected="@${expYear } == 26">2026</option>
            <option value="27" selected="@${expYear } == 27">2027</option>
            <option value="28" selected="@${expYear } == 28">2028</option>
            <option value="29" selected="@${expYear } == 29">2029</option>
            <option value="30" selected="@${expYear } == 30">2030</option>
        </select>
        <br><br>
        <label><b>Security Code</b></label><br>
        <input type="text" name="cvv" inputmode="numeric" pattern="[0-9\s]{3}"
               maxlength="3" placeholder="xxx"/>
        <br><br>
        <button type="submit" id="submit" onClick = "if(checkPass()) { sendEmail()} else {return false}" value="Submit">
            Submit Changes</button>
    </form>
</div>
<br><br>
</body>

<script type="text/javascript">
    function checkPass() {
        let form1 = document.getElementById('editAcct');
        if(form1.password.value !== form1.confPassword.value) {
            alert("Password must match confirmation!");
            form1.password.focus();
            return false;
        }
        return true;
    }
</script>

<script
        src="https://smtpjs.com/v3/smtp.js">
</script>

<script type="text/javascript">
    function sendEmail() {
        var form1 = document.getElementById('editAcct');
        Email.send({
            Host: "smtp.gmail.com",
            Username: "bookstore3c@gmail.com",
            Password: "strongestpassword#1",
            To: String(form1.editEmail.value),
            From: "bookstore3c@gmail.com",
            Subject: "Updated Profile",
            Body: "You have successfully updated your User Profile!",
        })
        alert("Email sent to given address! Email might take up to 5 minutes to send. If you did not recieve an email, please try again.")
    }
</script>

</body>
</html>