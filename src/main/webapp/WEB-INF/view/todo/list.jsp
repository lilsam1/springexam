<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-02-17
  Time: 오후 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <title>Title</title>
</head>
<body>

<div class="card-body">
  <h5 class="card-title">Special title treatment</h5>
  <table class="table">
    <thead>
    <tr>
      <th scope="col">Tno</th>
      <th scope="col">Title</th>
      <th scope="col">Writer</th>
      <th scope="col">DueDate</th>
      <th scope="col">Finished</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${dtoList}">
      <tr>
        <th scope="row">${dto.tno}</th>
        <td>${dto.title}</td>
        <td>${dto.writer}</td>
        <td>${dto.dueDate}</td>
        <td>${dto.finished}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
