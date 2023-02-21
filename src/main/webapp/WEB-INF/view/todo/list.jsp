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
    <c:forEach var="dto" items="${responseDTO.dtoList}">
      <tr>
        <th scope="row">${dto.tno}</th>
        <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none">
          <c:out value="${dto.title}"/>
        </a></td>
        <td>${dto.writer}</td>
        <td>${dto.dueDate}</td>
        <td>${dto.finished}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <div class="float-end">
    <ul class="pagination flex-wrap">
      <c:if test="${responseDTO.prev}">
        <li class="page-item">
          <a class="page-link" data-num="${responseDTO.start - 1}">Previous</a>
        </li>
      </c:if>
      <c:forEach var="num" begin="${responseDTO.start}" end="${responseDTO.end}">
        <li class="page-item ${responseDTO.page == num ? "active" : ""}">
          <a class="page-link" data-num="${num}">${num}</a></li>
      </c:forEach>
      <c:if test="${responseDTO.next}">
        <li class="page-item">
          <a class="page-link" data-num="${responseDTO.end + 1}">Next</a>
        </li>
      </c:if>
    </ul>
  </div>
</div>

<script>
  document.querySelector('.pagination').addEventListener('click', function(e) {
    e.preventDefault();
    e.stopPropagation();

    const target = e.target;
    if(target.tagName !== 'A') {
      return;
    }
    const num = target.getAttribute('data-num');
    self.location = `/todo/list?page=\${num}`;  // 벡틱을 이용해서 템플릿 처리

  });
</script>

</body>
</html>
