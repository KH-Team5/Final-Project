<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
</head>
<body>
	<div class="wrapper_div">
		<div class="subject_div">
			리뷰 수정
		</div>
	</div>
	<div class="input_wrap">			
		<div class="p_Name_div">
			<h2>${productInfo.p_Name}</h2>
		</div>
		<div class="rating_div">
			<h4>평점</h4>
			<select name="rating">
				<option value="0.5">0.5</option>
				<option value="1.0">1.0</option>
				<option value="1.5">1.5</option>
				<option value="2.0">2.0</option>
				<option value="2.5">2.5</option>
				<option value="3.0">3.0</option>
				<option value="3.5">3.5</option>
				<option value="4.0">4.0</option>
			</select>
		</div>
		<div class="content_div">
			<h4>리뷰</h4>
			<textarea name="content">
				${reviewInfo.r_Content}
			</textarea>
		</div>
	</div>
	<div class="btn_wrap">
		<a class="cancel_btn">취소</a><a class="update_btn">수정</a>
	</div>
	
	<script>
		$(function(){
			let r_Rating = '${reviewInfo.r_Rating}';
			$("option").each(function(i,obj){
				if(r_Rating === $(obj).val())
					$(obj).attr("selected", "selected");
				
			});
		});
		
		$(".cancel_btn").on("click", function(e){
			window.close();
		});
		
		$(".update_btn").on("click", function(e){
			const r_Id = '${reviewInfo.r_Id}';
			const p_Id = '${reviewInfo.p_Id}';
			const m_Id = '${m_Id}';
			const r_Rating = $("select").val();
			const r_Content = $("textarea").val();
			const data = {
					r_Id: r_Id,
					p_Id: p_Id,
					m_Id: m_Id,
					r_Rating: r_Rating,
					r_Content: r_Content
			}
			
			$.ajax({
				data : data,
				type : 'POST',
				url : '<%=request.getContextPath()%>/review/update',
				success : function(result){
					$(opener.location).attr("href", "javascript:reviewListInit();");
					window.close();
				}			
			});	
		});
	</script>
</body>
</html>