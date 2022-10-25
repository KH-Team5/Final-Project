<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form id="joinform" name="joinform" method="post">
		아이디: <input id="M_id" name="M_id" type="text"> <br>
		<span id="idInputChk"></span>
		<span id="idChk"></span>
		
		비밀번호: <input id="M_pwd" name="M_pwd" type="password"> <br>
		<span id="pwChk"></span>
	
		이름: <input id="M_name" name="M_name" type="text"> <br>
		<span id="nameChk"></span>
		
		이메일: <input id="email" name="email" type="email"> <br>
		<span id="mailChk"></span>	
		<div>
			<input id="authNum" name="authNum" type="text" disabled="disabled">
			<input id="authNumBtn" name="authNumBtn" type="button" value="인증번호 전송"> <br>
			<span id="authNumChk"></span>
		</div>
		
		연락처: <input id="contact" name="contact" type="tel"> <br> 
		<span id="contactChk"></span>
		
		우편번호: <input id="zipcode" name="zipcode" type="number"> <br> 
		<span id="zipcodeChk"></span>
		
		주소: <input id="address" name="address" type="text"> <br> 
		<span id="addressChk"></span>
		
		상세주소: <input id="detail_address" name="detail_address" type="text"> <br> 
		<span id="detailaddressChk"></span>
		
		<input type="button" id="joinbutton" value="회원가입">
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		var idChk = false;
		var idOverlapChk = false;
		var pwChk = false;
		var nameChk = false;
		var mailChk = false;
		var mailAuthChk = false;
		var contactChk = false;
		var zipcodeChk = false;
		var addressChk = false;
		var detailaddressChk = false;
		var code = "";
		$(function() {
			$("#joinbutton").click(function() {
				var id = $('#M_id').val();
		        var pw = $('#M_pwd').val();
		        var name = $('#M_name').val();
		        var mail = $('#email').val();
		        var contact = $('#contact').val();
		        var zipcode = $('#zipcode').val();
		        var address = $('#address').val();
		        var detailaddress = $('#detail_address').val();
		        if(id == "") {
		            $('#idChk').html("필수 항목입니다." + "<br>");
		            idChk = false;
		        } else {
		            $('#idChk').html("");
		            idChk = true;
		        }
		        if(pw == "") {
		            $('#pwChk').html("필수 항목입니다." + "<br>");
		            pwChk = false;
		        } else {
		            $('#pwChk').html("");
		            pwChk = true;
		        }
		        if(name == "") {
		            $('#nameChk').html("필수 항목입니다." + "<br>");
		            nameChk = false;
		        } else {
		            $('#nameChk').html("");
		            nameChk = true;
		        }
		        if(mail == "") {
		            $('#mailChk').html("필수 항목입니다." + "<br>");
		            mailChk = false;
		        } else {
		            $('#mailChk').html("");
		            mailChk = true;
		        }
		        if(contact == "") {
		            $('#contactChk').html("필수 항목입니다." + "<br>");
		            contactChk = false;
		        } else {
		            $('#contactChk').html("");
		            contactChk = true;
		        }
		        if(zipcode == "") {
		            $('#zipcodeChk').html("필수 항목입니다." + "<br>");
		            zipcodeChk = false;
		        } else {
		            $('#zipcodeChk').html("");
		            zipcodeChk = true;
		        }
		        if(address == "") {
		            $('#addressChk').html("필수 항목입니다." + "<br>");
		            addressChk = false;
		        } else {
		            $('#addressChk').html("");
		            addressChk = true;
		        }
		        if(detailaddress == "") {
		            $('#detailaddressChk').html("필수 항목입니다." + "<br>");
		            detailaddressChk = false;
		        } else {
		            $('#detailaddressChk').html("");
		            detailaddressChk = true;
		        }
		        if(idChk && idOverlapChk && pwChk && nameChk && mailChk && contactChk && zipcodeChk && addressChk && detailaddressChk && mailAuthChk) {
		        	$("#joinform").attr("action", "<%= request.getContextPath()%>/member/join");
					$("#joinform").submit();
		        }
			});
			
			$('#M_id').on("propertychange change keyup paste input", function() {
				console.log("keyup test");	
				var M_id = $('#M_id').val();
				var data = {M_id : M_id};
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/idChk",
					data: data,
					success: function(result) {
						if(result == 'success') {
							$('#idInputChk').html("사용 가능 " + "<br>");
							idOverlapChk = true;
						} else {
							$('#idInputChk').html("중복" + "<br>");
							idOverlapChk = false;
						} 
						if (M_id == "") {
							idOverlapChk = false;
							$('#idInputChk').html("");
						}
					}
				});
			});					
		});	
		
		$("#authNumBtn").click(function(){
			var email = $("#email").val();
			var authNum = $("#authNum");  
			$.ajax({
		        type: "GET",
		        url: "<%=request.getContextPath()%>/member/mailChk?email=" + email,
		        success:function(data){
		        	authNum.attr("disabled",false);
		        	code = data;
		        }
		    });
		});
		
		$("#authNum").blur(function(){
			var inputCode = $("#authNum").val();
		    var checkResult = $("#authNumChk");
		    if(inputCode == code) {
		        checkResult.html("인증 성공");
		        mailAuthChk = true;
		    } else {
		        checkResult.html("인증 실패");
		        mailAuthChk = false;
			}
		});
	</script>
</body>
</html>