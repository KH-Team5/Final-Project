<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" 
	
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<title>main page</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="navbar.jsp" flush="true" />
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">KH 쇼핑몰</h1>
				
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${productInfo}" var="pi">
					<div class="col mb-5">
						<div class="card h-100"  data-pid="${pi.imageList[0].p_Id}" data-path="${pi.imageList[0].filePath}" data-uuid="${pi.imageList[0].uuid}" data-filename="${pi.imageList[0].fileName}">
	   						<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기</div>
	   						<!-- Product image-->
	   						<img class="card-img-top img-thumbnail img-responsive"	style="height: 280px"/>
	   						<!-- Product details-->
	   						<div class="card-body p-4">
	   							<div class="text-center">
	   								<!-- Product name-->
	   								<h5 class="fw-bolder">${pi.p_Name}</h5>
	   								<!-- Product reviews-->
	   								<div class="d-flex justify-content-center small text-warning mb-2">
	   									${pi.p_RatingAvg}
	    							</div>
	    							<!-- Product category-->
	   								${pi.c_Name}
	   								<br>
	   								<!-- Product price-->
	   								<fmt:formatNumber value="${pi.p_Price}" pattern="#,### 원" />
	   							</div>
	   						</div>
	   						<!-- Product actions-->
	   						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	   							<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/productInfo/${pi.p_Id}">상세보기</a></div>
	   						</div>
	   					</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" flush="true" />
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		$(".card").each(function(i, obj){
			const bobj = $(obj);
			if(bobj.data("pid")){
				const path = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				const uploadPath = encodeURIComponent(path + "/s_" + fileName);
				$(this).find("img").attr('src', '<%=request.getContextPath()%>/display?fileName=' + uploadPath);
			} else {
				$(this).find("img").attr("이미지 없음");
			}
		});
	</script>
</body>
</html>