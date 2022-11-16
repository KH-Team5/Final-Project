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
<title>문의사항</title>
<style>
.modifyForm {
	width: 20%;
	margin-left: auto;
	margin-right: auto;
	 margin-top: 200px;
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
<body>
	<form method="post" name="modify" onSubmit="return Checkform()"
		class="modifyForm">


		<div class="btn-group" role="group"
			aria-label="Button group with nested dropdown">
			<button type="button" class="btn btn-primary">카테고리</button>
			<select id="btnGroupDrop1" type="button"
				class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" name="q_Category">
				<option value="상의">상의</option>
				<option value="하의">하의</option>
				<option value="아우터">아우터</option>
			</select>
		</div>
		<br>


		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4">제목</label>
			<textarea class="form-control" id="exampleTextarea" rows="3"
				style="width: 350px; height: 25px;" name="q_Title" required>${view.q_Title}</textarea>
		</div>


		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4">내용</label>
			<textarea class="form-control" id="exampleTextarea" rows="3"
				style="width: 350px; height: 300px;" name="q_Content" required>${view.q_Content}</textarea>
		</div>


		<button type="submit" class="btn btn-primary" onclick="Checkform()">완료</button>
	</form>
   <br/>
	<div class="linklink">
		<span>
		    <a type="button" class="btn btn-light" href="/board/listPageSearch?num=1">문의 사항</a> 
		    <a type="button" class="btn btn-light" href="/">Home</a>
		</span>
	</div>
	</div>
	</form>
</body>
</html>