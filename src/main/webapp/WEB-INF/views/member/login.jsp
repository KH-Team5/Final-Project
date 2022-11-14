<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="<%= request.getContextPath()%>/login-process" id="loginform" name="loginform" method="post" >
		<input id="userid" name="userid" type="text" value=""> <br>
		<input id="password" name="password" type="password" value=""> <br>
		<input type="submit" value="로그인"> <br>
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>