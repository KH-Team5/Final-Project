<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  String m_id = request.getParameter("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
.mb-3{
width: 35%;
 margin-left:auto; 
    margin-right:auto;
    margin-top: 30px;

}
.replyCheck{
width: 35%;
 margin-left:auto; 
    margin-right:auto;
}
.list-group-flush{
 height: 320px;
}
.linklink{
 margin-left:auto; 
    margin-right:auto
}
li{ list-style-type : none }
body{
  height: 100%;
}
</style>
</head>
<script type="text/javascript">
function Check() {
    if(reply== null) {   
        alert("댓글을 삭제해주세요");  
        repCk.focus(); 
        return false;
    }else if(!reply == null) {   
        alert("삭제되었습니다.");   
        repCk.focus();
        return false;
    }      
}
function Checkform() {
    if( replyFrom.rp_content.value == "") {   
        alert("내용을 입력하세요");  
        replyFrom.rp_content.focus(); 
        return false;
    }
}
</script>
<body class="d-flex flex-column min-vh-100" style="background-color:oldlace">
 <jsp:include page="../navbar.jsp" flush="true" />
 <form method="post"> 
 <div class="card mb-3">
  <h6 class="card-header"><span class="badge bg-secondary">글쓴이</span>&nbsp;<b style="font-family: san-serif;">${view.m_Id}</b>&nbsp;<span class="badge bg-secondary" style="font-family: san-serif;">카테고리</span>&nbsp;<b>${view.q_Category}</b></h6>
  <div class="card-body">
    <h5 class="card-title"><span class="badge bg-secondary">제목</span>&nbsp;${view.q_Title}</h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><span class="badge bg-secondary">내용</span>&nbsp;${view.q_Content}</li>
  </ul>
  <br/>  
    <div class="linklink">
		<span>
		    <a type="button" class="btn btn-success" href="/board/modify?q_index=${view.q_Index}&m_id=${view.m_Id}" style="font-size: large; font-family: san-serif"><b>게시물 수정</b></a>
            <a type="button" class="btn btn-success" href="/board/delete?q_index=${view.q_Index}&m_id=${view.m_Id}" onclick="Check()" style="font-size: large; font-family: san-serif"><b>게시물 삭제</b></a>
		</span>
	</div>
	 <br/> 
</div>
</form>
    <div class="replyCheck">
      <form method="post" action="/reply/write" name="replyFrom" onSubmit="return Checkform()"> 	 
		 <div>
			<label for="exampleTextarea" class="form-label mt-4" style="font-size: large; color: gray;"><b>댓글</b></label>
			 <textarea class="form-control" id="exampleTextarea" rows="3"
				style="width:100%; height:150px;" name="rp_content" required placeholder="댓글을 입력하세요."></textarea>   
		     <input type="hidden" name="q_Index" value="${view.q_Index}">
		     <button type="submit" onclick="Checkform()" class="btn btn-success" style="font-family: san-serif;"><b>댓글달기</b></button>
         </div>
      </form>

 <div class="list-group"> 
  <c:forEach items="${reply}" var="reply">
   <li>
   <div class="list-group-item list-group-item-action flex-column align-items-start" style="border-radius: 15px">
    <div class="d-flex w-100 justify-content-between">
     <h5 class="mb-1">${reply.m_Id}</h5>
     <small class="text-muted"><fmt:formatDate value="${reply.rp_Date}" pattern="yyyy-MM-dd"/></small>
    </div>
     <div  style="float: right;">
         <a  type="button" class="btn btn-success" href="/reply/modify?q_index=${view.q_Index}&rno=${reply.rno}&m_id=${reply.m_Id}" style="font-family: san-serif;">수정</a>  /  
         <a  type="button" class="btn btn-success" href="/reply/delete?q_index=${view.q_Index}&rno=${reply.rno}&m_id=${reply.m_Id}" style="font-family: san-serif;">삭제</a> 
     </div>
         <br/>
        <p class="mb-1">${reply.rp_content}</p>
     </div>
     </li> 
   </c:forEach>
  </div>
</div>
<jsp:include page="footer.jsp" flush="true" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
 </body>
</html>