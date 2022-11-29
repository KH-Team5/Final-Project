<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>리뷰 작성 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
</head>

<body>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="text-center">${productInfo.p_Name}</h2>
			<div class="rating_div form-group">
				<select name="rating" class="form-select">
					<option value="0.5">0.5</option>
					<option value="1.0">1.0</option>
					<option value="1.5">1.5</option>
					<option value="2.0">2.0</option>
					<option value="2.5">2.5</option>
					<option value="3.0">3.0</option>
					<option value="3.5">3.5</option>
					<option value="4.0">4.0</option>
					<option value="4.5">4.5</option>
					<option value="5.0">5.0</option>
				</select>
			</div>
			<br>
			<div class="form-group text-center">
				<textarea name="content" class="form-control">${reviewInfo.r_Content}</textarea>
			</div>
			<div>
				<button type="submit" style="text-decoration-line: none;" class="enroll_btn  btn btn-success">등록</button> <button type="submit" style="text-decoration-line: none;" class="cancel_btn btn btn-danger">취소</button>
			</div>
		</div>
	</section>
	
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>	
	<script>
		$(".cancel_btn").on("click", function(e){
			window.close();
		});	
		$(".enroll_btn").on("click", function(e){
			const p_Id = '${productInfo.p_Id}';
			const m_Id = '${m_Id}';
			const r_Rating = $("select").val();
			const r_Content = $("textarea").val();
			const data = {
					p_Id : p_Id,
					m_Id : m_Id,
					r_Content : r_Content,
					r_Rating : r_Rating
			}
			$.ajax({
				data : data,
				type : 'POST',
				url : '<%=request.getContextPath()%>/review',
				success : function(result){
					$(opener.location).attr("href", "javascript:reviewListInit();");
					window.close();
				}
			});
		})
	</script>
</body>
</html>