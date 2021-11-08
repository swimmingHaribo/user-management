<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <link href="css/bootstrap.min.css" , rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background-color: #0abde3">
<div class = "top-container" style="padding-top: 180px; color: snow">

<c:if test="${not empty user.name}">
    <h1 style="text-align: center">${user.name}, welcome:)</h1>
    <h3 style="text-align: center"><a href="/findUserByPageServlet">Click to view all user information</a></h3>
</c:if>
<c:if test="${empty user.name}">
    <h1 style="padding-left: 150px">WELCOME! Please <a href="/loginServlet">Login</a></h1>
    <%--  <h5>Welcome, please <a href="/login.jsp">login!</a></h5>--%>
    <img class="Mrbean" src="https://media.giphy.com/media/ftHNle25rthTu19OAd/giphy.gif" alt="MrBean-img" style="position: absolute; width: 30%;
right: 200px;top: 100px">
</c:if>
</div>


</body>
</html>