
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="css/bootstrap.css", rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  <script type="text/javascript">
    function refreshCode() {
      var vcode =   document.getElementById("vcode")
      vcode.src = "/checkCodeServlet?time="+new Date().getTime();
    }



  </script>
</head>
<body style="background-color: #0abde3">
<div class="container" style="width: 520px; color: snow;">
  <h3 style="text-align: center; margin-top: 65px;">ADMINISTRATOR LOGIN</h3>
  <form action="/loginServlet" method="post" style="font-size: 1.6rem;">
    <div class="form-group" style="padding-top: 52px">
      <label for="user">USERNAME: </label>
      <input type="text" name="username" class="form-control" id="user" placeholder="Please enter your username"/>
    </div>

    <div class="form-group" style="padding-top: 10px; padding-bottom: 25px">
      <label for="password">PASSWORD: </label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Please enter your password"/>
    </div>

    <div class="form-inline">
      <label for="vcode">VERIFICATION:</label>
      <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="Please enter the check code" style="width: 245px;" />
      <a href="javascript:refreshCode()">
        <img src="/checkCodeServlet" title="Click to refresh" id="vcode" style="padding-left: 2px"/></a>
    </div>
    <hr/>
    <div class="form-group" style="text-align: center;">
      <input class="btn btn btn-primary" type="submit" value="Login" style="font-size: 1.8rem">
    </div>
  </form>

  <div class="alert-success" role="alert">
<%--  <div class="alert alert-success alert-dismissible" role="alert">--%>
<%--    <button type="button" class="close" data-dismiss="alert" >--%>
<%--      <span>&times;</span></button>--%>
  <strong>${login_msg}</strong>
  </div>

</div>
</body>
</html>
