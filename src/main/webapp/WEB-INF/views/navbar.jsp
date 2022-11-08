<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/navbar.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/">쇼핑몰</a>
			<form class="d-flex" action="<%=request.getContextPath()%>/search" method="get">
				<input class="form-control me-sm-2" type="text" placeholder="상품명" name="keyword">
				<input type="hidden" name="type" value="T">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
			</form>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="search?type=C&c_Code=1"
							role="button" aria-haspopup="true" aria-expanded="false">상의</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="search?type=C&c_Code=11">후드</a>
							<a class="dropdown-item" href="search?type=C&c_Code=12">맨두맨</a>
							<%-- <c:forEach items="${Inner}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="search?type=C&c_Code=2"
							role="button" aria-haspopup="true" aria-expanded="false">하의</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="search?type=C&c_Code=21">청바지</a>
							<a class="dropdown-item" href="search?type=C&c_Code=22">슬랙스</a>
							<%-- <c:forEach items="${Pants}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="search?type=C&c_Code=3"
							role="button" aria-haspopup="true" aria-expanded="false">아우터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="search?type=C&c_Code=31">코트</a>
							<a class="dropdown-item" href="search?type=C&c_Code=32">점퍼</a>
							<%-- <c:forEach items="${Outer}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
				</ul>
			</div>
			<div class="d-flex">
				<sec:authorize access="isAnonymous()">
					<a href="<%=request.getContextPath()%>/member/login">로그인</a> |
					<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="<%=request.getContextPath()%>/cart">장바구니</a> |
					<a href="<%=request.getContextPath()%>/member/orderList">주문 목록</a> |
					<sec:authorize access="hasRole('ADMIN')">
						<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a> |
						<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a> |
					</sec:authorize>
					<a href="<%=request.getContextPath()%>/logout">로그아웃</a>
				</sec:authorize>
			</div>
		</div>
	</nav>

	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>

</html>