<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form id="updateform" name="updateform" method="post">
		아이디: ${key1.m_id}<br>
		
		새로운 비밀번호: <input id="M_pwd" name="M_pwd" type="password"> <br>
		<span id="pwChk"></span>
		
		가입된 이름: ${key1.m_name}<br>
		
		기존 이메일: ${key1.email}<br>
		
		기존 연락처: ${key1.contact}<br>
		새로운 연락처: <input id="contact" name="contact" type="tel"> <br> 
		<span id="contactChk"></span>
		
		기존 우편번호: ${key1.zipcode}<br>
		우편번호: <input id="zipcode" name="zipcode" type="number"> <br> 
		<span id="zipcodeChk"></span>
		
		기존 주소: ${key1.address}<br>
		주소: <input id="address" name="address" type="text"> <br> 
		<span id="addressChk"></span>
		
		기존 상세주소: ${key1.detail_address}<br>
		상세주소: <input id="detail_address" name="detail_address" type="text"> <br> 
		<span id="detailaddressChk"></span>
		
		<input type="submit" id="updatebutton" value="정보 수정">
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		 $("#updateform").submit();
		    
		
	</script>
</body>
</html>