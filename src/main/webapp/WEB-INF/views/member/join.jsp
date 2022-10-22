<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form action="<%= request.getContextPath()%>/member/join" id="joinform" name="joinform" method="post" >
		아이디: <input id="M_id" name="M_id" type="text" value=""> <br>
		비밀번호: <input id="M_pwd" name="M_pwd" type="password" value=""> <br>
		이름: <input id="M_name" name="M_name" type="text" value=""> <br>
		이메일: <input id="email" name="email" type="email" value=""> <br>
		연락처: <input id="contact" name="contact" type="tel" value=""> <br>
		우편번호: <input id="zipcode" name="zipcode" type="number" value=""> <br>
		주소: <input id="address" name="address" type="text" value=""> <br>
		상세주소: <input id="detail_address" name="detail_address" type="text" value=""> <br>
		<input type="submit" value="회원가입">
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>