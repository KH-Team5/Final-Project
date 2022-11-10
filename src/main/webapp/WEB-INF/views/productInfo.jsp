<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/productInfo.css">
	<title>상품 상세 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="navbar.jsp" flush="true" />
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
					<div class="d-flex">
						<input class="quantity_input form-control text-center" id="inputQuantity" type="text" value="1"
							style="max-width: 3rem" />
						<div class="btn-group me-5" role="group">
							<button class="plus_btn btn btn-secondary">+</button>
							<button class="minus_btn btn btn-secondary">-</button>
						</div>
						<button class="btn_cart btn btn-outline-dark flex-shrink-0 me-3" type="button">
							장바구니 담기
						</button>
						<button class="btn_buy btn btn-outline-dark flex-shrink-0" type="button">
							바로구매
						</button>
					</div>
				</div>

			</div>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">리뷰</h2>
			<sec:authorize access="isAuthenticated()">
				<div class="review_button_wrap">
					<button class="btn btn-outline-dark">리뷰 쓰기</button>
					<br>
				</div>
			</sec:authorize>
			<div class="justify-content-center text-center">
				<div class="review_none">
				</div>
				<div class="review_content_ul mb-5">
				</div>		
				<div class="review_pageInfo d-flex justify-content-center">
					<ul class="paging pagination">
					</ul>
				</div>
			</div>
		</div>
	</section>
	<form action="<%=request.getContextPath()%>/member/order/${member.m_Id}" method="get" class="order_form">
		<input type="hidden" name="orders[0].p_Id" value="${productInfo.p_Id}">
		<input type="hidden" name="orders[0].p_Cnt" value="">
	</form>

	<jsp:include page="footer.jsp" flush="true" />
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function () {
			const imgView = $("#image");
			var imgChk = imgView.data("path");
			if (imgChk != "") {
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

			const p_Id = '${productInfo.p_Id}';
			$.getJSON("<%=request.getContextPath()%>/review/list", { p_Id: p_Id }, function (obj) {
				makeReviewContent(obj);
			});
		});

		let quantity = $(".quantity_input").val();
		$(".plus_btn").on("click", function () {
			$(".quantity_input").val(++quantity);
		});
		$(".minus_btn").on("click", function () {
			if (quantity > 1) {
				$(".quantity_input").val(--quantity);
			}
		});

		const form = {
			m_Id: '${member.m_Id}',
			p_Id: '${productInfo.p_Id}',
			p_Cnt: ''
		}

		$(".btn_cart").on("click", function (e) {
			form.p_Cnt = $(".quantity_input").val();
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/add',
				type: 'POST',
				data: form,
				success: function (result) {
					if (result == '0') {
						alert("장바구니에 추가를 하지 못하였습니다.");
					} else if (result == '1') {
						alert("장바구니에 추가되었습니다.");
					} else if (result == '2') {
						alert("장바구니에 이미 추가되어져 있습니다.");
					} else if (result == '5') {
						alert("로그인이 필요합니다.");
					}
				}
			})
		});

		function cartAlert(result) {
			if (result == '0') {
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if (result == '1') {
				alert("장바구니에 추가되었습니다.");
			} else if (result == '2') {
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if (result == '5') {
				alert("로그인이 필요합니다.");
			}
		}

		/* 바로구매 버튼 */
		$(".btn_buy").on("click", function () {
			let productCnt = $(".quantity_input").val();
			$(".order_form").find("input[name='orders[0].p_Cnt']").val(productCnt);
			$(".order_form").submit();
		});
		/* 리뷰 작성 */
		$(".review_button_wrap").on("click", function (e) {
			e.preventDefault();
			const m_Id = '${member.m_Id}';
			const p_Id = '${productInfo.p_Id}';
			$.ajax({
				data: {
					m_Id: m_Id,
					p_Id: p_Id
				},
				type: 'POST',
				url: '<%=request.getContextPath()%>/review/check',
				success: function (result) {
					if (result === '1') {
						alert("이미 등록된 리뷰가 존재 합니다.")
					} else if (result === '0') {
						let popUrl = "<%=request.getContextPath()%>/review/reviewEnroll/" + m_Id + "?p_Id=" + p_Id;
						console.log(popUrl);
						let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
						window.open(popUrl, "리뷰 쓰기", popOption);
					}
				}
			});
		});
		/* 페이징 설정 */
		const criteria = {
			p_Id: '${productInfo.p_Id}',
			pageNum: 1,
			amount: 10
		}
		/* 리뷰 최신화 */
		$(document).on('click', '.paging_btn a', function (e) {
			e.preventDefault();
			let page = $(this).attr("href");
			criteria.pageNum = page;
			reviewListInit();
		});

		let reviewListInit = function () {
			$.getJSON("<%=request.getContextPath()%>/review/list", criteria, function (obj) {
				makeReviewContent(obj);
			});
		}

		/* 리뷰 페이징 */
		function makeReviewContent(obj) {
			if (obj.list.length === 0) {
				$(".review_none").html('<span>리뷰가 없습니다.</span>');
				$(".review_content_ul").html('');
				$(".paging").html('');
			} else {
				$(".review_none").html('');
				const list = obj.list;
				const pf = obj.pageInfo;
				const m_Id = '${member.m_Id}';
				let review_list = '';
				$(list).each(function (i, obj) {
					review_list += '<div class="card h-100 border-secondary mb-3">';
					review_list += '<div class="card-header justify-content-center">';
					/* 아이디 */
					review_list += '<div class="id_span">' + obj.m_Id + '</div>';
					if (obj.m_Id === m_Id) {
						review_list += '<div class="d-flex" style="float: right"><a class="update_review_btn" href="' + obj.r_Id + '">수정</a> | <a class="delete_review_btn" href="' + obj.r_Id + '">삭제</a></div>';
					}
					review_list += '</div>';
					review_list += '<div class="card-subtitle">';
					/* 날짜 */
					review_list += '<span class="date_span">' + obj.r_Date + '</span><br>';
					/* 평점 */
					review_list += '<span class="rating_span">평점 : <span class="rating_value_span">' + obj.r_Rating + '</span>점</span>';
					review_list += '</div>';
					review_list += '<div class="card-body">';
					review_list += '<div class="card-text">' + obj.r_Content + '</div>';
					review_list += '</div>';
					review_list += '</div>';
				});
				$(".review_content_ul").html(review_list);

				let review_paging = '';
				/* prev */
				if (pf.prev) {
					let prev_num = pf.pageStart - 1;
					review_paging += '<li class="paging_btn prev page-item">';
					review_paging += '<a class="page-link" href="' + prev_num + '"><span aria-hidden="true">&laquo;</span></a>';
					review_paging += '</li>';
				}

				/* numbre btn */
				for (let i = pf.pageStart; i < pf.pageEnd + 1; i++) {
					review_paging += '<li class="paging_btn page-item';
					if (pf.cri.pageNum === i) {
						review_paging += 'active';
					}
					review_paging += '">';
					review_paging += '<a class="page-link" href="' + i + '">' + i + '</a>';
					review_paging += '</li>';
				}

				/* next */
				if (pf.next) {
					let next_num = pf.pageEnd + 1;
					review_paging += '<li class="page-item paging_btn next">';
					review_paging += '<a class="page-link" href="' + next_num + '"><span aria-hidden="true">&raquo;</span></a>';
					review_paging += '</li>';
				}
				$(".paging").html(review_paging);
			}
		}

		/* 리뷰 수정 */
		$(document).on('click', '.update_review_btn', function (e) {
			e.preventDefault();
			let r_Id = $(this).attr("href");
			let popUrl = "<%=request.getContextPath()%>/review/reviewUpdate?r_Id=" + r_Id + "&p_Id=" + '${productInfo.p_Id}' + "&m_Id=" + '${member.m_Id}';
			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"
			window.open(popUrl, "리뷰 수정", popOption);
		});

		/* 리뷰 삭제 */
		$(document).on('click', '.delete_review_btn', function (e) {
			e.preventDefault();
			let r_Id = $(this).attr("href");

			$.ajax({
				data: {
					r_Id: r_Id,
					p_Id: '${productInfo.p_Id}'
				},
				url: '<%=request.getContextPath()%>/review/delete',
				type: 'POST',
				success: function (result) {
					reviewListInit();
					alert('삭제되었습니다.');
				}
			});
		});
	</script>
</body>

</html>