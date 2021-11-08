<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%--    <base href="<%=basePath%>"/>--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">Update the profile</h3>
    <form action="/updateUserServlet" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly"/>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <input type="radio" name="gender" value="Female" <c:if test="${user.gender eq 'Female'}">checked="checked"</c:if>/>Female
            <input type="radio" name="gender" value="Male" <c:if test="${user.gender eq 'Male'}">checked="checked"</c:if>/>Male

        </div>

        <div class="form-group">
            <label for="age">Age:</label>
            <input type="text" class="form-control" id="age" value="${user.age}" name="age" placeholder="Please enter your age"/>
        </div>

        <div class="form-group">
            <label>Province:</label>
            <select name="province" class="form-control">
                <option value="${user.province}"> ${user.province}</option>
                <option value="AB">AB</option>
                <option value="BC">BC</option>
                <option value="MB">MB</option>
                <option value="NB">NB</option>
                <option value="NL">NL</option>
                <option value="NT">NT</option>
                <option value="NS">NS</option>
                <option value="NU">NU</option>
                <option value="ON">ON</option>
                <option value="PE">PE</option>
                <option value="QC">QC</option>
                <option value="SK">SK</option>
                <option value="YT">YT</option>
            </select>
        </div>

        <div class="form-group">
            <label>Phone:</label>
            <input type="text" class="form-control" value="${user.phone}" name="phone" placeholder="Please enter the phone number"/>
        </div>

        <div class="form-group">
            <label>Email：</label>
            <input type="text" class="form-control" value="${user.email}" name="email" placeholder="Please enter the email"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="submit" onclick="history.go()"/>
            <input class="btn btn-default" type="reset" value="reset" onclick="form.reset()"/>
            <input class="btn btn-default" type="button" value="back" onclick="history.go(-1)"/>
        </div>
    </form>
</div>
</body>
</html>
