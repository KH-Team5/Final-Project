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
	
				    <td><a href="<%=request.getContextPath()%>/admin/userInfo/${list.m_Id}">
				    <c:out value="${list.m_Id}"/></a></td>
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
	
      <c:if test="${prev}">
         <span>[ <a
            href="<%=request.getContextPath()%>/admin/usersManage?num=${startPageNum - 1}${searchTypeKeyword}">이전</a>]
         </span>
      </c:if>


      <c:forEach begin="${startPageNum}" end="${endPageNum}"
         var="num">
         <span> <c:if test="${select != num}">
               <a href="<%=request.getContextPath()%>/admin/usersManage?num=${num}${searchTypeKeyword}">${num}</a>
            </c:if> <c:if test="${select == num}">
               <b>${num}</b>
            </c:if>

         </span>
      </c:forEach>

      <c:if test="${next}">
         <span>[ <a
            href="<%=request.getContextPath()%>/admin/usersManage?num=${endPageNum + 1}${searchTypeKeyword}">다음</a>
            ]
         </span>
      </c:if>


<br>
<a href="<%=request.getContextPath()%>/">홈</a>





</body>
</html>
