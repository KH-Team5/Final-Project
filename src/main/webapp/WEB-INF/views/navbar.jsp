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
	<link rel="stylesheet" type="text/css" 
	 href="${pageContext.request.contextPath}/resources/css/navbar.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
 
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/"><img style="width: 60px;" src="<%=request.getContextPath()%>/resources/img/bkh.png"></a>
			<form class="search d-flex" action="<%=request.getContextPath()%>/search" method="get">
				<input class="form-control me-sm-2" type="text" placeholder="상품명" name="keyword">
				<input type="hidden" name="type" value="T">
				<button id="search_btn" class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
			</form>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/search"><b>모든 상품</b></a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="<%=request.getContextPath()%>/search?type=C&c_Code=1"
							role="button" aria-haspopup="true" aria-expanded="false">상의</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=11"><b>후드</b></a>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=12"><b>맨투맨</b></a>
							<%-- <c:forEach items="${Inner}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="<%=request.getContextPath()%>/search?type=C&c_Code=2"
							role="button" aria-haspopup="true" aria-expanded="false">하의</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=21"><b>청바지</b></a>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=22"><b>슬랙스</b></a>
							<%-- <c:forEach items="${Pants}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="<%=request.getContextPath()%>/search?type=C&c_Code=3"
							role="button" aria-haspopup="true" aria-expanded="false">아우터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=31"><b>코트</b></a>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/search?type=C&c_Code=32"><b>점퍼</b></a>
							<%-- <c:forEach items="${Outer}" var="category">
								<a class="dropdown-item" href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
							</c:forEach> --%>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/listPageSearch?num=1"><b>문의 사항</b></a></li>
				</ul>
			</div>
			
			<div class="d-flex">
				<sec:authorize access="isAnonymous()">
					<a href="<%=request.getContextPath()%>/member/login">로그인</a> |
					<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="<%=request.getContextPath()%>/cart" style="text-decoration-line: none; color: gray;"><b>장바구니</b></a> |
					<a href="<%=request.getContextPath()%>/member/orderList" style="text-decoration-line: none; color: gray;"><b>주문 목록</b></a> |
					<sec:authorize access="hasRole('USER')">
						<a href="<%=request.getContextPath()%>/member/mypage" style="text-decoration-line: none; color: gray;"><b>마이페이지</b></a> |
					</sec:authorize>
					<sec:authorize access="hasRole('ADMIN')">
						<a href="<%=request.getContextPath()%>/admin/adminMain" style="text-decoration-line: none; color: gray;"><b>관리자페이지</b></a> |
					</sec:authorize>
					<a href="<%=request.getContextPath()%>/logout" style="text-decoration-line: none; color: gray;"><b>로그아웃</b></a>
				</sec:authorize>
			</div>
		</div>
	</nav>

	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		let searchForm = $('.search');
		$("#search_btn").on("click", function(e){
			e.preventDefault();
			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를를 입력하십시오");
				return false;
			}
			searchForm.submit();
		});
	</script>
</body>

</html>