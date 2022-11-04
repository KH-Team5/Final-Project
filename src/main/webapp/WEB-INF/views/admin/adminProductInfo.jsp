<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	alert("상품을 삭제 하시겠습니까?");
}
function agreeModify(){
	alert("상품정보를 수정하시겠습니까?")
}
</script>


</head>
<body>
	<div id="image" data-p_Id="${productInfo.imageList[0].p_Id}" data-path="${productInfo.imageList[0].filePath}" data-uuid="${productInfo.imageList[0].uuid}" data-filename="${productInfo.imageList[0].fileName}">
		<img>
	</div>	
	상품번호: ${p_Id } <br>
	상품명: ${productInfo.p_Name } <br>
	가격: ${productInfo.p_Price } <br>
	상품재고: ${productInfo.p_Stock } <br>
	상품카테고리: ${productInfo.c_Name } <br>
	상품설명: ${productInfo.p_Intro } <br> 
	상품등록일: ${productInfo.p_Date } <br>
	
	
	<tr>
       <td colspan="2">
       <a href="<%=request.getContextPath()%>/admin/productModify/${p_Id}" class="btn" onclick="agreeModify()">상품수정</a>
       <a href="<%=request.getContextPath()%>/admin/productDelete/${p_Id}" class="btn" onclick="agreeDelete()">상품삭제</a>
      </td>
      </tr>
	
	
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		$(document).ready(function(){
			const imgView = $("#image");
			var imgChk = imgView.data("path");
			if(imgChk != ""){
				const imgView = $("#image");
				const path = imgView.data("path");
				const uuid = imgView.data("uuid");
				const fileName = imgView.data("filename");
				const uploadPath = encodeURIComponent(path + "/s_" + fileName);
				imgView.find("img").attr('src', '<%=request.getContextPath()%>/display?fileName=' + uploadPath);
			} else {
				// 이미지 없음
				// imgView.find("img").attr('src', '');
			}
		});		
	</script>
</body>
</html>