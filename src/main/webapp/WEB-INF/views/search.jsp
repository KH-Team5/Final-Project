<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<jsp:include page="navbar.jsp" flush="true"/>
	<h1>검색 페이지</h1>
    <c:if test="${listcheck != 'empty'}">
		<table id="products">
			<thead>
				<tr>
					<td>상품 이름</td>
					<td>상품 가격</td>
					<td>평점</td>
					<td>재고</td>
					<td>카테고리</td>
					<td>등록날짜</td>
				</tr>
			</thead>	
			<c:forEach var="list" items="${list}" >
				<tr>
					<td><a href="<%=request.getContextPath()%>/productInfo/${list.p_Id}"><c:out value="${list.p_Name}"/></a></td>
					<td><c:out value="${list.p_Price}"/></td>
					<td><c:out value="${list.p_RatingAvg}"/></td>
					<td><c:out value="${list.p_Stock}"/></td>
					<td><c:out value="${list.c_Name}"/></td>				
					<td>
						<fmt:parseDate value="${list.p_Date}" pattern="yyyy-MM-dd" var="myDate"/>
						<fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
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
   				<li class="paging_btn ${paging.cri.pageNum == num ? 'active':''}">
   					<a href="
   						${num }
					">
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
	
	<form id="moveForm" action="<%=request.getContextPath()%>/search" method="get" >
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		<input type="hidden" name="c_Code" value="${paging.cri.c_Code}">
		<input type="hidden" name="type" value="${paging.cri.type}">
	</form>	
	
	<a href="<%=request.getContextPath()%>/">홈</a>
	
	<script>
		let search = $('#search');
		let amount = "${paging.cri.amount }";
		
		$(function(){
			if(amount == '')
				$('.paging_btn').css('display','none');
			const selectedType = '<c:out value="${paging.cri.type}"/>';
			if(selectedType != ""){
				moveForm.find("input[name='type']").val(selectedType);	
			}
		});
		
 		$("#search button").on("click", function(e){
			e.preventDefault();
			if(amount == '')
				search.find("input[name='amount']").val("10");
			search.find("input[name='pageNum']").val("1");
			search.submit();
		});
 		
 		const moveForm = $('#moveForm');
 		
 		$(".paging_btn a").on("click", function(e){
 			
 			e.preventDefault();
 			
 			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
 			
 			moveForm.submit();
 			
 		});	
	</script>
</body>
</html>