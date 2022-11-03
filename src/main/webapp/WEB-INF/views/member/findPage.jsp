<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
</head>
<body>
	<h4>아이디 찾기</h4>
	<form id="findIdform" name="findIdform">
		이메일: <input id="email" name="email" type="email"> <br>	
		<input type="button" id="findIdBtn" value="아이디찾기"> <br>
		<span id="resultId"></span>
	</form>
	
	<h4>비밀번호 재설정</h4>
	<form id="reSetPwdform" name="reSetPwdform">
		아이디: <input id="m_Id" name="m_Id" type="text"> <br>
		이메일: <input id="email2" name="email2" type="email"> <br>	
		<input type="button" id="reSetPwdBtn" value="비밀번호 재설정"> <br>
		<span id="resultPwd"></span>
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	
	<script>
		$("#findIdBtn").click(function(){
			var email = $("#email").val();
			$.ajax({
		        type: "post",
		        url: "<%=request.getContextPath()%>/member/findPage/findid?email=" + email,
		        success: function(result){
		        	if (result == '') 
		        		$("#resultId").html("가입되지 않는 이메일 입니다.");
		        	else
		        		$("#resultId").html("가입된 아이디: " + result);
		        }
		    });
		});
		
		$("#reSetPwdBtn").click(function(){
			var data = {
				email: $("#email2").val(),
				id: $("#m_Id").val()
				};
			$.ajax({
				url: "<%=request.getContextPath()%>/member/findPage/pwdReset",
		        type: "post",
		        data: data,
		        success: function(result){
		        	if (result == 'success')
		        		$("#resultPwd").html("임시 비밀번호가 발송되었습니다.");
		        	else
		        		$("#resultPwd").html("가입되지 않은 이메일이나 아이디 입니다.");
		        }
		    });
		});
	</script>
</body>
</html>