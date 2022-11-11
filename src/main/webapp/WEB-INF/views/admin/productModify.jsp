<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
 <form id="regform" name="modifyform" method="post"> 
   	<%-- <form action="<%= request.getContextPath()%>/admin/adminProductInfo/{p_Id}" id="regform" name="regform" method="post">
 --%>   
이미지변경: <input type="file" multiple="multiple" id ="imageFile" name="imageFile"> <br>
		<div id="uploadResult">
		</div>

                  
	상품번호: ${productInfo.p_Id} <br>
      
      상품명: ${productInfo.p_Name} <br>
      상품명 수정:<input id="p_Name" name="p_Name" type="text"><br>
    <span id="nameCheck"></span>
      
      상품가격: ${productInfo.p_Price} <br>
      상품가격 수정:<input id="p_Price" name="p_Price" type="text"><br>
    <span id="priceCheck"></span>  
      
      상품재고수량: ${productInfo.p_Stock} <br>
      상품재고수량 수정:<input id="p_Stock" name="p_Stock" type="text"><br>
    <span id="stockCheck"></span>   
   
	상품카테고리:${productInfo.c_Name} <br>    
       상품카테고리 수정: 
		
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
		 

      상품설명: ${productInfo.p_Intro} <br>
      상품설명 수정:<input id="p_Intro" name="p_Intro" type="text"><br>
    <span id="introChk"></span>  
      
      <%-- 상품등록일: ${productInfo.p_Date} <br>
      상품등록일 수정:<input id="p_Date" name="p_Date" type="text"><br> --%>
   
             
      <button id="regBtn">정보수정</button>
  <input type="hidden" id="p_id" name="p_id" value="${productInfo.p_Id}">
   </form>
   <a href="<%=request.getContextPath()%>/">홈</a>
   <script>
       function modify(){
        alert("상품정보가 변경되었습니다.");
       $("#regform").submit();
       
       }
      </script>
      

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
			
			 alert("상품정보가 변경되었습니다.");
		     
		       
			
		});
   		
   		
   		
   		</script>
	<script>
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
			
				url: "<%=request.getContextPath()%>/admin/productModify/"+$("p_id").val()+"/fileUpload",
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
				/*  */// imgView.find("img").attr('src', '');
			
			
   		
			}
		});
   		
   </script>
   
   
</body>
</html>