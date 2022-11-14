<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		
		<a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a> <br>
		
		우편번호: <input id="zipcode" name="zipcode" type="text"> <br> 
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
				var M_id = $('#M_id').val();
				var data = {M_id : M_id};
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/join/idChk",
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
			
			$("#email").on("propertychange change keyup paste input", function() {
				var email = $("#email").val();
				var data = {email : email};
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/join/emailOverlapChk",
					data: data,
					success: function(result) {
						if(result == 'success') {
							$("#authNumChk").html("사용 가능 " + "<br>");
							$("#authNumBtn").attr("disabled",false);
						} else {
							$("#authNumChk").html("중복" + "<br>");
							$("#authNumBtn").attr("disabled",true);
						}
						if (M_id == "") {
							$("#authNumBtn").attr("disabled",false);
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
		        url: "<%=request.getContextPath()%>/member/join/mailChk?email=" + email,
		        success:function(data){
		        	$("#authNum").attr("disabled",false);
		        	$("#authNumBtn").attr("disabled",true);
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
		
		function execution_daum_address(){
			new daum.Postcode({
				oncomplete: function(data) {
	                var addr = '';
	                var extraAddr = '';
	                if (data.userSelectedType === 'R')
	                    addr = data.roadAddress;
	                else
	                    addr = data.jibunAddress;
	                
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
	                        extraAddr += data.bname;
	                    if(data.buildingName !== '' && data.apartment === 'Y')
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    if(extraAddr !== '')
	                        extraAddr = ' (' + extraAddr + ')';
						addr += extraAddr;
	                } else 
						addr += ' ';
	                $("#zipcode").val(data.zonecode);
	                $("#address").val(addr);				
	                $("#detail_address").attr("readonly", false);
	                $("#detail_address").focus();	 
		        }
		    }).open();  	
		}
	</script>
</body>
</html>