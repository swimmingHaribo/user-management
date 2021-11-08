<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management System</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
      td. th {
        text-align: center;
      }
      /*#container{*/
      /*  width: 90%;*/
      /*}*/
    </style>

    <script>
      function deleteUser(id){
          if (confirm("Are you sure to delete it?")){
            location.href = "/deleteUserServlet?id=" + id;
          }
      }
      window.onload = function (){
        document.getElementById("delSelected").onclick = function (){
          let flag = false;
          if (confirm("Are you sure to delete? ")){
            var guids =  document.getElementsByName("uid");

            console.log(guids)
            //
            for (var i = 0; i < guids.length; i++) {
              console.log(guids[i].checked)
                if (guids[i].checked){
                    flag = true;
                    break;
                }
            }

            if (flag){
                document.getElementById("form").submit();
            }
          }
        }
        
        <%--            TODO--%>
        document.getElementById("firstCb").onclick = function (){
          var guids =  document.getElementsByName("uid");
          for (var i = 0; i < guids.length; i++) {
            guids[i].checked = this.checked;
          }
        }

        //delete selected problem
        // document.getElementById("firstCb").onclick = function (check){
        //   var guids = document.getElementsByName("uid");
        //   if (check.checked){
        //     for (var i = 0; i < guids.length; i++) {
        //       guids[i].checked = "checked";
        //     }
        //   }
        //   else{
        //     for (var i = 0; i < guids.length ; i++) {
        //       guids[i].checked = "";
        //     }
        //   }
        // }
        ////


        }

    </script>

</head>
<body>


<div id="container" style="padding-left: 40px; padding-top: 30px; width:97%">
  <h3 style="text-align: center; margin-bottom: 31px; margin-top: 13px"><a href="/findUserByPageServlet">User List</a></h3>
  <div style="float: left;">

    <form class="form-inline" style="padding-bottom: 10px;" action="/findUserByPageServlet" method="post">
      <div class="form-group">
        <label for="exampleInputName2">Name</label>
        <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2">
      </div>
      <div class="form-group">
        <label for="exampleInputName3">Province</label>
        <input type="text" name="province" value="" class="form-control" id="exampleInputName3">
      </div>

      <div class="form-group">
        <label for="exampleInputEmail2">Email</label>
        <input type="text" name="email" value="" class="form-control" id="exampleInputEmail2">
      </div>
      <button type="submit" class="btn btn-default">Search</button>
    </form>

  </div>

  <div style="float: right;margin: 0px;">

    <a class="btn btn-primary" href="/addUserServlet">Add user</a>

    <%--            TODO--%>
    <a class="btn btn-primary" href=" " id="delSelected">Delete selected</a>

  </div>
  <form id="form" action="/deleteSelectedServlet" method="post">
    <table border="1" class="table table-bordered">
      <tr class="success">
        <th><input type="checkbox" id="firstCb"></th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Province</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Action</th>
      </tr>
      <c:forEach items="${pb.list}" var="user" varStatus="s">
        <tr>
          <td><input type="checkbox" id="uid" value="${user.id}"></td>
          <td>${s.count}</td>
          <td> ${user.name}</td>
          <td> ${user.gender}</td>
          <td> ${user.age}</td>
          <td> ${user.province}</td>
          <td> ${user.phone}</td>
          <td> ${user.email}</td>
          <td><a class="btn btn-default btn-sm" href="/findUserServlet?id=${user.id}">Update</a>
            <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">Delete</a></td>
        </tr>

      </c:forEach>

    </table>
  </form>
  <div>
    <nav aria-label="Page navigation">
      <ul class="pagination">

  <c:if test="${pb.currentPage == 1}">
    <li class="disabled"></li>
  </c:if>
  <c:if test="${pb.currentPage != 1}">
    <li><a  aria-label="Previous" href="/findUserByPageServlet?currentPage=${pb.currentPage-1}&rows=5"><span aria-hidden="true">Back</span></a></li>
  </c:if>

      <c:forEach begin="1" end="${pb.totalPage}" var="i">

        <c:if test="${pb.currentPage == i}">
          <li class="active"><a href="/findUserByPageServlet?currentPage=${i}&rows=5">${i}</a></li>
        </c:if>

        <c:if test="${pb.currentPage != i}">
          <li><a href="/findUserByPageServlet?currentPage=${i}&rows=5">${i}</a></li>
        </c:if>
      </c:forEach>

          
  <c:if test="${pb.currentPage == pb.totalPage}">
    <li class="disabled"></li>
  </c:if>
  <c:if test="${pb.currentPage != pb.totalPage}">
    <li><a aria-label="Next" href="/findUserByPageServlet?currentPage=${pb.currentPage+1}&rows=5"><span aria-hidden="true">  Forward </span></a></li>
  </c:if>
  <br>
  <br>
  <br>
    <span style="font-size: 14px;">
      ${pb.totalCount} record, ${pb.totalPage} page
    </span>

      </ul>
    </nav>

  </div>

</div>

</body>

</html>
