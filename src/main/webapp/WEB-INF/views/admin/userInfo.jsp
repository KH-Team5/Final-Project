<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/classic/ckeditor.js"></script>
<title>유저 상세정보 페이지</title>
<style>
nav{
height:100px;
}
.navbar-brand{
position:relative;
font-size: xx-large;
}
ul{
position:relative;
left:35%;
}
.table-hover{
margin-right: auto;
margin-left: auto; 
width: 40%;
 
}
#btnc{
position: relative;
top: 50%;
left:63%;
width:120px;
height:45px;
}
</style>

</head>
<body>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><b>유저상세정보 페이지</a></b>
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
	
      <table class="table table-hover" id="usersManage">
         <thead>
         <tr>
         <th scopoe-"col"></th>
         </tr>
         </thead>
         <tbody>
               <tr>
               <th>회원아이디:
               ${u_list.m_Id}</th> 
               </tr>
               <tr>
               <th>이름:
               ${u_list.m_name}</th>
               </tr>
               <tr>
               <th>이메일:
               ${u_list.email}</th>
               </tr>
               <tr>
               <th>연락처:
               ${u_list.contact}</th>
               </tr>
               <tr>
               <th>우편번호:
               ${u_list.zipcode}</th>
               </tr>
               <tr>
               <th>주소:
               ${u_list.address}</th>
               </tr>
               <tr>
               <th>상세주소:
               ${u_list.detail_address}</th>
               </tr>
               <tr>
               <th>가입일:
                ${u_list.joined_date}</th>
               </tr>
               <tr>
               <th>권한:
               ${u_list.role}</th>
            </tr>
         </tbody>
         </table>  
           


	
	
	<tr>
       <td colspan="2">
       <div class = "logo" id="one">
       <button type="button" id="btnc" class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/admin/userDelete/${m_Id}'">아이디삭제</a></button>
      </div>
      </td>
      </tr>
	&nbsp;

</body>

<script>
function agreeDelete() {
	alert("유저 정보를 삭제 하시겠습니까?");
}
</script>

</html>