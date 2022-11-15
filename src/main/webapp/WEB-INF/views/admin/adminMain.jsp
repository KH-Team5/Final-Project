<!doctype html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
<meta charset="UTF-8">
<style>
.button_a { 
position: relative;
top: 20px;
left:2%;
width:100px;
height:60px;
}
#two{
position: relative;
top:11px;
left:2%;
}
#three{
position: relative;
top:1px;
left:2%;
}

ul{
position:relative;
left: 40%;
}
nav{
height:100px;
}
.navbar-brand{
font-size: xx-large;
}
</style>
<title>관리자 페이지 입니다</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><b>관리자 페이지</a></b>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/" style="color: white">홈페이지 로고
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
      </ul>
     
  </div>
</nav>
  	<div class = "button_a" id="one">
<button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/productsManage'">상품관리</a></button>
</div>
  	<div class = "button_a" id="two">
<button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/productRegistration'">상품등록</a></button>
</div>
<c:forEach begin="1" end="${pageNum}" var="num">
      </c:forEach>
     <div class = "button_a" id="three"> 
<button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/usersManage?num=${num}'">회원관리</a></button> <br>
</body>
</html>

