<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>상품등록 페이지</h1>
	<form action="<%= request.getContextPath()%>/admin/productRegistration" id="regform" name="regform" method="post">
		상품 이름: <input id="P_name" name="P_name" type="text"> <br>
		<span id="nameCheck"></span>
		상품 가격: <input id="P_price" name="P_price" type="number"> <br>
		<span id="priceCheck"></span>
		상품 재고: <input id="P_stock" name="P_stock" type="number"> <br> 
		<span id="stockCheck"></span>
		상품 카테고리: <input id="P_category" name="P_category" type="text"> <br>
		<span id="categoryCheck"></span>
		<button id="regBtn">등록</button>
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	<script>
		let regform = $("#regform")
		$("#regBtn").on("click",function(){
			let nameCheck = false;
			let priceCheck = false;
			let stockCheck = false;
			let categoryCheck = false;
			
			let name = $('#P_name').val();
			let price = $('#P_price').val();
			let stock = $('#P_stock').val();
			let category = $('#P_category').val();
			
			if(name == "") {
	            $('#nameCheck').html("필수 항목입니다." + "<br>");
	            nameCheck = false;
	        } else {
	            $('#nameCheck').html("");
	            nameCheck = true;
	        }
			if(price == "") {
	            $('#priceCheck').html("필수 항목입니다." + "<br>");
	            priceCheck = false;
	        } else {
	            $('#priceCheck').html("");
	            priceCheck = true;
	        }
			if(stock == "") {
	            $('#stockCheck').html("필수 항목입니다." + "<br>");
	            stockCheck = false;
	        } else {
	            $('#stockCheck').html("");
	            stockCheck = true;
	        }
			if(category == "") {
	            $('#categoryCheck').html("필수 항목입니다." + "<br>");;
	            categoryCheck = false;
	        } else {
	            $('#categoryCheck').html("");
	            categoryCheck = true;
	        }
			
			if(nameCheck && priceCheck && stockCheck && categoryCheck)
				regform.submit();
			else
				return false;
		});
	</script>
</body>
</html>