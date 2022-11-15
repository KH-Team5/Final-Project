<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/productInfo.css">
	<title>상품 상세 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<style>
nav{
height:100px;
}
.navbar-brand{
position:relative;
font-size: xx-large;
}
ul{
position:relative;
left: 38%;
}
/* #one{  /* 상품수정 */
position: relative;
bottom:80px;
left:52%;
}
#two{
position:relative;
bottom:118px;
left:58%;
} */
 .buttons{
 position:relative;
bottom:118px;
left:58%;
width:150px;
height:50px;
} 

</style>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><b>상품상세정보 페이지</a></b>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/" style="color: white">홈페이지 로고
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
      </ul>
     
  </div>
</nav>


	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">

				<div class="col-md-6" id="image" data-p_Id="${productInfo.imageList[0].p_Id}"
					data-path="${productInfo.imageList[0].filePath}" data-uuid="${productInfo.imageList[0].uuid}"
					data-filename="${productInfo.imageList[0].fileName}">
					<img class="card-img-top mb-5 mb-md-0" />
				</div>

				<div class="col-md-6">

					<div class="small mb-1">${productInfo.c_Name }</div>
					<h1 class="display-5 fw-bolder">${productInfo.p_Name }</h1>
					<div class="fs-5 mb-5">
						<fmt:formatNumber value="${productInfo.p_Price }" pattern="#,### 원"/><br>
						<span>남은 수량:${productInfo.p_Stock }</span>
					</div>
					<div class="fs-5 mb-5">
						<span>${productInfo.p_RatingAvg }</span>
					</div>
					<p class="lead">${productInfo.p_Intro }</p>

					<div class="d-flex button">

				
						
				</div>

			</div>
		</div>
	</section>

	<form action="<%=request.getContextPath()%>/member/order/${member.m_Id}" method="get" class="order_form">
		<input type="hidden" name="orders[0].p_Id" value="${productInfo.p_Id}">
		<input type="hidden" name="orders[0].p_Cnt" value="">
	</form>

	<%-- <jsp:include page="<%=request.getContextPath()%>/view/footer.jsp" flush="true" /> --%>
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	
	
	
	<tr>
       <td class="buttons" colspan="2">
       <div class = "button_a" id="one">
       <button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/admin/productModify/${p_Id}'" >상품수정</a>
       </div>
       <div class = "button_b" id="two">
       <button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/admin/productDelete/${p_Id}'" >상품삭제</a>
      </div>
      </td>
      </tr>
	
	
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
	
	
	
	
	<script>
function agreeDelete() {
	alert("상품을 삭제 하시겠습니까?");
}
function agreeModify(){
	alert("상품정보를 수정하시겠습니까?")
}
</script>
</body>
</html>