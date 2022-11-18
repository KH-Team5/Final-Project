<!doctype html>
<html lang="kr">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	    crossorigin="anonymous"></script>
<title>문의사항</title>
<style>
/* 클레스 */
html,body{
 height: 100%;
}
.footerdown{
width: 100%;
position : fixed;
bottom : 0;
}

.table-hover{ 
width: 100%;
    margin-top: 10px;
}
.searchbar{
 width:25%;
margin-left: auto;
margin-right: auto;
 
}
.pagingBar{

margin-left:auto; 
margin-right: auto;
}
.linklink{

 margin-top: 30px;

}
.QuestionMain{
margin-left: auto;
margin-right: auto;
margin-top: 40px;
}



/* 아이디 */
/* #containerg{
  width: 100vw;
        height: 80vh;
} */
</style>
</head>

<body class="d-flex flex-column min-vh-100" style="background-color:"> 
 <jsp:include page="../navbar.jsp" flush="false" /><!-- background-color:oldlace -->
 <div class="QuestionMain"> 
    <h1><b style="color: black; font-family:; text-shadow: 2px 2px 2px gray;" >문의 사항</b></h1>
  </div> 
     <div class="linklink">
       <h5 style="font-family: san-serif;">&nbsp;&nbsp;<b>▶총 <b style="color: red">${count}</b>건의 게시물</b> &nbsp;&nbsp;<a type="button"  class="btn btn-success" href="<%=request.getContextPath()%>/board/write" style="font-size: large; color: white;"><span><b>글쓰기</b></span></a></h5>
<table class="table table-hover">


  <thead>
			    <tr style="font-family: san-serif; font-size:large; background-color: #000000">
				<th scope="col" style="color: white">번호</th>
				<th scope="col" style="color: white">아이디</th>
				<th scope="col" style="color: white">종류</th>
				<th scope="col" style="color: white">제목</th>
				<th scope="col" style="color: white">날짜</th>
			</tr>
		</thead>


		<tbody>
			<c:forEach items="${list}" var="list">
			 <tr class="table-light" style="">
					<th scope="row">${list.rn}</th>
					<td>&nbsp;${list.m_Id}</td>
					<td>&nbsp;${list.q_Category}</td>
					<td><a href="/board/view?q_index=${list.q_Index}&m_id=${list.m_Id}" style="text-decoration-line: none; color: #000000;">&nbsp;<b>${list.q_Title}</b></a></td>
					<td><fmt:formatDate value="${list.q_Date}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	</div>
	<div class="pagingBar">
        <ul class="pagination pagination-sm">
		<c:if test="${prev}" >
		 <li class="page-item">
            <a class="page-link " href="/board/listPageSearch?num=${startPageNum - 1}${searchTypeKeyword}">&laquo;</a>
		  </li>
		</c:if>
		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
            <c:if test="${select != num}">
            <li class="page-item">
					<a style="color: black;" class="page-link" href="/board/listPageSearch?num=${num}${searchTypeKeyword}">${num}</a>
			 </li>
			</c:if> 
			 <c:if test="${select == num}">
            <li class="page-item active">
               <a class="page-link" href="#">${num}</a>
             </li>
			</c:if> 
		</c:forEach>
		<c:if test="${next}">
		<li class="page-item">
            <a class="page-link" href="/board/listPageSearch?num=${endPageNum + 1}${searchTypeKeyword}">&raquo;</a>
		</li>
		</c:if>
     </ul>
   </div>



     <div class="searchbar">
		 <form name="listPage"  class="d-flex asdasd">
		 <div  class="btn-group" role="group" aria-label="Button group with nested dropdown">
		 <button type="button" class="btn btn-dark">keyword</button>
			<div class="btn-group" role="group">
			<select  id="btnGroupDrop1" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="searchType" style="width: 25px">
				<option value="q_title"
					<c:if test="${searchType eq 'q_title'}">selected</c:if>>제목</option>
				<option value="q_content"
					<c:if test="${searchType eq 'q_content'}">selected</c:if>>내용</option>
				<option value="q_title_q_content"
					<c:if test="${searchType eq 'q_title_q_content'}">selected</c:if>>제목+내용</option>
				<option value="M_id"
					<c:if test="${searchType eq 'M_id'}">selected</c:if>>작성자</option>
			</select>
		</div>	
		</div>
		  &nbsp;
		  <input  class="form-control me-sm-2" type="text" placeholder="내용을 입력하세요." name="keywordType" value="${keyword}">
		  <button type="button" class="btn btn-dark" id="searchBtn" style="width: 90px">Search</button>	
      </form>
</div>



<jsp:include page="footer.jsp" flush="false" />
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
  <script>
     document.getElementById("searchBtn").onclick = function () {		
    	 let searchType = document.getElementsByName("searchType")[0].value;
    	 let keyword = document.getElementsByName("keywordType")[0].value;
    	 
    	 location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
	</script>		
</body>

</html>















