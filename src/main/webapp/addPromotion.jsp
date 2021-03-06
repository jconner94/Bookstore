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
        <li><a href="search-servlet"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="logout-servlet"><img src="resources/logout-icon.png" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <h2 class="welcome-message" id="demo">Welcome ${firstName}!</h2>
    <div class="editLogin" id="addPromo">
        <form method="post" action="<%= request.getContextPath() %>/add-promotion-servlet" id="promoForm"> <!-- Might need to change? -->
            <h1>New Promotion</h1>
            <br>
            <label><b>ID:</b></label>
            <input type="text" name="promoID" placeholder="Enter ID..." id="editForm" required>
            <br><br>
            <label><b>Title:</b></label>
            <input type="text" name="title" placeholder="Enter Title..." id="editForm" required>
            <br><br>
            <label><b>Discount %:</b></label>
            <input type="text" name="percentage" placeholder="Enter % Discount..." id="editForm" required>
            <br><br>
            <label><b>Start Date</b></label><br>

            <select name="startDay">
                <option value=""></option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
            </select><br>

            <select name="startMonth">
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
            </select><br>
            <select name="startYear">
                <option value=""></option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
                <option value="2028">2028</option>
                <option value="2029">2029</option>
                <option value="2030">2030</option>
            </select><br>
            <br><br>
            <label><b>End Date</b></label><br>

            <select name="endDay">
                <option value=""></option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
            </select><br>
            <select name="endMonth">
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
            </select><br>
            <select name="endYear">
                <option value=""></option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
                <option value="2028">2028</option>
                <option value="2029">2029</option>
                <option value="2030">2030</option>
            </select><br>
            <br><br>
            <label><b>Description:</b></label>
            <input type="text" name = "description" placeholder="Enter description..." id="editForm" required>
            <br><br>
            <button type="submit" id="submit" onClick = "return checkDates()">Add Promotion</button>
            <br><br>
        </form>
        <form action="AdminMain.jsp">
            <button type="submit" id="cancel">Cancel</button>
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

<script type="text/javascript">
    function checkDates() {
        var form1 = document.getElementById('promoForm');

        var startYear = parseInt(form1.startYear.value);
        var endYear = parseInt(form1.endYear.value);
        var startMonth = parseInt(form1.startMonth.value);
        var endMonth = parseInt(form1.endMonth.value);
        var startDay = parseInt(form1.startDay.value);
        var endDay = parseInt(form1.endDay.value);

        if(startYear > endYear) { // if start year is after end year
            alert("End date must be after start date.");
            return false;
        } else if(startYear == endYear) { // if start year == end year
            if(startMonth > endMonth) { // if start month is after end month
                alert("End date must be after start date.");
                return false;
            } else if(startMonth == endMonth) {
                if(startDay > endDay) {
                    alert("End date must be after start date.");
                    return false;
                }
            }
        }

        return true;

    }
</script>

</html>