<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.id_input_chk1{
		display : none;
	}
	.id_input_chk2{
		display : none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form id="joinform" name="joinform" method="post">
		아이디: <input id="M_id" name="M_id" type="text"> <br>
		<span class="id_input_chk1">사용가능</span>
		<span class="id_input_chk2">중복</span> <br>
		비밀번호: <input id="M_pwd" name="M_pwd" type="password"> <br>
		이름: <input id="M_name" name="M_name" type="text"> <br> 
		이메일: <input id="email" name="email" type="email"> <br> 
		연락처: <input id="contact" name="contact" type="tel"> <br> 
		우편번호: <input id="zipcode" name="zipcode" type="number"> <br> 
		주소: <input id="address" name="address" type="text"> <br> 
		상세주소: <input id="detail_address" name="detail_address" type="text"> <br> 
		<input type="button" id="joinbutton" value="회원가입">
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		$(function() {
			$("#joinbutton").click(function() {
				$("#joinform").attr("action", "<%= request.getContextPath()%>/member/join");
				$("#joinform").submit();
			});
			$('#M_id').on("propertychange change keyup paste input", function(){
				console.log("keyup test");	
				var M_id = $('#M_id').val();
				var data = {M_id : M_id};
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/idChk",
					data: data,
					success: function(result){
						console.log(result);
						if(result == 'success'){
							$('.id_input_chk1').css("display", "inline-block");
							$('.id_input_chk2').css("display", "none");				
						} else {
							$('.id_input_chk2').css("display", "inline-block");
							$('.id_input_chk1').css("display", "none");				
						} if (M_id == "") {
							$('.id_input_chk1').css("display", "none");	
							$('.id_input_chk2').css("display", "none");
						}
					}
				});
			});
		});
	</script>
</body>
</html>