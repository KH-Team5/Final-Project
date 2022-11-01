<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>

<body>
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
	
	<a href="<%=request.getContextPath()%>/">홈</a>
<script>
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
		M_id : '${member.M_id}',
		P_id : '${productInfo.p_Id}',
		C_qty : ''
}

$(".btn_cart").on("click", function(e){

});

$(".btn_cart").on("click", function(e){
	form.C_qty = $(".quantity_input").val();
	$.ajax({
		url: '/cart/add',
		type: 'POST',
		data: form,
		success: function(result){
			cartAlert(result);
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

</script>
</body>
</html>