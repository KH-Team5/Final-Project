<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<a href="<%=request.getContextPath()%>/member/login">로그인</a>
	<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
	<a href="<%=request.getContextPath()%>/member/findPage">아이디 비밀번호 찾기</a>
	<a href="<%=request.getContextPath()%>/logout">로그아웃</a>
	<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a>
	<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a>
	<a href="<%=request.getContextPath()%>/member/mypage">마이 페이지</a>
	<a href="<%=request.getContextPath()%>/main">메인 페이지</a>
	<a href="<%=request.getContextPath()%>/member/orderList">주문 목록</a>
</body>
</html>
