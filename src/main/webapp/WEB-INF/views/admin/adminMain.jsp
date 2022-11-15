<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
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
<h1>관리자 페이지 입니다</h1>
<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a>
<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a>
<c:forEach begin="1" end="${pageNum}" var="num">
      </c:forEach> 
<a href="<%=request.getContextPath()%>/admin/usersManage?num=${num}">회원관리</a> <br>
	<a href="<%=request.getContextPath()%>/">홈</a>


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