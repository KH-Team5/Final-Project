<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
<title>마이 페이지</title>
<style type="text/css">
.table {
   margin: auto;
   width: 65% !important; 
}
.abc { caption-side: top;
       color: black;
       font-size: 36px;


}
   
   </style>
</head>

<body class="d-flex flex-column min-vh-100">
<jsp:include page="../navbar.jsp" flush="true" />
 <table class="table table-bordered table-striped text-center">
 <caption class="abc">회원정보수정</caption>
      <tr>
         <th>아이디</th>
         <td>${key1.m_Id}</td>
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
       <a href="<%=request.getContextPath()%>/member/memberUpdate" class="btn btn btn-dark" onclick="updateAgree()">정보수정</a>
       <a href="<%=request.getContextPath()%>/cart" class="btn btn btn-dark">장바구니</a>
       <a href="<%=request.getContextPath()%>/member/orderList" class="btn btn btn-dark">주문목록</a>
       <a href="<%=request.getContextPath()%>/member/memberDelete" class="btn btn btn-dark" onclick="agreeFunction()">회원 탈퇴</a>
      </td>
      </tr>
</table>
 <jsp:include page="../footer.jsp" flush="true" />
<script>
function agreeFunction() {
	alert("정말 탈퇴하시겠습니까?");
}
function updateAgree(){
	alert("회원정보를 변경하시겠습니까?")
}
</script>
</body>

</html>