<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<button id='search_btn'>검색</button>                				
			</div>
		</form>
	</div>
	<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>