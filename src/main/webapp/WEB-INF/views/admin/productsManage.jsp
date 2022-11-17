<!DOCTYPE html>
<html lang="en">
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
<meta charset="UTF-8">
<style>


ul {
	list-style-type : none;
	
}
ul li {
	
	float: left;
	margin-right: 5px;
}



#products{
width: 60%;
 margin-left:auto; 
    margin-right:auto;
}

#paging_wrap{
 margin-left:19%;
 
}

#search{
 margin-left:24%; 
    
}
.navbar-brand{
font-size: xx-large;
}
nav{
height:100px;
}
#navbarColor02{
position:absolute;
left:45%;
}

</style>


<head>
<meta charset="UTF-8">
<title>상품 관리 페이지</title>

</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><b>상품관리 페이지</a></b>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/" style="color: white"><img src="<%=request.getContextPath()%>/resources/img/bkh.png">
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
      </ul>
     
  </div>
</nav>
	 <br><br>
    <c:if test="${listcheck != 'empty'}">
		<table class="table table-hover" id="products">
			<thead>
				<tr class = "table-light">
					<th scope="col">상품번호</th>
					<th scope="col">상품이름</th>
					<th scope="col">상품가격</th>
					<th scope="col">재고</th>
					<th scope="col">카테고리</th>
					<th scope="col">등록날짜</th>
				</tr>
			</thead>	
	 
	
				<tbody>
			<c:forEach var="list" items="${list}" >
				<tr>
					<th scope="row">${list.p_Id}</th>
					<td><a href="<%=request.getContextPath()%>/admin/adminProductInfo/${list.p_Id}"  style="color: black">
					<c:out value="${list.p_Name}"/></a></td> 
					<td><c:out value="${list.p_Price}"></c:out></td>
					<td><c:out value="${list.p_Stock}"></c:out></td>
					<td><c:out value="${list.p_Category}"></c:out></td>				
					<td>
						<fmt:parseDate value="${list.p_Date}" pattern="yyyy-MM-dd" var="myDate"/>
						<fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
		
			</tbody>
		</table>
		
	</c:if>
	<c:if test="${listCheck == 'empty'}">
		<div id="table_empty">
			등록된 상품이 없습니다.
		</div>
	</c:if>
	
   	<!-- 페이징 -->
   	
   	<div id="paging_wrap">
   		<ul id="paging">
   			<c:if test="${paging.prev }">
   				<li id="prev_btn">
   					<a href="${paging.pageStart -1 }">이전</a>
   				</li>
   			</c:if>
   			<c:forEach begin="${paging.pageStart }" end="${paging.pageEnd }" var="num">
   				<li id="paging_btn">
   					<a href="<%=request.getContextPath()%>/admin/productsManage?keyword=${paging.cri.keyword }&pageNum=${num }&amount=${paging.cri.amount }&type=T" style="color: black">
   						${num }
   					</a>
   				</li>
   			</c:forEach>
			<c:if test="${paging.next }">
				<li id="next_btn">
					<a href="${paging.pageEnd + 1 }">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
   	<span id="positioning">
   	<!-- 검색 -->
	<form id="search" action="<%=request.getContextPath()%>/admin/productsManage" method="get">
   		<input type="text" name="keyword" value="${paging.cri.keyword }">
   		<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   		<input type="hidden" name="amount" value="${paging.cri.amount }">
   		<input type="hidden" name="type" value="T">
   		<button id='search_btn'>검색</button>
	</form>
	</span>
	
	<script>
		let search = $('#search');
		let amount = "${paging.cri.amount }";
		
		$(function(){
			if(amount == '')
				$('#paging_btn').css('display','none');
			e.preventDefault();
			let eResult = '<c:out value="${registration_result}"/>';
			checkResult(eResult);
			function checkResult(result){
				if(result === '')
					return;
				alert("상품'"+ eResult +"'을 등록하였습니다.");
			}
		});
		
 		$("#search button").on("click", function(e){
			e.preventDefault();
			if(!search.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			if(amount == '')
				search.find("input[name='amount']").val("10");
			search.find("input[name='pageNum']").val("1");
			search.submit();
		});
	</script>
</body>
</html>