<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
<style>
#table_empty{
margin-left: auto;
margin-right: auto;
}
.d-flex{
margin-left: auto;
margin-right: auto;
margin-bottom: 10px;



}
</style>
<script>
function CheckSearChForm() {
	if(SearchForrm.keyword.value == ""){
		 alert("내용을 입력하세요");  
		 SearchForrm.keyword.focus(); 
	        return false;
	}
}

</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="../navbar.jsp" flush="true" />
	<h3 class="text-center" style="margin-top: 10px;">주문 내역 페이지</h3>
    <c:if test="${listcheck != 'empty'}">
    <div>
		<table id="products" class="table table-hover" style= "margin: auto;
   width: 65% !important;">
			<thead>
				<tr class="text-center">
					<td class="text-center">주문 번호</td>
					<c:if test = "${member.role == 'ROLE_ADMIN'}">
	                	<td class="text-center">주문 아이디</td>
	                </c:if>
	                <td class="text-center">주문 상품</td>
       				<td class="text-center">주문 날짜</td>
       				<td class="text-center">주문 상태</td>
       				<td class="text-center">취소</td>
				</tr>
			</thead>	
			<c:forEach var="list" items="${list}" >
				<tr class="text-center">
					<td class="text-center"><c:out value="${list.o_Id}"></c:out> </td>
					<c:if test = "${member.role == 'ROLE_ADMIN'}">
	       				<td><c:out value="${list.m_Id}"></c:out></td>
	       			</c:if>
	       			<td class="text-center"><c:out value="${list.p_Name}"></c:out></td>
	       			<td class="text-center"><fmt:formatDate value="${list.o_Date}" pattern="yyyy-MM-dd"/></td>
	       			<td class="text-center"><c:out value="${list.o_State}"/></td>
	       			<td class="text-center">
	       				<c:if test="${list.o_State == '배송준비'}">
	       					<button class="cancel_btn btn btn-dark" data-o_id="${list.o_Id}">취소</button>
       					</c:if>
       				</td>
	       		</tr>
			</c:forEach>
		</table>
		</div>
	</c:if>
	
	<c:if test="${listCheck == 'empty'}">
		<div id="table_empty">
			주문 내역이 없습니다
		</div>
	</c:if>
	<br/>
	
   	<!-- 페이징 -->
   	<div class="d-flex justify-content-center" id="paging_wrap">
   		<ul class="pagination" id="paging">
   			<c:if test="${paging.prev }">
   				<li class="page-item" id="prev_btn">
   					<a class="page-link" href="${paging.pageStart -1 }">이전
   					<span aria-hidden="true">&laquo;</span>
   					</a>
   				</li>
   			</c:if>
   			<c:forEach begin="${paging.pageStart }" end="${paging.pageEnd }" var="num">
   				<li class="page-item paging_btn ${paging.cri.pageNum == num ? 'active':''}">
   					<a class="page-link" href="<%=request.getContextPath()%>/member/orderList?keyword=${paging.cri.keyword }&pageNum=${num }&amount=${paging.cri.amount }">
   						${num }
   					</a>
   				</li>
   			</c:forEach>
			<c:if test="${paging.next }">
				<li class="page-item" id="next_btn">
					<a class="page-link" href="${paging.pageEnd + 1 }">다음</a>
					<span aria-hidden="true">&raquo;</span>
				</li>
			</c:if>
		</ul>
	</div>

   		   <form id="move" action="<%=request.getContextPath()%>/member/orderList" method="get">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
	</form>
   	
   	<!-- 검색 -->
	<form onSubmit="return CheckSearChForm()" name="SearchForrm" class="d-flex" id="search" action="<%=request.getContextPath()%>/member/orderList" method="get">
   		<input class="form-control me-sm-2" type="text" name="keyword" value="${paging.cri.keyword }" required>
   		<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   		<input type="hidden" name="amount" value="${paging.cri.amount }">
   		<button id='search_btn btn' class= "btn btn-dark" onclick="CheckSearChForm()">검색</button> &nbsp;
   		<a href="<%=request.getContextPath()%>/member/mypage" class="btn btn btn-dark" style="float-right;">돌아가기</a>
	</form>
	
	<!-- 취소 -->
	<form  id="cancel" action="<%=request.getContextPath()%>/member/orderCancle" method="post">
       	<input type="hidden" name="o_Id">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		<input type="hidden" name="m_Id" value="${member.m_Id}">
	</form>
	<script>
		let searchForm22 = $('#search');
		let amount = "${paging.cri.amount }";
		$(function(){
			if(amount == '')
				$('#paging_btn').css('display','none');
		});
		
		$("#search_btn").on("click", function(e){	
			e.preventDefault();
			if(!searchForm22.find("input[name='keyword']").val()){
				alert("검색어를 입력하십시오");
				return false;
			}
			if(amount == '') 
				searchForm22.find("input[name='amount']").val("10");
			searchForm22.find("input[name='pageNum']").val("1");
			searchForm22.submit();
		});
		
		$(".cancel_btn").on("click", function(e){
			e.preventDefault();
			let id = $('.cancel_btn').data("o_id");
			$("#cancel").find("input[name='o_Id']").val(id);
			$("#cancel").submit();
		});
	</script>
	<jsp:include page="../footer.jsp" flush="true" />
</body>
</html>