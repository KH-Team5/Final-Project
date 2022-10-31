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
	<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>