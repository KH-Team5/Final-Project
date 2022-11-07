 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


 <body>

	<h1>유저 관리 페이지</h1>
    <c:if test="${listcheck != 'empty'}">
		<table id="usersManage">
			<thead>
				<tr>
					<td>회원아이디</td>
					<td>이름</td>
					<td>이메일</td>
					<td>연락처</td>
					<td>우편번호</td>
					<td>주소</td>
					<td>상세주소</td>
					<td>가입일</td>
					<td>권한</td>
				</tr>
			</thead>	
			<c:forEach var="list" items="${list}" >
				<tr>
				 
					<td><c:out value="${list.m_id}"></c:out></td>
					<td><c:out value="${list.m_name}"></c:out></td>
					<td><c:out value="${list.email}"></c:out></td>				
					<td><c:out value="${list.contact}"></c:out></td>
					<td><c:out value="${list.zipcode}"></c:out></td>
					<td><c:out value="${list.address}"></c:out></td>
					<td><c:out value="${list.detail_address}"></c:out></td>
						<td>
						<fmt:parseDate value="${list.joined_date}" pattern="yyyy-MM-dd" var="myDate"/>
						<fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd"/> </td>
					<td><c:out value="${list.role}"></c:out></td>
					<td>
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
   				<li id="paging_btn">
   					<a href="<%=request.getContextPath()%>/admin/productsManage?keyword=${paging.cri.keyword }&pageNum=${num }&amount=${paging.cri.amount }&type=T">
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
   	
   	<!-- 검색 -->
	<form id="search" action="<%=request.getContextPath()%>/admin/usersManage" method="get">
   		<input type="text" name="keyword" value="${paging.cri.keyword }">
   		<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   		<input type="hidden" name="amount" value="${paging.cri.amount }">
   		<input type="hidden" name="type" value="T">
   		<button id='search_btn'>검색</button>
	</form>
	
	<a href="<%=request.getContextPath()%>/">홈</a>
	
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