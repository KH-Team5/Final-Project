<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script>
function agreeFunction() {
	alert("정말 탈퇴하시겠습니까?");
}
function updateAgree(){
	alert("회원정보를 변경하시겠습니까?")
}
</script>
</head>
<body>
<h1>가입 정보</h1>
 <table class="table">
      <tr>
         <th>아이디</th>
         <td>${key1.m_id}</td>
      </tr>
       <tr>
         <th>이름</th>
         <td>${key1.m_name}</td>
      </tr>
       <tr>
         <th>이메일</th>
         <td>${key1.email}</td>
      </tr>
       <tr>
         <th>전화번호</th>
         <td>${key1.contact}</td>
      </tr>
       <tr>
         <th>우편번호</th>
         <td>${key1.zipcode}</td>
      </tr>
       <tr>
         <th>주소</th>
         <td>${key1.address}</td>
      </tr>
       <tr>
         <th>상세주소</th>
         <td>${key1.detail_address}</td>
      </tr>
       <tr>
         <th>가입날짜</th>
         <td>${key1.joined_date}</td>
      </tr>
      <tr>
       <td colspan="2">
       <a href="<%=request.getContextPath()%>/member/memberUpdate" class="btn" onclick="updateAgree()">정보수정</a>
       <a href="<%=request.getContextPath()%>/member/memberDelete" class="btn" onclick="agreeFunction()">회원 탈퇴</a>
      </td>
      </tr>
</table>
<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>