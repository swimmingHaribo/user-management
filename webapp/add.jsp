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

    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">Add user</h3>
    <form action="/addUserServlet" method="post">

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" />
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <input type="radio" name="gender" value="Female" checked="checked"/>Female
            <input type="radio" name="gender" value="Male" />Male

        </div>

        <div class="form-group">
            <label for="age">Age:</label>
            <input type="text" class="form-control" id="age"  name="age" placeholder="Please enter the age"/>
        </div>

        <div class="form-group">
            <label>Province:</label>
            <select name="province" class="form-control">
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
            <input type="text" class="form-control"  name="phone" placeholder="Please enter the phone number"/>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="text" class="form-control" name="email" placeholder="Please enter the email"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="Submit" onclick="history.go(-1)"/>
            <input class="btn btn-default" type="reset" value="Reset" onclick="form.reset()"/>
            <input class="btn btn-default" type="button" onclick="history.go(-1);" value="Back"/>
        </div>
    </form>
</div>
</body>
</html>
