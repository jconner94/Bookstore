<%--
  Created by IntelliJ IDEA.
  User: kdog6
  Date: 4/12/2021
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        h1 {
            text-align: center;
        }

        .newbook {
            margin:auto;
            top:25%;
            left:25%;
            width: 50%;
            border: 3px solid #080808;
            padding: 50px;
        }

        #isbn {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #title {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #author {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #edition {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #publisher {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #year {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #quantity {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #minthreshold {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #buyprice {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #sellprice {
            width: 100%;
            padding: 1px 2px;
            margin: 10px;
            box-sizing: border-box;
        }

        #submit {
            background-color: #2c209e;
            color: white;
            border: blue;
            padding: 10px 15px;
            width: 30%;
            border-radius: 20px;
        }

        #cancel {
            background-color: #03311e;
            color: white;
            border: blue;
            padding: 10px 15px;
            width: 30%;
            border-radius: 20px;
        }

    </style>

</head>


<body>
<nav>
    <h1 class="title">EditPromotion</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="Contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><img src="resources/search-icon.svg" alt="" class="top-icon"></li>
        <li><a href="login.jsp"><img src="resources/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="Shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div class="editLogin" id="addPromo">
        <script> window.onload = sendPromo </script>
        <label><b>Promotion Sent!</b></label>
        <form action="AdminMain.jsp">
            <button type="submit" id="cancel">Return</button>
        </form>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>

<script type="text/javascript">
    function sendPromo() {
        console.log("sendPromo")
        //var title = ${title};
        //var percentage = ${percentage};
        //var description = ${description};

        Email.send({
            Host: "smtp.gmail.com",
            Username: "bookstore3c@gmail.com",
            Password: "strongestpassword#1",
            To: "jamesrcon94@gmail.com",
            From: "bookstore3c@gmail.com",
            Subject: "New Promotion!",
            Body: "HI",
        })
        Email.send({
            Host: "smtp.gmail.com",
            Username: "bookstore3c@gmail.com",
            Password: "strongestpassword#1",
            To: "zillertrevor@gmail.com",
            From: "bookstore3c@gmail.com",
            Subject: "New Promotion!",
            Body: "HI",
        })
        alert("Form added!. Email has been sent out to customers!")
    }
</script>
</html>