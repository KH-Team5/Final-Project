<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.addressInfo_input_div{
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous">
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="member_info_div">
		주문자
		<span>${memberInfo.m_name} | ${memberInfo.email}</span>
	</div>
	<div class="addressInfo_div">
		<div class="addressInfo_button_div">
			<button class="address_btn address_btn_1" onclick="showAdress('1')">사용자 정보 주소록</button>
			<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
		</div>
		<div class="addressInfo_input_div_wrap">
			<div class="addressInfo_input_div addressInfo_input_div_1">
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								${memberInfo.m_name}
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								${memberInfo.address}<br>${memberInfo.detail_address}<br>${memberInfo.zipcode}
								<input class="selectAddress" value="T" type="hidden">
								<input class="m_Name_input" value="${memberInfo.m_name}" type="hidden">
								<input class="address_input" type="hidden" value="${memberInfo.address}">
								<input class="detail_address_input" type="hidden" value="${memberInfo.detail_address}">
								<input class="zipcode_input" type="hidden" value="${memberInfo.zipcode}">								
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="addressInfo_input_div addressInfo_input_div_2">
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input class="m_Name_input">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input class="selectAddress" value="F" type="hidden">
								<a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a> <br>
								<input class="address_input" readonly="readonly"> <br>
								상세주소
								<input class="detail_address_input" readonly="readonly"><br>
								우편번호
								<input class="zipcode_input" readonly="readonly">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="orderGoods_div">
		<!-- 상품 테이블 -->
		<table class="goods_subject_table">
			<tbody>
				<tr>
					<th>이미지</th>
					<th>상품 이름</th>
					<th>판매가</th>
				</tr>
			</tbody>
		</table>
		<table class="goods_table">				
			<tbody>
				<c:forEach items="${orderList}" var="ol">
					<tr>
						<td>
							<div id="image" data-p_Id="${ol.imageList[0].p_Id}" data-path="${ol.imageList[0].filePath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
								<img>
							</div>	
						</td>
						<td>${ol.p_Name}</td>
						<td class="goods_table_price_td">
							<fmt:formatNumber value="${ol.p_Price}" pattern="#,### 원" /> | 수량 ${ol.p_Cnt}개
							<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
							<br>
							<input type="hidden" class="individual_p_Price_input" value="${ol.p_Price}">
							<input type="hidden" class="individual_p_Cnt_input" value="${ol.p_Cnt}">
							<input type="hidden" class="individual_totalPrice_input" value="${ol.p_Price * ol.p_Cnt}">
							<input type="hidden" class="individual_p_Id_input" value="${ol.p_Id}">
						</td>
					</tr>							
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="total_info_div">
		<div class="total_info_price_div">
			<strong class="price_span_label total_price_label">최종 결제 금액</strong>
			<strong class="strong_red">
				<span class="total_price_red finalTotalPrice_span"></span>
			</strong>
		</div>
		<div class="total_info_btn_div">
			<a class="order_btn">결제하기</a>
		</div>
	</div>
	
	<!-- 주문 요청 form -->
	<form class="order_form" action="<%=request.getContextPath()%>/member/order" method="post">
		<input name="m_id" value="${memberInfo.m_id}" type="hidden">
		<input name="m_Name" type="hidden">
		<input name="o_address" type="hidden">
		<input name="o_detail_address" type="hidden">
		<input name="o_Zipcode" type="hidden">
	</form>
	
	<script>
		$(function(){
			setTotalInfo();
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
		function showAdress(className){
			$(".addressInfo_input_div").css('display', 'none');
			$(".addressInfo_input_div_" + className).css('display', 'block');
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");
		}
		
		function execution_daum_address(){
			new daum.Postcode({
				oncomplete: function(data) {
	                var addr = '';
	                var extraAddr = '';
	                if (data.userSelectedType === 'R')
	                    addr = data.roadAddress;
	                else
	                    addr = data.jibunAddress;
	                
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
	                        extraAddr += data.bname;
	                    if(data.buildingName !== '' && data.apartment === 'Y')
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    if(extraAddr !== '')
	                        extraAddr = ' (' + extraAddr + ')';
						addr += extraAddr;
	                } else 
						addr += ' ';
	                $(".zipcode_input").val(data.zonecode);
	                $(".address_input").val(addr);				
	                $(".detail_address_input").attr("readonly", false);
	                $(".detail_address_input").focus();	 
		        }
		    }).open();  	
		}
		
		function setTotalInfo(){
			let totalPrice = 0;	
			$(".goods_table_price_td").each(function(index, element){
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			});
			$(".finalTotalPrice_span").text(totalPrice.toLocaleString());
		}
		
		$(".order_btn").on("click", function(){
			$(".addressInfo_input_div").each(function(i, obj){
				if($(obj).find(".selectAddress").val() === 'T'){
					$("input[name='m_Name']").val($(obj).find(".m_Name_input").val());
					$("input[name='o_address']").val($(obj).find(".address_input").val());
					$("input[name='o_detail_address']").val($(obj).find(".detail_address_input").val());
					$("input[name='o_Zipcode']").val($(obj).find(".zipcode_input").val());
				}
			});
			
			let form_contents = ''; 
			$(".goods_table_price_td").each(function(index, element){
				let p_Id = $(element).find(".individual_p_Id_input").val();
				let p_Cnt = $(element).find(".individual_p_Cnt_input").val();
				let p_Id_input = "<input name='orders[" + index + "].p_Id' type='hidden' value='" + p_Id + "'>";
				form_contents += p_Id_input;
				let p_Cnt_input = "<input name='orders[" + index + "].p_Cnt' type='hidden' value='" + p_Cnt + "'>";
				form_contents += p_Cnt_input;
			});	
			$(".order_form").append(form_contents);	
			$(".order_form").submit();
		});
	</script>
</body>
</html>