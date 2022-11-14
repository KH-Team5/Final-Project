<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/search.css">
	<title>search page</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="navbar.jsp" flush="true"/>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:if test="${listcheck != 'empty'}">
					<c:forEach var="list" items="${list}" >
						<div class="col mb-5">
							<div class="card h-100"  data-pid="${list.imageList[0].p_Id}" data-path="${list.imageList[0].filePath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
		   						<!-- Product image-->
		   						<a href="<%=request.getContextPath()%>/productInfo/${list.p_Id}">
		   							<img class="card-img-top img-thumbnail img-responsive"	style="height: 280px"/>
		   						</a>
		   						<!-- Product details-->
		   						<div class="card-body p-4">
		   							<div class="text-center">
		   								<!-- Product name-->
		   								<h5 class="fw-bolder">${list.p_Name}</h5>
		   								<!-- Product reviews-->
		   								<div class="d-flex justify-content-center small text-warning mb-2">
		   									${list.p_RatingAvg}
		    							</div>
		    							<!-- Product category-->
		   								${list.c_Name}
		   								<br>
		   								<!-- Product price-->
		   								<fmt:formatNumber value="${list.p_Price}" pattern="#,### 원" />
		   							</div>
		   						</div>
		   					</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${listCheck == 'empty'}">
					<div id="table_empty">
							등록된 상품이 없습니다.
					</div>
				</c:if>
			</div>
		</div>
	</section>
	
	
   	<!-- 페이징 -->
   	<div class="d-flex justify-content-center" id="paging_wrap">
   		<ul class="pagination" id="paging">
   			<c:if test="${paging.prev }">
   				<li class="page-item" id="prev_btn">
   					<a class="page-link" href="${paging.pageStart -1 }">
						<span aria-hidden="true">&laquo;</span>
					</a>
   				</li>
   			</c:if>
   			
   			<c:forEach begin="${paging.pageStart }" end="${paging.pageEnd }" var="num">
   				<li class="page-item paging_btn ${paging.cri.pageNum == num ? 'active':''}">
   					<a class="page-link" href="${num }">
   						${num }
   					</a>
   				</li>
   			</c:forEach>
   			
			<c:if test="${paging.next }">
				<li class="page-item" id="next_btn">
					<a class="page-link" href="${paging.pageEnd + 1 }">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<form id="moveForm" action="<%=request.getContextPath()%>/search" method="get" >
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
		<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		<input type="hidden" name="c_Code" value="${paging.cri.c_Code}">
		<input type="hidden" name="type" value="${paging.cri.type}">
	</form>	
	<jsp:include page="footer.jsp" flush="true" />
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		/* 페이징 */
		let search = $('#search');
		let amount = "${paging.cri.amount }";
		$(function(){
			if(amount == '')
				$('.paging_btn').css('display','none');
			const selectedType = '<c:out value="${paging.cri.type}"/>';
			if(selectedType != ""){
				moveForm.find("input[name='type']").val(selectedType);	
			}
		});
		
 		$("#search button").on("click", function(e){
			e.preventDefault();
			if(amount == '')
				search.find("input[name='amount']").val("12");
			search.find("input[name='pageNum']").val("1");
			search.submit();
		});
 		
 		const moveForm = $('#moveForm');	
 		$(".paging_btn a").on("click", function(e){
 			e.preventDefault();
 			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
 			moveForm.submit();	
 		});	
 		
 		/* 이미지 */
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