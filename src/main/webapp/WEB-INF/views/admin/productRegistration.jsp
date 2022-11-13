<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 
<title>상품등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/classic/ckeditor.js"></script>
<style>

#one{
position: absolute;
top:2%;
left:50%;
font-color:#white;
}
.form-group {
position: absolute;
top:11%;
left:20%;
width: 60%;
}

input{
width:300px;
height:30px;
}

#regBtn{
position: absolute;
top: 67%;
right:20%;
width:100px;
height:45px;
}
</style>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<table class="table table-hover">
    <tbody>
    <tr class="table-dark">
	<th scope="row" ><h1>상품등록 페이지</h1></th>
	 </tr>
  </tbody>
  </table>
  
	<form action="<%= request.getContextPath()%>/admin/productRegistration" id="regform" name="regform" method="post">
		
		<fieldset>
		
		<div class="form-group">
		<label for="exampleInputEmail1" class="form-label mt-4">상품 이름:</label><br>
		     <input type="email" class="from-control" id="p_Name" name="p_Name" type="text" placeholder="상품이름 입력">  <br> 
		     		<span id="nameCheck"></span>
			<label for="exampleInputEmail1" class="form-label mt-4">상품 가격:</label><br>
		 <input type="email" class="from-control id="p_Price" name="p_Price" type="number" placeholder="숫자만 입력"> <br>
		<span id="priceCheck"></span>
		<label for="exampleInputEmail1" class="form-label mt-4">상품 재고:</label><br> 
		<input type="email" class="from-control id="p_Stock" name="p_Stock" type="number" placeholder="숫자만 입력"> <br> 
		<span id="stockCheck"></span>
		<label for="exampleInputEmail1" class="form-label mt-4">상품 카테고리:</label><br> 
		<div id="category">
			<span>대분류</span>
			<select id="mainCategory">
				<option selected value="none">선택</option>
			</select>
			&nbsp;&nbsp;&nbsp;<span>소분류</span>
			<select id="subCategory" name="p_Category">
				<option selected value="none">선택</option>
			</select>
		</div> 
		<span id="categoryCheck"></span>
		<div id="intro">
			<label for="exampleInputEmail1" class="form-label mt-4">상품 설명:</label><br> 
			<div id="test1">  <textarea id="p_Intro" name="p_Intro"></textarea></div>
			<span id="introChk"></span>
		</div>
		<label for="exampleInputEmail1" class="form-label mt-4">상품 이미지:</label><br> <input type="file" multiple="multiple" id ="imageFile" name="imageFile"> <br>
		<div id="uploadResult">
		</div>
		</div>
		</fieldset>
		<button type="button" class="btn btn-dark" id="regBtn" >등록</button>
	</form>
	<div class = "button_home" id="one">
	<a href="<%=request.getContextPath()%>/" style="color: white">홈페이지로고</a>
	</div>
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
		
		ClassicEditor
		.create(document.querySelector('#p_Intro'));
		
		let regform = $("#regform")
		$("#regBtn").on("click",function(){
			let nameCheck = false;
			let priceCheck = false;
			let stockCheck = false;
			let categoryCheck = false;
			let introChk = false;
			let name = $('#p_Name').val();
			let price = $('#p_Price').val();
			let stock = $('#p_Stock').val();
			let category = $("select[name='p_Category']").val();
			let intro = $("#intro p").html();
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
			if(intro == '<br data-cke-filler="true">') {
	            $('#introChk').html("필수 항목입니다." + "<br>");
	            introChk = false;
	        } else {
	            $('#introChk').html("");
	            introChk = true;
	        }
			if(nameCheck && priceCheck && stockCheck && categoryCheck && introChk) {
				regform.submit();
			}	
			else
				return false;
		});
		
		$("input[type='file']").on("change", function(e){
			if($("#imgDeleteBtn").length > 0){
				deleteFile();
			}
			let formData = new FormData();
			let fileInput = $('input[name="imageFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			if(!fileCheck(fileObj.name, fileObj.size))
				return false;
			for(let i = 0; i < fileList.length; i++){
				formData.append("imageFile", fileList[i]);
			}
			$.ajax({
				url: "<%=request.getContextPath()%>/admin/productRegistration/fileUpload",
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json',
		    	success : function(result){
			    	showUploadImage(result);
			    },
			    error : function(result){
			    	alert("이미지 파일이 아닙니다.");
		    	}
			});
		});
		
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB
		
		function fileCheck(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}			
			return true;					
		}
		
		function showUploadImage(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			let uploadResult = $("#uploadResult");
			let obj = uploadResultArr[0];
			let str = "";
			let uploadPath = encodeURIComponent(obj.filePath + "/s_" + obj.fileName);
			str += "<div id='result_card'>";
			str += "<img src='<%=request.getContextPath()%>/display?fileName=" + uploadPath +"'>";
			str += "<div id='imgDeleteBtn' data-file='" + uploadPath + "'>삭제</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].filePath' value='"+ obj.filePath +"'>";
			str += "</div>";
			uploadResult.append(str); 
		}
		
		$("#uploadResult").on("click", "#imgDeleteBtn", function(e){
			deleteFile();
		});
		
		function deleteFile(){
			let targetFile = $("#imgDeleteBtn").data("file");
			let targetImage = $("#result_card");
			$.ajax({
				url: '<%=request.getContextPath()%>/admin/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					targetImage.remove();
					$("input[type='file']").val("");
				},
				error : function(result){
					console.log(result);
					alert("파일을 삭제하지 못하였습니다.")
				}
	       });
		}
	</script>
</body>
</html>