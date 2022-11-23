<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String q_index = request.getParameter("q_index");
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
<style>
.replyForm{
 margin-left:auto; 
    margin-right:auto;
     margin-top: 160px;

}</style>
<title>댓글 수정~!</title>
</head>
<script type="text/javascript">
function Checkform() {
    if( replyCheck.rp_content.value == "") {   
        alert("수정할 내용을 입력하세요");  
        replyCheck.rp_content.focus(); 
        return false;
    }
}
</script>
<body  class="d-flex flex-column min-vh-100" style="background-color:">
 <jsp:include page="../navbar.jsp" flush="true" />
	<form method="post" name="replyCheck" onSubmit="return Checkform()" class="replyForm">
		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4" style="font-size: large; color: gray;"><b>댓글수정</b></label>
			<textarea class="form-control" id="exampleTextarea" rows="3"
				style="width:350px; height: 300px;" name="rp_content" placeholder="수정내용을 입력하세요." required>${reply.rp_content}</textarea>
		</div>
         <input type="hidden" name="q_index" value="${reply.q_Index}">
		 <input type="hidden" name="rno" value="${reply.rno}">

		<button type="submit" class="btn btn-success"onclick="Checkform()" style="float: right;">완료</button>
	</form>
 <jsp:include page="../footer.jsp" flush="true" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
 </body>
</html>