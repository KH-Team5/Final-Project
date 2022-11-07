<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
</head>
<body>
	<h1>메인 페이지</h1>
	<div id="search">
		<form id="searchForm" action="<%=request.getContextPath()%>/search" method="get">
			<div class="search_input">
				<input type="text" name="keyword">
				<input type="hidden" name="type" value="T">
				<button id='search_btn'>검색</button>                				
			</div>
		</form>
	</div>
	<jsp:include page="category.jsp" flush="true"/>
	<c:if test = "${member == null}">
		<a href="<%=request.getContextPath()%>/member/login">로그인</a>
		<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
		<a href="<%=request.getContextPath()%>/member/findPage">아이디 비밀번호 찾기</a>
	</c:if>
	<c:if test = "${member != null}">
		<a href="<%=request.getContextPath()%>/member/orderList">주문 목록</a>
		<a href="<%=request.getContextPath()%>/logout">로그아웃</a>
	</c:if>
	<c:if test = "${member.role == 'ROLE_USER'}">
		<a href="<%=request.getContextPath()%>/member/mypage">마이 페이지</a>
	</c:if>
	<c:if test = "${member.role == 'ROLE_ADMIN'}">
		<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a>
		<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a>
	</c:if>
</body>
</html>