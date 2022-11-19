<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String m_id = request.getParameter("m_id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	    crossorigin="anonymous"></script>	
<title>문의사항</title>
<style>
html,body{
 height: 100%;
}
.footerdown{
width: 100%;
position : fixed;
bottom : 0;
}
.modifyForm {
	width: 18%;
	margin-left: auto;
	margin-right: auto;
	 margin-top: 110px;
}
.linklink{
width: 20%;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<script type="text/javascript">
	function Checkform() {
		if (modify.q_Title.value == "") {
			alert("제목을 입력하세요");
			modify.q_Title.focus();
			return false;
		} else if (modify.q_Content.value == "") {
			alert("내용을 입력하세요.");
			modify.q_Content.focus();
			return false;
		}
	}
</script>
<body class="d-flex flex-column min-vh-100" style="background-color: ">
<jsp:include page="../navbar.jsp" flush="true" />
   <div>
	<form method="post" name="modify" onSubmit="return Checkform()"
		class="modifyForm">
		<div class="btn-group" role="group"
			aria-label="Button group with nested dropdown">
			<button type="button" class="btn btn-dark" style="font-family: san-serif;"><b>Category</b></button>
			<select id="btnGroupDrop1"
				class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" name="q_Category" style="font-family: san-serif;">
				<option value="상의">상의</option>
				<option value="하의">하의</option>
				<option value="아우터">아우터</option>
			</select>
		</div>
		<br>


		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4" style="font-size: large; color: gray; font-family: san-serif;"><b>제목</b></label>
			<textarea class="form-control" id="exampleTextarea" rows="3"
				style="width: 350px; height: 25px;" name="q_Title" placeholder="제목을 입력하세요." required>${view.q_Title}</textarea>
		</div>


		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4" style="font-size: large; color: gray;font-family: san-serif;"><b>내용</b></label>
			<textarea class="form-control" id="exampleTextarea" rows="3"
				style="width: 350px; height: 300px;" name="q_Content" placeholder="내용을 입력하세요." required>${view.q_Content}</textarea>
		</div>


		<button type="submit" class="btn btn-success" onclick="Checkform()" style="float: right;"><b>완료</b></button>
	</form>
	</div>
   <br/>
	<jsp:include page="footer.jsp" flush="true" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>