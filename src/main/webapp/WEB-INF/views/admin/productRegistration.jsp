<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
<style>
	#regform span{
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<h1>상품등록 페이지</h1>
	<form action="<%= request.getContextPath()%>/admin/productRegistration" id="regform" name="regform" method="post">
		상품 이름: <input id="P_name" name="P_name" type="text"> <br>
		<span id="nameCheck">상품 이름을 입력해주세요.</span> <br>
		상품 가격: <input id="P_price" name="P_price" type="number"> <br>
		<span id="priceCheck">상품 가격을 입력해주세요.</span> <br>
		상품 재고: <input id="P_stock" name="P_stock" type="number"> <br> 
		<span id="stockCheck">상품 재고를 입력해주세요.</span> <br>
		상품 카테고리: <input id="P_category" name="P_category" type="text"> <br>
		<span id="categoryCheck">상품 카테고리를 입력해주세요.</span> <br>
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
	            $('#nameCheck').css('display','inline-block');
	            nameCheck = false;
	        } else {
	            $('#nameCheck').css('display', 'none');
	            nameCheck = true;
	        }
			if(price == "") {
	            $('#priceCheck').css('display','inline-block');
	            priceCheck = false;
	        } else {
	            $('#priceCheck').css('display', 'none');
	            priceCheck = true;
	        }
			if(stock == "") {
	            $('#stockCheck').css('display','inline-block');
	            stockCheck = false;
	        } else {
	            $('#stockCheck').css('display', 'none');
	            stockCheck = true;
	        }
			if(category == "") {
	            $('#categoryCheck').css('display','inline-block');
	            categoryCheck = false;
	        } else {
	            $('#categoryCheck').css('display', 'none');
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