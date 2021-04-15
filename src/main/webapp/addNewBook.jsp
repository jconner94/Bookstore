<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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
    <h1 class="title">AddNewBook</h1>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="Contact.html" style="text-decoration: none; color: white">Contact</a></li>
    </ul>
    <ul class="icons">
        <li><a href="login-servlet"><img src="${pageContext.request.contextPath}/resources/profile-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="register-servlet">
            <img src="${pageContext.request.contextPath}/resources/register-icon.webp" class="top-icon" id="entry" alt=""/></a></li>
        <li><a href="search.html"><img src="${pageContext.request.contextPath}/resources/search-icon.svg" alt="" class="top-icon"/></a></li>
        <li><a href="forgot-servlet" style="text-decoration: none; color: white">Forgot Password?</a></li>
    </ul>
</nav>
<main>
    <div class="newbook">
        <form action="<%= request.getContextPath() %>/add-book-servlet" id="addBook" method="post">
            <h1>New Book</h1>
            <br>
            <label><b>ISBN:</b></label>
            <input type="text" name="isbn" placeholder="Enter ISBN..." id="isbn" required maxlength="13">
            <br><br>
            <label><b>Title:</b></label>
            <input type="text" name="title" placeholder="Enter Title..." id="title" required>
            <br><br>
            <label><b>Author(s):</b></label>
            <input type="text" name="author" placeholder="Enter Author(s)..." id="author" required>
            <br><br>
            <label><b>Edition:</b></label>
            <input type="text" name="edition" placeholder="Enter Edition..." id="edition" required>
            <br><br>
            <label><b>Publisher:</b></label>
            <input type="text" name="publisher" placeholder="Enter Publisher..." id="publisher" required>
            <br><br>
            <label><b>Publication Year:</b></label>
            <input type="text" name="pubYear" placeholder="Enter Publication Year..." id="year" required>
            <br><br>
            <label><b>Quantity In Stock:</b></label>
            <input type="text" name="quantity" placeholder="Enter Quantity..." id="quantity" required>
            <br><br>
            <label><b>Minimum Threshold:</b></label>
            <input type="text" name="minThreshold" placeholder="Enter Minimum Threshold..." id="minthreshold" required>
            <br><br>
            <label><b>Buying Price:</b></label>
            <input type="text" name="buyPrice" placeholder="Enter Buying Price..." id="buyprice" required>
            <br><br>
            <label><b>Selling Price:</b></label>
            <input type="text" name="sellPrice" placeholder="Enter Selling Price..." id="sellprice" required>
            <br><br>
            <label><b>Book Cover:</b></label>
            <input type="file" name="bookCover" id="bookcover" required>
            <br><br>
            <button type="submit" id="submit">Add Book</button>
            <br><br>
        </form>
        <form action="ManageBooks.jsp">
            <button type="submit" id="cancel">Cancel</button>
        </form>
    </div>
</main>
<footer>Copyright &copy; 2021</footer>
</body>
</html>