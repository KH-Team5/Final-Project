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
	<a href="<%=request.getContextPath()%>/member/memberTest">회원 전용</a>
	<a href="<%=request.getContextPath()%>/member/auth">회원 정보</a>
	<a href="<%=request.getContextPath()%>/admin/adminTest">관리자 전용</a>
	<a href="<%=request.getContextPath()%>/logout">로그아웃</a>
	<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a>
	<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a>
</body>
</html>
