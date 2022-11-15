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
.table-hover{ 
width: 100%;
 margin-left:auto; 
    margin-right:auto;
    margin-top: 10px;
}
.d-flex{
width: 25%;
margin-left:auto; 
 margin-right:auto;
}
.pagination-sm{
width: 15%;
margin-left:auto; 
 margin-right:auto;
}
.linklink{
width: 50%;
margin-left:auto; 
 margin-right:auto;
 margin-top: 190px;

}

/* 아이디 */
#searchBtn{
}
</style>
</head>

<body>
   <jsp:include page="../navbar.jsp" flush="true" />
     <div class="linklink"><span>
     <a type="button"  class="btn btn-light" href="<%=request.getContextPath()%>/board/write">글쓰기</a>
	 <a type="button" class="btn btn-light" href="<%=request.getContextPath()%>/board/listPageSearch?num=1">문의 사항</a>
	 <a type="button"  class="btn btn-light" href="/">Home</a>
     </span>
<table class="table table-hover">
  <thead>
			    <tr class="table-active">
				<th scope="col">번호</th>
				<th scope="col">아이디</th>
				<th scope="col">종류</th>
				<th scope="col">제목</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>


		<tbody>
			<c:forEach items="${list}" var="list">
			 <tr class="table-light">
					<th scope="row">${list.rn}</th>
					<td>&nbsp;${list.m_Id}</td>
					<td>&nbsp;${list.q_Category}</td>
					<td><a href="/board/view?q_index=${list.q_Index}&m_id=${list.m_Id}">&nbsp;${list.q_Title}</a></td>
					<td><fmt:formatDate value="${list.q_Date}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	<div>
        <ul class="pagination pagination-sm">
		<c:if test="${prev}">
		 <li class="page-item">
            <a class="page-link" href="/board/listPageSearch?num=${startPageNum - 1}${searchTypeKeyword}">&laquo;</a>
		  </li>
		</c:if>
		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
            <c:if test="${select != num}">
            <li class="page-item">
					<a class="page-link" href="/board/listPageSearch?num=${num}${searchTypeKeyword}">${num}</a>
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
</div>




		 <form name="listPage"  class="d-flex">
		 <div  class="btn-group" role="group" aria-label="Button group with nested dropdown">
		 <button type="button" class="btn btn-primary">keyword</button>
			<div class="btn-group" role="group">
			<select  id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="searchType" style="width: 25px">
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
		<input  class="form-control me-sm-2" type="text" placeholder="Search" name="keyword" value="${keyword}">
		<button type="button" class="btn btn-primary" id="searchBtn" style="width: 90px">Search</button>	
      </form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
     document.getElementById("searchBtn").onclick = function () {		
    	 let searchType = document.getElementsByName("searchType")[0].value;
    	 let keyword = document.getElementsByName("keyword")[0].value;
    	 
    	 location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
	
 </script>
</body>
</html>















