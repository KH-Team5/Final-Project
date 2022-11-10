<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/findPage.css">
		<title>Find Page</title>
		<script src="https://code.jquery.com/jquery-3.6.1.js"
			integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
			</script>
	</head>

	<body class="bg-light">
		<div class="container">
			<main>
				<div class="py-5 text-center">
					<h4>아이디 찾기</h4>
				</div>
				<div>
					<form class="needs-validation" id="findIdform" name="findIdform" novalidate>
						<div class="row g-3">
							<div class="col-12">
								<label for="email" class="form-label">이메일</label>
								<input class="form-control" id="email" name="email" type="email" required placeholder="you@example.com">
								<span id="mailChk1"></span>
								<br>
								<div class="col-3">
									<input class="btn btn-secondary" type="button" id="findIdBtn" value="아이디찾기">
								</div>
								<span id="resultId"></span>
							</div>
						</div>
					</form>
				</div>

				<div class="py-5 text-center">
					<h4>비밀번호 재설정</h4>
				</div>
				<div>
					<form class="needs-validation" id="reSetPwdform" name="reSetPwdform" novalidate>
						<div class="row g-3">
							<div class="col-12">
								<label for="m_Id" class="form-label">아이디</label>
								<input class="form-control" id="m_Id" name="m_Id" type="text" required>
								<span id="idChk"></span>
							</div>
							<div class="col-12">
								<label for="email2" class="form-label">이메일</label>
								<input class="form-control" id="email2" name="email2" type="email" required
									placeholder="you@example.com">
								<span id="mailChk2"></span>
							</div>
						</div>
						<br>
						<div>
							<input class="btn btn-secondary" type="button" id="reSetPwdBtn" value="비밀번호 재설정"> <br>
							<span id="resultPwd"></span>
						</div>
					</form>
				</div>
			</main>
		</div>
		<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
		<script>
			$(function () {
				$("#email").on("propertychange change keyup paste input", function () {
					var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					var email = $("#email").val();
					if (!email_rule.test(email))
						$("#mailChk1").html("이메일 형식이 아닙니다." + "<br>");
					else
						$("#mailChk1").html("사용가능 " + "<br>");
				});

				$("#email2").on("propertychange change keyup paste input", function () {
					var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					var email2 = $("#email2").val();
					if (!email_rule.test(email2))
						$("#mailChk2").html("이메일 형식이 아닙니다." + "<br>");
					else
						$("#mailChk2").html("사용가능 " + "<br>");
				});

			});

			$("#findIdBtn").click(function () {
				var email = $("#email").val();
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/member/findPage/findid?email=" + email,
					success: function (result) {
						if (result == '')
							$("#resultId").html("가입되지 않는 이메일 입니다.");
						else
							$("#resultId").html("가입된 아이디: " + result);
					}
				});
			});

			$("#reSetPwdBtn").click(function () {
				var data = {
					email: $("#email2").val(),
					id: $("#m_Id").val()
				};
				$.ajax({
					url: "<%=request.getContextPath()%>/member/findPage/pwdReset",
					type: "post",
					data: data,
					success: function (result) {
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