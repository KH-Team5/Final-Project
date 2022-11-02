<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다</title>
</head>
<body>
<h1>관리자 페이지 입니다</h1>
<a href="<%=request.getContextPath()%>/admin/productsManage">상품관리</a>
<a href="<%=request.getContextPath()%>/admin/productRegistration">상품등록</a>
<a href="<%=request.getContextPath()%>/admin/usersManage">회원관리</a>
</body>
</html>