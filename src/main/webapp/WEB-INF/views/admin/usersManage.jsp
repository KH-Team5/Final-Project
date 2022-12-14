<!DOCTYPE html>
<html lang="en">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
<style>

.table-hover{
margin-right: auto;
margin-left: auto; 
width: 60%;
 
}
#paging_wrap{
margin-left:21%;
}

ul {
	list-style-type : none;
	
}
ul li {
	
	float: left;
	margin-right: 10px;
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
<title>유저관리페이지</title>
</head>

 <body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" id="user_1" href="#"><b>유저관리 페이지</a></b>
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
		<table class="table table-hover" id="usersManage">
			<thead>
				<tr class = "table-light">
					<th scope="col">회원아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">연락처</th>
					<th scope="col">우편번호</th>
					<th scope="col">주소</th>
					<th scope="col">상세주소</th>
					<th scope="col">가입일</th>
					<th scope="col">권한</th>
				</tr>
			</thead>	
			<tbody>
			<c:forEach var="list" items="${list}" >
				<tr>
	
				    <th scope="row"><a href="<%=request.getContextPath()%>/admin/userInfo/${list.m_Id}" style="color: black">
				    <c:out value="${list.m_Id}"/></a></th>
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
	<div id="paging_wrap">
      <c:if test="${prev}">
          <a href="<%=request.getContextPath()%>/admin/usersManage?num=${startPageNum - 1}${searchTypeKeyword}">이전</a>
         
         </li>
      </c:if>


      <c:forEach begin="${startPageNum}" end="${endPageNum}"
         var="num">
         <span id="paging_num"> <c:if test="${select != num}">
               <a href="<%=request.getContextPath()%>/admin/usersManage?num=${num}${searchTypeKeyword}" style="color: black">${num}</a>
            </c:if> <c:if test="${select == num}">
               <b>${num}</b>
            </c:if>

         </span>
      </c:forEach>
      <c:if test="${next}">
         <a href="<%=request.getContextPath()%>/admin/usersManage?num=${endPageNum + 1}${searchTypeKeyword}">다음</a>
      </c:if>

</ul>
</div>

<br>






</body>
</html>
