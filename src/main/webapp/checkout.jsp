<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.project.Bookstore.BookDao" %>
<%@ page import="com.project.Bookstore.CartDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop | Home</title>

    <link rel="stylesheet" href="index.css">

    <style>
        main {
            padding: 2rem 10rem;
        }
    </style>

</head>

<body>
<nav>
    <a href="index.php" style="text-decoration: none; color: white"><h1 class="title">Bookstore</h1></a>
    <ul class="links">
        <li><a href="index.jsp" style="text-decoration: none; color: white">Home</a></li>
        <li><a href="contact.jsp" style="text-decoration: none; color: white">Contact</a></li>
        <li><a href="history.html" style="text-decoration: none; color: white">History</a></li>
    </ul>
    <ul class="icons">
        <li><a href="search-servlet"><img src="resources/search-icon.svg" alt="" class="top-icon"></a></li>
        <li><a href="edit-servlet"><img src="resources/profile-icon.svg" alt="" class="top-icon" id="entry"></a></li>
        <li><a href="shop.html"><img src="resources/cart-icon.svg" alt="" class="top-icon"></a></li>
    </ul>
</nav>
<main>
    <div style="text-align: center;"><h1>Checkout</h1></div>
    <div class="login">
        <form action="loggedInIndex.jsp">
            <h1>Address</h1>
            <br>
            <label><b>Street Address:</b></label><br>
            <input type="text" placeholder="Enter Street Address..." id="username" required>
            <br><br>
            <label><b>City:</b></label><br>
            <input type="text" placeholder="Enter city..." id="password" required>
            <br><br>
            <label><b>State:</b></label><br>
            <input type="text" placeholder="Enter state..." id="password" required>
            <br><br>
            <h1>Card Info</h1>
            <label><b>Card Number:</b></label>
            <input type="tel" name="cardNum" inputmode="numeric" pattern="[0-9\s]{13,19}"
                   autocomplete="Card Number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx" id="username"/>
            <br><br>
            <label><b>Expiration Date:</b></label>
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
            </select>
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
            </select>
            <label><b>Security Code:</b></label>
            <input type="text" name="cvv" inputmode="numeric" pattern="[0-9\s]{3}"
                   autocomplete="CVV" maxlength="3" placeholder="xxx" id="username"/>
            <br><br>
            <button type="submit" id="checkoutButton" value="Submit">Checkout!</button>
            <br><br>
        </form>
    </div>
    <aside class="checkoutColumn">
        <h1>Books in Cart:</h1>
        <% int uid = Integer.parseInt(session.getAttribute("uid").toString()); %>
        <% double totalPrice = 0;%>
        <% double shippingPrice = 10.00;
        double tax; %>
        <% try { session.setAttribute("Books", new CartDao().getCurrentCart(uid)); }
        catch(ClassNotFoundException e) { e.printStackTrace(); }%>
        <table class="table-cart">
            <tbody>
                <tr>
                    <th style="text-align: left"></th>
                    <th style="text-align: left">Name</th>
                    <th style="text-align: left">ISBN</th>
                    <th style="text-align: right">Quantity</th>
                    <th style="text-align: right">Price</th>
                </tr>
            <c:forEach var="book" items="${Books}">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/resources/${book.coverPic}" class="images" height="100" width="60" alt=""></td>
                    <td>${book.title}</td>
                    <td>${book.isbn}</td>
                    <td>${book.currentStock}</td>
                    <td>$${book.sellPrice}</td>
                    <% try {totalPrice = new CartDao().totalSellPrice(uid); }
                    catch(ClassNotFoundException e) {e.printStackTrace(); }%>

                </tr>
            </c:forEach>
            </tbody>
        </table>
            <br><br>
            <p class="money">Sub-total: <%=totalPrice%></p>
            <p class="money">Shipping: <%=shippingPrice%></p>
            <% tax = Math.floor(100 * (shippingPrice + totalPrice) * 0.07) / 100;%>
            <p class="money">Tax: <%=tax%></p>
            <p class="money">Total: <%=totalPrice + shippingPrice + tax%></p>
    </aside>
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