<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body>
	상품 번호: ${p_Id } <br>
	상품 이름: ${productInfo.p_Name } <br>
	상품 가격: ${productInfo.p_Price } <br>
	상품 재고: ${productInfo.p_Stock } <br>
	상품 카테고리: ${productInfo.c_Name } <br>
	상품 설명: ${productInfo.p_Intro } <br> 
	등록 날자: ${productInfo.p_Date } <br>
	
	<a href="<%=request.getContextPath()%>/">홈</a>
</body>
</html>