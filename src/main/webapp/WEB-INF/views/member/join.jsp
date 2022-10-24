<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#id_input_chk1{
		display: none;
	}
	#id_input_chk2{
		display: none;
	}
	#idCheck{
		display: none;
	}
	#pwCheck{
		display: none;
	}
	#nameCheck{
		display: none;
	}
	#mailCheck{
		display: none;
	}
	#contactCheck{
		display: none;
	}
	#zipcodeCheck{
		display: none;
	}
	#addressCheck{
		display: none;
	}
	#detailaddressCheck{
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form id="joinform" name="joinform" method="post">
		아이디: <input id="M_id" name="M_id" type="text"> <br>
		<span id="id_input_chk1">사용가능</span>
		<span id="id_input_chk2">중복</span> <br>
		<span id="idCheck">아이디를 입력해주세요.</span> <br>
		비밀번호: <input id="M_pwd" name="M_pwd" type="password"> <br>
		<span id="pwCheck">비밀번호를 입력해주세요.</span> <br>
	
		이름: <input id="M_name" name="M_name" type="text"> <br>
		<span id="nameCheck">이름을 입력해주세요.</span> <br>
		
		이메일: <input id="email" name="email" type="email"> <br>
		<span id="mailCheck">이메일을 입력해주세요.</span> <br>
		
		연락처: <input id="contact" name="contact" type="tel"> <br> 
		<span id="contactCheck">연락처를 입력해주세요.</span> <br>
		
		우편번호: <input id="zipcode" name="zipcode" type="number"> <br> 
		<span id="zipcodeCheck">우편번호를 입력해주세요.</span> <br>
		
		주소: <input id="address" name="address" type="text"> <br> 
		<span id="addressCheck">주소를 입력해주세요.</span> <br>
		
		상세주소: <input id="detail_address" name="detail_address" type="text"> <br> 
		<span id="detailaddressCheck">상세주소를 입력해주세요.</span> <br>
		
		<input type="button" id="joinbutton" value="회원가입">
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		var idCheck = false;
		var idOverlapCheck = false;
		var pwCheck = false;
		var nameCheck = false;
		var mailCheck = false;
		var contactCheck = false;
		var zipcodeCheck = false;
		var addressCheck = false
		var detailaddressCheck = false
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
		            $('#idCheck').css('display','inline-block');
		            idCheck = false;
		        } else {
		            $('#idCheck').css('display', 'none');
		            idCheck = true;
		        }
		        if(pw == "") {
		            $('#pwCheck').css('display','inline-block');
		            pwCheck = false;
		        } else {
		            $('#pwCheck').css('display', 'none');
		            pwCheck = true;
		        }
		        if(name == "") {
		            $('#nameCheck').css('display','inline-block');
		            nameCheck = false;
		        } else {
		            $('#nameCheck').css('display', 'none');
		            nameCheck = true;
		        }
		        if(mail == "") {
		            $('#mailCheck').css('display','inline-block');
		            mailCheck = false;
		        } else {
		            $('#mailCheck').css('display', 'none');
		            mailCheck = true;
		        }
		        if(contact == "") {
		            $('#contactCheck').css('display','inline-block');
		            contactCheck = false;
		        } else {
		            $('#contactCheck').css('display', 'none');
		            contactCheck = true;
		        }
		        if(zipcode == "") {
		            $('#zipcodeCheck').css('display','inline-block');
		            zipcodeCheck = false;
		        } else {
		            $('#zipcodeCheck').css('display', 'none');
		            zipcodeCheck = true;
		        }
		        if(address == "") {
		            $('#addressCheck').css('display','inline-block');
		            addressCheck = false;
		        } else {
		            $('#addressCheck').css('display', 'none');
		            addressCheck = true;
		        }
		        if(detailaddress == "") {
		            $('#detailaddressCheck').css('display','inline-block');
		            detailaddressCheck = false;
		        } else {
		            $('#detailaddressCheck').css('display', 'none');
		            detailaddressCheck = true;
		        }
		        if(idCheck && idOverlapCheck && pwCheck && nameCheck && mailCheck && contactCheck && zipcodeCheck && addressCheck && detailaddressCheck) {
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
						console.log(result);
						if(result == 'success') {
							$('#id_input_chk1').css("display", "inline-block");
							$('#id_input_chk2').css("display", "none");	
							idOverlapCheck = true;
						} else {
							$('#id_input_chk2').css("display", "inline-block");
							$('#id_input_chk1').css("display", "none");
							idOverlapCheck = false;
						} 
						if (M_id == "") {
							$('#id_input_chk1').css("display", "none");	
							$('#id_input_chk2').css("display", "none");
							idOverlapCheck = false;
						}
					}
				});
			});
		});
	</script>
</body>
</html>