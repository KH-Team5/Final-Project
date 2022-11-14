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
<title>장바구니 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<div class="all_check_input_div">
			<input type="checkbox" class="all_check_input" name="selectall" checked="checked"><span class="all_chcek_span">전체선택</span>
		</div>
		<table class="subject_table">
			<tbody>
				<tr>
					<th></th>
					<th></th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
			</tbody>
		</table>
		
		<table class="cart_table">
			<tbody>
				<c:forEach items="${cartInfo}" var="ci">
					<tr>
						<td class="cart_info_td">
							<input type="checkbox" name="check" class="cart_checkbox" checked="checked">
							<input type="hidden" class="p_Price_input" value="${ci.p_Price}">
							<input type="hidden" class="p_Cnt_input" value="${ci.p_Cnt}">
							<input type="hidden" class="totalPrice_input" value="${ci.p_Price * ci.p_Cnt}">
							<input type="hidden" class="p_Id_input" value="${ci.p_Id}">
						</td>
						<td>
							<div class="image_wrap" data-pid="${ci.imageList[0].p_Id}" data-path="${ci.imageList[0].filePath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}">
								<img>
							</div>
						</td>
						<td>${ci.p_Name}</td>
						<td>
							개당 가격 : <fmt:formatNumber value="${ci.p_Price}" pattern="#,### 원" /><br>
							총 가격 : <span><fmt:formatNumber value="${ci.totalPrice}" pattern="#,### 원" /></span><br>
						</td>
						<td>
							수량
							<div>
								<input type="number" value="${ci.p_Cnt}" id="quantity_input">	
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</div>
							<a class="quantity_change_btn" data-cid="${ci.ca_Id}">변경</a>
						</td>
						<td>
							<fmt:formatNumber value="${ci.p_Price * ci.p_Cnt}" pattern="#,### 원" />
						</td>
						<td><button class="delete_btn" data-caid="${ci.ca_Id}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="list_table">
		</table>
	</div>
	<div>
		<div>
			<table>
				<tr>
					<td>
						<table>
							<tr>
								<td>총 상품 가격</td>
								<td>
									<span class="totalPrice_span"></span> 원
								</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>
									<span class="delivery_price"></span>원
								</td>
							</tr>									
							<tr>
								<td>총 주문 상품수</td>
								<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>개</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>							
					</td>
				</tr>
			</table>
			<div class="boundary_div"></div>
			<table>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td>
										<strong>총 결제 금액</strong>
									</td>
									<td>
										<span class="finalTotalPrice_span"></span> 원
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
		<div class="content_btn_section">
			<a id="order_btn">주문하기</a>
		</div>
	</div>
	
	<form action="<%=request.getContextPath()%>/cart/update" method="post" class="quantity_update_form">
		<input type="hidden" name="ca_Id" class="update_ca_Id">
		<input type="hidden" name="p_Cnt" class="update_p_Cnt">
		<input type="hidden" name="m_Id" value="${m_Id}">
	</form>
	<form action="<%=request.getContextPath()%>/cart/delete" method="post" class="quantity_delete_form">
		<input type="hidden" name="ca_Id" class="delete_ca_Id">
		<input type="hidden" name="m_Id" value="${m_Id}">
	</form>
	<!-- 주문 form -->
	<form action="<%=request.getContextPath()%>/member/order/${m_Id}" method="get" class="order_form">
		
	</form>
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			setTotalInfo();
		});
		
		function setTotalInfo(){
			let totalPrice = 0;
			let totalCount = 0;
			let totalKind = 0;
			let deliveryPrice = 0;
			let finalTotalPrice = 0; 
			$(".cart_info_td").each(function(index, element){
				if($(element).find(".cart_checkbox").is(":checked") === true){
					totalPrice += parseInt($(element).find(".totalPrice_input").val());
					totalCount += parseInt($(element).find(".p_Cnt_input").val());
					totalKind += 1;
				}
			});
			if(totalPrice >= 30000)
				deliveryPrice = 0;
			else if(totalPrice == 0)
				deliveryPrice = 0;
			else 
				deliveryPrice = 3000;
			finalTotalPrice = totalPrice + deliveryPrice;
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			$(".totalCount_span").text(totalCount);
			$(".totalKind_span").text(totalKind);
			$(".delivery_price").text(deliveryPrice);	
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		}
		
		$(".cart_checkbox").on("change", function(){
			// 전체 체크박스
			const checkboxes = document.querySelectorAll('input[name="check"]');
			// 선택된 체크박스
			const checked = document.querySelectorAll('input[name="check"]:checked');
			// select all 체크박스
			const selectAll = document.querySelector('input[name="selectall"]');
			if(checkboxes.length === checked.length)
				selectAll.checked = true;
			else
				selectAll.checked = false;
			setTotalInfo($(".cart_info_td"));
		});
		
		$(".all_check_input").on("click", function(){
			selectAll(this);
			setTotalInfo($(".cart_info_td"));
		});
		
		function selectAll(selectAll)  {
			const checkboxes = document.querySelectorAll('input[name="check"]');
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = selectAll.checked
			})
		}
		
		$(".image_wrap").each(function(i, obj){
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
		
		$(".plus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		
		$(".minus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			if(quantity > 1){
				$(this).parent("div").find("input").val(--quantity);		
			}
		});
		
		$(".quantity_change_btn").on("click", function(){
			let ca_Id = $(this).data("cid");
			let p_Cnt = $(this).parent("td").find("input").val();
			$(".update_ca_Id").val(ca_Id);
			$(".update_p_Cnt").val(p_Cnt);
			$(".quantity_update_form").submit();
		});
		
		$(".delete_btn").on("click", function(e){
			e.preventDefault();
			const ca_Id = $(this).data("caid");
			$(".delete_ca_Id").val(ca_Id);
			$(".quantity_delete_form").submit();
		});
		
		$("#order_btn").on("click", function(){
			let form_contents ='';
			let orderNumber = 0;
			$(".cart_info_td").each(function(index, element){
				if($(element).find(".cart_checkbox").is(":checked") === true){
					let p_Id = $(element).find(".p_Id_input").val();
					let p_Cnt = $(element).find(".p_Cnt_input").val();
					
					let p_Id_input = "<input name='orders[" + orderNumber + "].p_Id' type='hidden' value='" + p_Id + "'>";
					form_contents += p_Id_input;
					let p_Cnt_input = "<input name='orders[" + orderNumber + "].p_Cnt' type='hidden' value='" + p_Cnt + "'>";
					form_contents += p_Cnt_input;
					orderNumber += 1;
				}
			});
			if (orderNumber != 0){
				$(".order_form").html(form_contents);
				$(".order_form").submit();
			} else
				alert("선택한 상품이 없습니다")
		});
	</script>
</body>
</html>