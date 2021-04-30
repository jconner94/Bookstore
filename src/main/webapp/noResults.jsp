<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>"
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.Bookstore.Book"%>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/search-servlet" id="addBook" method="get">
    <h1>No Results</h1>
    <h2>Sorry, your search returned zero results.</h2>
    <button type="submit" id="submit">Return to Search</button>
    <br><br>
</form>
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