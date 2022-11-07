<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
</head>
<body>
	<div id="image" data-p_Id="${productInfo.imageList[0].p_Id}" data-path="${productInfo.imageList[0].filePath}" data-uuid="${productInfo.imageList[0].uuid}" data-filename="${productInfo.imageList[0].fileName}">
		<img>
	</div>	
	상품 번호: ${p_Id } <br>
	상품 이름: ${productInfo.p_Name } <br>
	상품 가격: ${productInfo.p_Price } <br>
	상품 재고: ${productInfo.p_Stock } <br>
	상품 카테고리: ${productInfo.c_Name } <br>
	상품 설명: ${productInfo.p_Intro } <br> 
	등록 날자: ${productInfo.p_Date } <br>
	<div class="button">
		<div class="button_quantity">
			주문수량
			<input type="text" class="quantity_input" value="1">
			<span>
				<button class="plus_btn">+</button>
			    <button class="minus_btn">-</button>
			</span>
		</div>
		<div class="button_set">
			<a class="btn_cart">장바구니 담기</a>
			<a class="btn_buy">바로구매</a>
		</div>
	</div>
	
	<div class="review_subject">
		<h2>리뷰</h2>
	</div>
	
	<div class="review_button_wrap">
		<button>리뷰 쓰기</button>
	</div>
	
	<div class="review_none">
	</div>
	
	<ul class="review_content_ul">	
	</ul>
	
	<div class="review_pageInfo">
		<ul class="paging">
		</ul>
	</div>
	
	<form action="<%=request.getContextPath()%>/member/order/${member.m_Id}" method="get" class="order_form">
		<input type="hidden" name="orders[0].p_Id" value="${productInfo.p_Id}">
		<input type="hidden" name="orders[0].p_Cnt" value="">
	</form>
	
	<a href="<%=request.getContextPath()%>/">홈</a>
	
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
			
			const p_Id = '${productInfo.p_Id}';
			$.getJSON("<%=request.getContextPath()%>/review/list", {p_Id : p_Id }, function(obj){
				makeReviewContent(obj);
			});
		});	
		
		let quantity = $(".quantity_input").val();
		$(".plus_btn").on("click", function(){
			$(".quantity_input").val(++quantity);
		});
		$(".minus_btn").on("click", function(){
			if(quantity > 1){
				$(".quantity_input").val(--quantity);
			}
		});
		
		const form = {
			m_Id : '${member.m_Id}',
			p_Id : '${productInfo.p_Id}',
			p_Cnt : ''
		}

		$(".btn_cart").on("click", function(e){
			form.p_Cnt = $(".quantity_input").val();
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/add',
				type: 'POST',
				data: form,
				success: function(result){
					if(result == '0'){
						alert("장바구니에 추가를 하지 못하였습니다.");
					} else if(result == '1'){
						alert("장바구니에 추가되었습니다.");
					} else if(result == '2'){
						alert("장바구니에 이미 추가되어져 있습니다.");
					} else if(result == '5'){
						alert("로그인이 필요합니다.");	
					}
				}
			})
		});
		
		function cartAlert(result){
			if(result == '0'){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == '1'){
				alert("장바구니에 추가되었습니다.");
			} else if(result == '2'){
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if(result == '5'){
				alert("로그인이 필요합니다.");	
			}
		}
		
		/* 바로구매 버튼 */
		$(".btn_buy").on("click", function(){
			let productCnt = $(".quantity_input").val();
			$(".order_form").find("input[name='orders[0].p_Cnt']").val(productCnt);
			$(".order_form").submit();
		});
		/* 리뷰 작성 */
		$(".review_button_wrap").on("click", function(e){
			e.preventDefault();			
			const m_Id = '${member.m_Id}';
			const p_Id = '${productInfo.p_Id}';
			$.ajax({
				data : {
					m_Id : m_Id,
					p_Id : p_Id
				},
				type : 'POST',
				url : '<%=request.getContextPath()%>/review/check',		
				success : function(result){
					if(result === '1'){
						alert("이미 등록된 리뷰가 존재 합니다.")
					} else if(result === '0'){
						let popUrl = "<%=request.getContextPath()%>/review/reviewEnroll/" + m_Id + "?p_Id=" + p_Id;
						console.log(popUrl);
						let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
						window.open(popUrl,"리뷰 쓰기",popOption);
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
		$(document).on('click', '.paging_btn a', function(e){
			e.preventDefault();
			let page = $(this).attr("href");
			criteria.pageNum = page;
			reviewListInit();
		});
		
		let reviewListInit = function(){
			$.getJSON("<%=request.getContextPath()%>/review/list", criteria , function(obj){
				makeReviewContent(obj);
			});	
		}
		
		/* 리뷰 페이징 */
		function makeReviewContent(obj){
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
				$(list).each ( function (i, obj) {
					review_list += '<li>';
					review_list += '<div class="comment_wrap">';
					review_list += '<div class="review_top">';
					/* 아이디 */
					review_list += '<span class="id_span">'+ obj.m_Id+'</span>&nbsp';
					/* 날짜 */
					review_list += '<span class="date_span">'+ obj.r_Date +'</span>&nbsp';
					/* 평점 */
					review_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.r_Rating +'</span>점</span>&nbsp';
					if(obj.m_Id === m_Id){
						review_list += '<a class="update_review_btn" href="'+ obj.r_Id +'">수정</a> | <a class="delete_review_btn" href="'+ obj.r_Id +'">삭제</a>';
					}
					review_list += '</div>';
					review_list += '<div class="review_bottom">';
					review_list += '<div class="review_bottom_txt">'+ obj.r_Content +'</div>';
					review_list += '</div>';
					review_list += '</div>';
					review_list += '</li>';
				});
				$(".review_content_ul").html(review_list);
				
				let review_paging = '';
				/* prev */
				if(pf.prev){
					let prev_num = pf.pageStart -1;
					review_paging += '<li class="paging_btn prev">';
					review_paging += '<a href="'+ prev_num +'">이전</a>';
					review_paging += '</li>';	
				}
				
				/* numbre btn */
				for(let i = pf.pageStart; i < pf.pageEnd + 1; i++){
					review_paging += '<li class="paging_btn ';
					if(pf.cri.pageNum === i){
						review_paging += 'active';
					}
					review_paging += '">';
					review_paging += '<a href="'+i+'">'+i+'</a>';
					review_paging += '</li>';
				}
				
				/* next */
				if(pf.next){
					let next_num = pf.pageEnd +1;
					review_paging += '<li class="paging_btn next">';
					review_paging += '<a href="'+ next_num +'">다음</a>';
					review_paging += '</li>';	
				}
				$(".paging").html(review_paging);	
			}
		}
	
		/* 리뷰 수정 */
		$(document).on('click', '.update_review_btn', function(e){
			e.preventDefault();
			let r_Id = $(this).attr("href");
			let popUrl = "<%=request.getContextPath()%>/review/reviewUpdate?r_Id=" + r_Id + "&p_Id=" + '${productInfo.p_Id}' + "&m_Id=" + '${member.m_Id}';	
			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"
			window.open(popUrl,"리뷰 수정",popOption);
		});
		
		/* 리뷰 삭제 */
		$(document).on('click', '.delete_review_btn', function(e){
			 e.preventDefault();
				let r_Id = $(this).attr("href");	
				
				$.ajax({
					data : {
						r_Id : r_Id,
						p_Id : '${productInfo.p_Id}'
					},
					url : '<%=request.getContextPath()%>/review/delete',
					type : 'POST',
					success : function(result){
						reviewListInit();
						alert('삭제되었습니다.');
				}
			});
		});
	</script>
</body>
</html>