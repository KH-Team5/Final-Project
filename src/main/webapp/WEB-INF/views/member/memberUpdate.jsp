<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
   <title>main page</title>

<title>회원 정보 수정</title>

</head>
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

<body>

<jsp:include page="../navbar.jsp" flush="true" />
<form id="updateform" name="updateform" method="post">
   <table class="table table-bordered table-striped text-center">
   
   <caption class="abc">회원정보수정</caption>
   <tbody>
      <tr>
         <th>아이디</th>
         <td>${key1.m_Id}</td>
      </tr>
     <tr>
         <th>새로운 비밀번호:</th>
         <td><input id="M_pwd" name="M_pwd" type="password"></td>
        
      </tr>
       <tr>
         <th>이름</th>
         <td>${key1.m_name}</td>
      </tr>
      <tr>
         <th>새로운 이름:</th>
         <td><input id="M_name" name="M_name" type="text"></td>
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
         <th>새로운 전화번호:</th>
         <td><input id="contact" name="contact" type="tel" ></td>
      </tr>
       <tr>
         <th>우편번호</th>
         <td>${key1.zipcode}</td>
      </tr>
     <tr>
         <th>새로운 우편번호</th>
         <td><input id="zipcode" name="zipcode" type="number"></td>
      </tr>
       <tr>
         <th>주소</th>
         <td>${key1.address}</td>
      </tr>
      <tr>
         <th>새로운 주소</th>
         <td><input id="address" name="address" type="text" >
       <tr>
         <th>상세주소</th>
         <td>${key1.detail_address}</td>
      </tr>
      <tr>
         <th>새로운 상세 주소</th>
         <td><input id="detail_address" name="detail_address" type="text"></td>
       <tr>
       <tr>
         <th>가입날짜</th>
         <td>${key1.joined_date}</td>
      </tr> 
      
      <tr>
        <td colspan="2">
       <input type="button" id="updateform" value="수정 하기" class="btn btn btn-dark" onclick="update()"style="float-right;">
       <a href="<%=request.getContextPath()%>/member/mypage" class="btn btn btn-dark" style="float-right;" onclick="agreeFunction()">돌아가기</a>
      </td>
      </tr>
 </tbody>     
</table>
</form>
<jsp:include page="../footer.jsp" flush="true" />
   <script src="https://code.jquery.com/jquery-3.6.1.js" 
   integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
   integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
   crossorigin="anonymous"></script>
   <script type ="text/javascript">
   
  
   
    function update() {
       var M_pwd = document.getElementById('M_pwd');
          var M_name = document.getElementById('M_name');
          var contact = document.getElementById('contact');
          var zipcode = document.getElementById('zipcode');
          var address = document.getElementById('address');
          var detail_address = document.getElementById('detail_address');
          
          if(M_pwd.value == ""){
             alert("변경할 비밀번호를 입력하세요.");
             M_pwd.focus();
             return false;
          } 
          
          if(M_name.value == "") {
             alert("변경할 이름을 입력하세요.");
             M_name.focus();
                  return  false;
              } 
          
          if(contact.value == "") {
             alert("변경할 전화번호를 입력하세요.");
             contact.focus();
                  return false;
              }
          
          if(zipcode.value == "") {
             alert("변경할 우편번호를 입력하세요.");
             zipcode.focus();
                  return false;
              } 
          
              if(address.value == "") {
                 alert("변경할 주소를 입력하세요.");
                 address.focus();
                  return false;
              } 
              
              if(detail_address.value == "") {
                 alert("변경할 상세 주소를 입력하세요.");
                 detail_address.focus();
                  return false;
              } 
       
                 alert("정보가 변경되었습니다. 다시 로그인해주세요.");
                $("#updateform").submit();
              }


       function agreeFunction(){
            alert("마이페이지로 돌아가시겠습니까?")
         }
   
   </script>
   
   <script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>
</body>
</html>