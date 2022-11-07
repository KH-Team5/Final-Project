<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>주문 내역 페이지</h1>
    <c:if test="${listcheck != 'empty'}">
		<table id="products">
			<thead>
				<tr>
					<td>주문 번호</td>
					<c:if test = "${member.role == 'ROLE_ADMIN'}">
	                	<td>주문 아이디</td>
	                </c:if>
	                <td>주문 상품</td>
       				<td>주문 날짜</td>
       				<td>주문 상태</td>
       				<td>취소</td>
				</tr>
			</thead>	
			<c:forEach var="list" items="${list}" >
				<tr>
					<td><c:out value="${list.o_Id}"></c:out> </td>
					<c:if test = "${member.role == 'ROLE_ADMIN'}">
	       				<td><c:out value="${list.m_Id}"></c:out></td>
	       			</c:if>
	       			<td><c:out value="${list.p_Name}"></c:out></td>
	       			<td><fmt:formatDate value="${list.o_Date}" pattern="yyyy-MM-dd"/></td>
	       			<td><c:out value="${list.o_State}"/></td>
	       			<td>
	       				<c:if test="${list.o_State == '배송준비'}">
	       					<button class="cancel_btn" data-o_id="${list.o_Id}">취소</button>
       					</c:if>
       				</td>
	       		</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${listCheck == 'empty'}">
		<div id="table_empty">
			주문 내역이 없습니다
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
   					<a href="<%=request.getContextPath()%>/member/orderList?keyword=${paging.cri.keyword }&pageNum=${num }&amount=${paging.cri.amount }">
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
	
	<form id="move" action="<%=request.getContextPath()%>/member/orderList" method="get">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
	</form>
   	
   	<!-- 검색 -->
	<form id="search" action="<%=request.getContextPath()%>/member/orderList" method="get">
   		<input type="text" name="keyword" value="${paging.cri.keyword }">
   		<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   		<input type="hidden" name="amount" value="${paging.cri.amount }">
   		<button id='search_btn'>검색</button>
	</form>
	
	<!-- 취소 -->
	<form id="cancel" action="<%=request.getContextPath()%>/member/orderCancle" method="post">
       	<input type="hidden" name="o_Id">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		<input type="hidden" name="m_Id" value="${member.m_Id}">
	</form>
	
	<a href="<%=request.getContextPath()%>/">홈</a>
	
	<script>
		let searchForm = $('#search');
		let amount = "${paging.cri.amount }";
		$(function(){
			if(amount == '')
				$('#paging_btn').css('display','none');
		});
		
		$("#search_btn").on("click", function(e){	
			e.preventDefault();
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			if(amount == '') 
				searchForm.find("input[name='amount']").val("10");
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});
		
		$(".cancel_btn").on("click", function(e){
			e.preventDefault();
			let id = $('.cancel_btn').data("o_id");
			$("#cancel").find("input[name='o_Id']").val(id);
			$("#cancel").submit();
		});
	</script>
</body>
</html>