<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-02-21
  Time: 오전 11:47
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
  <form action="/todo/modify" method="post">

<%--  <input type="hidden" name="page" value="${pageRequestDTO.page}">--%>
<%--  <input type="hidden" name="size" value="${pageRequestDTO.size}">--%>

  <div class="input-group mb-3">
    <span class="input-group-text">TNO</span>
    <input type="text" name="tno" class="form-control" value=<c:out value="${dto.tno}"></c:out> readonly>
  </div>

  <div class="input-group mb-3">
    <span class="input-group-text">Title</span>
    <input type="text" name="title" class="form-control" value=<c:out value="${dto.title}"></c:out> >
  </div>

  <div class="input-group mb-3">
    <span class="input-group-text">DueDate</span>
    <input type="date" name="dueDate" class="form-control" value=<c:out value="${dto.dueDate}"></c:out> >
  </div>

  <div class="input-group mb-3">
    <span class="input-group-text">Writer</span>
    <input type="text" name="writer" class="form-control" value=<c:out value="${dto.writer}"></c:out> readonly>
  </div>

  <div class="form-check">
    <label class="form-check-label">
      Finished &nbsp;
    </label>
    <input class="form-check-input" type="checkbox" name="finished" ${dto.finished? "checked":""} >
  </div>

  <div class="my-4">
    <div class="float-end">
      <button type="button" class="btn btn-danger">Remove</button>
      <button type="button" class="btn btn-primary">Modify</button>
      <button type="button" class="btn btn-secondary">List</button>
    </div>
  </div>
  </form>
</div>

  <script>
    const serverValidResult = {};

    <c:forEach items="${errors}" var="error">

    serverValidResult['${error.getField()}'] = '${error.defaultMessage}';

    </c:forEach>

    console.log(serverValidResult);
  </script>

  <script>
    const frmView = document.querySelector("form");

    // 삭제 처리
    document.querySelector(".btn-danger").addEventListener("click", function (e) {
      frmView.action = `/todo/remove?${pageRequestDTO.link}`;
      frmView.method = "post";
      frmView.submit();
    });

    // 수정 처리
    document.querySelector(".btn-primary").addEventListener("click", function (e) {
      frmView.action = "/todo/modify";
      frmView.method = "post";
      frmView.submit();
    })

    // 수정 삭제 후 목록으로 이동하는 이벤트 처리
    document.querySelector(".btn-secondary").addEventListener("click", function (e) {
      self.location = `/todo/list?${pageRequestDTO.link}`;
    }, false);
  </script>

</body>
</html>
