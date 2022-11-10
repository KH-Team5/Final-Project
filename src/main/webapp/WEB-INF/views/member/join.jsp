<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/join.css">
	<title>Join Page</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
		</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body class="bg-light">
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<h1>회원가입 페이지</h1>
			</div>
			<div>
				<form class="needs-validation" id="joinform" name="joinform" method="post" novalidate>
					<div class="row g-3">
						<div class="col-12">
							<label for="m_Id" class="form-label">아이디</label>
							<input class="form-control" id="m_Id" name="m_Id" type="text" required>
							<div>
								<span id="idInputChk"></span>
							</div>
							<span id="idChk"></span>
						</div>

						<div class="col-12">
							<label for="M_pwd" class="form-label">비밀번호</label>
							<input class="form-control" id="M_pwd" name="M_pwd" type="password" required>
							<span id="pwChk"></span>
						</div>

						<div class="col-12">
							<label for="M_name" class="form-label">이름</label>
							<input class="form-control" id="M_name" name="M_name" type="text" required>
							<span id="nameChk"></span>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">이메일</label>
							<input class="form-control" id="email" name="email" type="email" required placeholder="you@example.com">
							<span id="mailChk"></span>
							<br>
							<div class="col-sm-6">
								<div class="input-group">
									<input class="form-control" id="authNum" name="authNum" disabled="disabled">
									<input class="btn btn-secondary" id="authNumBtn" name="authNumBtn" type="button" value="인증번호 전송" disabled="disabled">
								</div>
								<div>
									<span id="authNumChk"></span>
								</div>
							</div>
						</div>

						<div class="col-12">
							<label for="contact" class="form-label">연락처</label>
							<input class="form-control" id="contact" name="contact" type="tel" required>
							<span id="contactChk"></span>
						</div>

						<div class="col-md-5">
							<label for="address" class="form-label">주소</label>
							<input class="form-control" id="address" name="address" type="text" required>
							<span id="addressChk"></span>
						</div>

						<div class="col-md-4">
							<label for="detail_address" class="form-label">상세주소</label>
							<input class="form-control" id="detail_address" name="detail_address" type="text" required>
							<span id="detailaddressChk"></span>
						</div>

						<div class="col-md-3">
							<label for="zipcode" class="form-label">우편번호</label>
							<input class="form-control" id="zipcode" name="zipcode" type="text" required>
							<span id="zipcodeChk"></span>
						</div>
						<div class="col-3">
							<a class="address_search_btn btn btn-secondary" onclick="execution_daum_address()">주소찾기</a>
						</div>
						<input class="w-100 btn btn-primary btn-lg" type="button" id="joinbutton" value="회원가입">
					</div>
				</form>
			</div>
		</main>
	</div>
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
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
		$(function () {
			$("#joinbutton").click(function () {
				var id = $('#m_Id').val();
				var pw = $('#M_pwd').val();
				var name = $('#M_name').val();
				var mail = $('#email').val();
				var contact = $('#contact').val();
				var zipcode = $('#zipcode').val();
				var address = $('#address').val();
				var detailaddress = $('#detail_address').val();
				if (id == "") {
					$('#idChk').html("필수 항목입니다." + "<br>");
					idChk = false;
				} else {
					$('#idChk').html("");
					idChk = true;
				}
				if (pw == "") {
					$('#pwChk').html("필수 항목입니다." + "<br>");
					pwChk = false;
				} else {
					$('#pwChk').html("");
					pwChk = true;
				}
				if (name == "") {
					$('#nameChk').html("필수 항목입니다." + "<br>");
					nameChk = false;
				} else {
					$('#nameChk').html("");
					nameChk = true;
				}
				if (mail == "") {
					$('#mailChk').html("필수 항목입니다." + "<br>");
					mailChk = false;
				} else {
					$('#mailChk').html("");
					mailChk = true;
				}
				if (contact == "") {
					$('#contactChk').html("필수 항목입니다." + "<br>");
					contactChk = false;
				} else {
					$('#contactChk').html("");
					contactChk = true;
				}
				if (zipcode == "") {
					$('#zipcodeChk').html("필수 항목입니다." + "<br>");
					zipcodeChk = false;
				} else {
					$('#zipcodeChk').html("");
					zipcodeChk = true;
				}
				if (address == "") {
					$('#addressChk').html("필수 항목입니다." + "<br>");
					addressChk = false;
				} else {
					$('#addressChk').html("");
					addressChk = true;
				}
				if (detailaddress == "") {
					$('#detailaddressChk').html("필수 항목입니다." + "<br>");
					detailaddressChk = false;
				} else {
					$('#detailaddressChk').html("");
					detailaddressChk = true;
				}
				if (idChk && idOverlapChk && pwChk && nameChk && mailChk && contactChk && zipcodeChk && addressChk && detailaddressChk && mailAuthChk) {
					$("#joinform").attr("action", "<%= request.getContextPath()%>/member/join");
					$("#joinform").submit();
				}
			});

			$('#m_Id').on("propertychange change keyup paste input", function () {
				var m_Id = $('#m_Id').val();
				var data = { m_Id: m_Id };
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/join/idChk",
					data: data,
					success: function (result) {
						if (result == 'success') {
							$('#idInputChk').html("사용가능 " + "<br>");
							$("#idInputChk").attr("class", "blue");
							idOverlapChk = true;
						} else {
							$('#idInputChk').html("중복" + "<br>");
							$("#idInputChk").attr("class", "");
							idOverlapChk = false;
						}
						if (m_Id == "") {
							idOverlapChk = false;
							$('#idInputChk').html("");
						}
					}
				});
			});

			$("#email").on("propertychange change keyup paste input", function () {
				var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var email = $("#email").val();
				var data = { email: email };
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/join/emailOverlapChk",
					data: data,
					success: function (result) {
						if(!email_rule.test(email)){
							$("#authNumChk").html("이메일 형식이 아닙니다." + "<br>");
							$("#authNumChk").attr("class", "");
							$("#authNumBtn").attr("disabled", true);
						}
						else if (result == 'success') {
							$("#authNumChk").html("사용가능 " + "<br>");
							$("#authNumChk").attr("class", "blue");
							$("#authNumBtn").attr("disabled", false);
						} else {
							$("#authNumChk").html("중복" + "<br>");
							$("#authNumChk").attr("class", "");
							$("#authNumBtn").attr("disabled", true);
						}
						if (m_Id == "") {
							$("#authNumBtn").attr("disabled", false);
						}
					}
				});
			});
		});

		$("#authNumBtn").click(function () {
			var email = $("#email").val();
			var authNum = $("#authNum");
			$.ajax({
				type: "GET",
				url: "<%=request.getContextPath()%>/member/join/mailChk?email=" + email,
				success: function (data) {
					$("#authNum").attr("disabled", false);
					$("#authNumBtn").attr("disabled", true);
					code = data;
				}
			});
		});

		$("#authNum").blur(function () {
			var inputCode = $("#authNum").val();
			var checkResult = $("#authNumChk");
			if (inputCode == code) {
				checkResult.html("인증 성공");
				mailAuthChk = true;
			} else {
				checkResult.html("인증 실패");
				mailAuthChk = false;
			}
		});

		function execution_daum_address() {
			new daum.Postcode({
				oncomplete: function (data) {
					var addr = '';
					var extraAddr = '';
					if (data.userSelectedType === 'R')
						addr = data.roadAddress;
					else
						addr = data.jibunAddress;

					if (data.userSelectedType === 'R') {
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname))
							extraAddr += data.bname;
						if (data.buildingName !== '' && data.apartment === 'Y')
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						if (extraAddr !== '')
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