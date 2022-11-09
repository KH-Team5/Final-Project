<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
	</script>
<script>
function agreeDelete() {
	alert("유저 정보를 삭제 하시겠습니까?");
}
</script>


</head>
<body>
	
      <table id="usersManage">
         <thead>
            <tr>
               <th>회원아이디:</th>
               <td>${u_list.m_id}</td> 
               </tr>
               <tr>
               <th>이름:</th>
               <td>${u_list.m_name}</td>
               </tr>
               <tr>
               <th>이메일:</th>
               <td>${u_list.email}</td>
               </tr>
               <tr>
               <th>연락처:</th>
               <td>${u_list.contact}</td>
               </tr>
               <tr>
               <th>우편번호:</th>
               <td>${u_list.zipcode}</td>
               </tr>
               <tr>
               <th>주소:</th>
               <td>${u_list.address}</td>
               </tr>
               <tr>
               <th>상세주소:</th>
               <td>${u_list.detail_address}</td>
               </tr>
               <tr>
               <th>가입일:</th>
               <td>${u_list.joined_date}</td>
               </tr>
               <tr>
               <th>권한:</th>
               <td>${u_list.role}</td>
            </tr>
         </thead> 
         </table>  
           


			
	
	
	<tr>
       <td colspan="2">
       <a href="<%=request.getContextPath()%>/admin/userDelete/${M_id}" class="btn" onclick="agreeDelete()">아이디삭제</a>
      </td>
      </tr>
	&nbsp;
	<a href="<%=request.getContextPath()%>/">홈</a>

</body>
</html>