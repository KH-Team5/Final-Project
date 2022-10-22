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
	<a href="<%=request.getContextPath()%>/member/memberTest">회원전용</a>
	<a href="<%=request.getContextPath()%>/logout">로그아웃</a>
</body>
</html>
