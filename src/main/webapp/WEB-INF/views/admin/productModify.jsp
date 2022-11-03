<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
   integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
   crossorigin="anonymous"></script>
</head>

<body>
   <h1>상품 정보 수정</h1>
   <div id="image" data-p_Id="${productInfo.imageList[0].p_Id}" data-path="${productInfo.imageList[0].filePath}" data-uuid="${productInfo.imageList[0].uuid}" data-filename="${productInfo.imageList[0].fileName}">
      <img>
   </div>   
   <form id="modifyform" name="modifyform" method="post">
      상품ID: ${productInfo.p_Id}<input type="hidden" name="p_Id"
      value=${productInfo.p_Id }> <br>
            
      상품명: ${productInfo.p_Name} <br>
      상품명 수정:<input id="p_Name" name="p_Name" type="text"><br>
      
      상품가격: ${productInfo.p_Price} <br>
      상품가격 수정:<input id="p_Price" name="p_Price" type="text"><br>
      
      상품재고수량: ${productInfo.p_Stock} <br>
      상품재고수량 수정:<input id="p_Stock" name="p_Stock" type="text"><br>
      
<%--       상품 카테고리: ${productInfo.c_Name} <br>
      상품카테고리 수정:<input id="c_Name" name="c_Name" type="text"><br>
       --%>
      상품설명: ${productInfo.p_Intro} <br>
      상품설명 수정:<input id="p_Intro" name="p_Intro" type="text"><br>
      
      상품등록일: ${productInfo.p_Date} <br>
      상품등록일 수정:<input id="p_Date" name="p_Date" type="text"><br>
             
      
      <input type="button" id="modifyButton" onclick="modify()" value="정보 수정">
   </form>
   <a href="<%=request.getContextPath()%>/">홈</a>
   <script>
       function modify(){
        alert("상품정보가 변경되었습니다.");
       $("#modifyform").submit();
       
       }
      
   </script>
   
   
</body>
</html>