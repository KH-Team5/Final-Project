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
		상품 이름: <input id="p_Name" name="p_Name" type="text"> <br>
		<span id="nameCheck"></span>
		상품 가격: <input id="p_Price" name="p_Price" type="number"> <br>
		<span id="priceCheck"></span>
		상품 재고: <input id="p_Stock" name="p_Stock" type="number"> <br> 
		<span id="stockCheck"></span>
		상품 카테고리: 
		<div id="category">
			<span>대분류</span>
			<select id="mainCategory">
				<option selected value="none">선택</option>
			</select>
			<span>소분류</span>
			<select id="subCategory" name="p_Category">
				<option selected value="none">선택</option>
			</select>
		</div> 
		<span id="categoryCheck"></span>
		<button id="regBtn">등록</button>
	</form>
	<a href="<%=request.getContextPath()%>/">홈</a>
	
	<script>
		let categoryList = JSON.parse('${categoryList}');
		let mainCategoryArr = new Array();
		let subCategoryArr = new Array();
		
		let mainCategoryObj = new Object();
		let subCategoryObj = new Object();
		
		let mainCategory = $("#mainCategory");
		let subCategory = $("#subCategory");
		
		function makeCategoryArray(obj, array, categoryList, tier){
			for(let i = 0; i < categoryList.length; i++){
				if(categoryList[i].c_Tier === tier){
					obj = new Object();
					obj.c_Name = categoryList[i].c_Name;
					obj.c_Code = categoryList[i].c_Code;
					obj.c_Parent = categoryList[i].c_Parent;
					array.push(obj);				
				}
			}
		}
		
		makeCategoryArray(mainCategoryObj, mainCategoryArr, categoryList, 1);
		makeCategoryArray(subCategoryObj, subCategoryArr, categoryList, 2);

		for(let i = 0; i < mainCategoryArr.length; i++){
			mainCategory.append("<option value='"+mainCategoryArr[i].c_Code+"'>" + mainCategoryArr[i].c_Name + "</option>");
		}
		
		$(mainCategory).on("change",function(){
			let selectVal = $(this).find("option:selected").val();	
			subCategory.children().remove();
			subCategory.append("<option value='none'>선택</option>")
			for(let i = 0; i < subCategoryArr.length; i++){
				if(selectVal === subCategoryArr[i].c_Parent){
					subCategory.append("<option value='"+subCategoryArr[i].c_Code+"'>" + subCategoryArr[i].c_Name + "</option>");	
				}
			}
		});
		
		let regform = $("#regform")
		$("#regBtn").on("click",function(){
			let nameCheck = false;
			let priceCheck = false;
			let stockCheck = false;
			let categoryCheck = false;
			
			let name = $('#p_Name').val();
			let price = $('#p_Price').val();
			let stock = $('#p_Stock').val();
			let category = $("select[name='p_Category']").val();
			
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
			if(category == 'none') {
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