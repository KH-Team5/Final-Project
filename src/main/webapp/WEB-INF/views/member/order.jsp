<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<title>order page</title>
	<style>
	.addressInfo_input{
		display: none;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
		crossorigin="anonymous">
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="../navbar.jsp" flush="true" />
	
	<div class="member_info">
		주문자
		<span>${memberInfo.m_name} | ${memberInfo.email}</span>
	</div>
	
	<div class="addressInfo">
		<div class="addressInfo_button">
			<button class="address_btn_1 btn_buy btn btn-outline-dark flex-shrink-0" onclick="showAdress('1')">사용자 정보 주소록</button>
			<button class="address_btn_2 btn_buy btn btn-outline-dark flex-shrink-0" onclick="showAdress('2')">직접 입력</button>
		</div>
		
		<div class="addressInfo_input_wrap">
			<div class="addressInfo_input addressInfo_input_1">
			
				<table class="table">
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
			
			<div class="addressInfo_input addressInfo_input_2">
				<table class="table">
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
								<div>
									<a class="address_search_btn btn btn-primary" onclick="execution_daum_address()">주소 찾기</a>
									주소
									<input class="address_input" readonly="readonly">
									상세주소
									<input class="detail_address_input" readonly="readonly">									우편번호
									<input class="zipcode_input" readonly="readonly">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="orderProduct">
		<!-- 상품 테이블 -->
		
		<table class="product_table table">
		  <colgroup>
		    <col class="col-1"/>
		    <col class="col-1"/>
		    <col class="col-2"/>
		  </colgroup>
			<thead>
				<tr>
					<th class="text-center">이미지</th>
					<th class="text-center">상품 이름</th>
					<th class="text-center">판매가</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach items="${orderList}" var="ol">
					<tr>
						<td class="text-center">
							<div class="image" data-pid="${ol.imageList[0].p_Id}" data-path="${ol.imageList[0].filePath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
								<img>
							</div>	
						</td>
						<td class="text-center">${ol.p_Name}</td>
						<td class="price_td text-center">
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
	
	<div class="total_info">
		<div class="total_info_price">
			<strong class="total_price_label">최종 결제 금액</strong>
			<strong class="strong_red">
				<span class="finalTotalPrice_span"></span>
			</strong>
		</div>
		<div class="total_info_btn">
			<button type="button" class="order_btn btn btn-primary" onclick="requestPay()">결제하기</button>
		</div>
	</div>
	
	<!-- 주문 요청 form -->
	<form class="order_form" action="<%=request.getContextPath()%>/member/order" method="post">
		<input name="m_Id" value="${memberInfo.m_Id}" type="hidden">
		<input name="m_Name" type="hidden">
		<input name="contact" value="${memberInfo.contact }" type="hidden">
		<input name="email" value="${memberInfo.email }" type="hidden">
		<input name="o_address" type="hidden">
		<input name="o_detail_address" type="hidden">
		<input name="o_Zipcode" type="hidden">
	</form>
	<jsp:include page="../footer.jsp" flush="true" />
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script>
		$(function(){
			var IMP = window.IMP;
			IMP.init("imp50806222");
			setTotalInfo();
			$(".image").each(function(i, obj){
				const imgView = $(obj);
				if(imgView.data("pid")){
					const path = imgView.data("path");
					const uuid = imgView.data("uuid");
					const fileName = imgView.data("filename");
					const uploadPath = encodeURIComponent(path + "/s_" + fileName);
					$(this).find("img").attr('src', '<%=request.getContextPath()%>/display?fileName=' + uploadPath);
				} else {
					// 이미지 없음
					// $(this).find("img").attr('src', '');
				}
			});
		});
		function showAdress(className){
			$(".addressInfo_input").css('display', 'none');
			$(".addressInfo_input_" + className).css('display', 'block');
			$(".addressInfo_input").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
			$(".addressInfo_input_" + className).find(".selectAddress").val("T");
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
			$(".price_td").each(function(index, element){
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			});
			$(".finalTotalPrice_span").text(totalPrice.toLocaleString());
		}
		
		$(".order_btn").on("click", function(){
			$(".addressInfo_input").each(function(i, obj){
				if($(obj).find(".selectAddress").val() === 'T'){
					$("input[name='m_Name']").val($(obj).find(".m_Name_input").val());
					$("input[name='o_address']").val($(obj).find(".address_input").val());
					$("input[name='o_detail_address']").val($(obj).find(".detail_address_input").val());
					$("input[name='o_Zipcode']").val($(obj).find(".zipcode_input").val());
					requsetPay();
				}
			});
			
			let form_contents = ''; 
			$(".price_td").each(function(index, element){
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
		
		function requestPay() {
			var info = {
					orderNum : createOrderNum(),
					price : parseInt($(".individual_totalPrice_input").val()),
					name : $(".m_Name_input").val(),
					address : $(".address_input").val(),
					email : $("input[name=email]").val(),
					tel : $("input[name=contact]").val(),
					zipcode : parseInt($("input[name=o_Zipcode]").val())
			}
			
		      IMP.request_pay({ 
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid:info.orderNum, 
		          name: "의류",
		          amount: info.price,                   
		          buyer_email: info.email,
		          buyer_name: info.name,
		          buyer_tel: info.tel,
		          buyer_addr: info.address,
		          buyer_postcode: info.zipcode,
		      }, function (rsp) { 
		    	  	console.log(rsp);
		    	  	$.ajax({
		    	  		type : "POST",
		    	  		url : "/controller/verifyIamport/" + rsp.imp_uid,
		    	  		dataType: "json",
		    	  		data:{
		    	  			imp_uid : rsp.imp_uid,
		    	  			amount : rsp.amount
		    	  		}
		    	  	}).done(function(data){
		    	  		console.log(data);
		    	  		
		    	  		if(rsp.paid_amount == data.response.amount){
		    	  			alert("결제가 완료되었습니다.");
			    	  		location.href="http://localhost:8081/controller/member/orderList";
		    	  		} else{
		    	  			alert("결제를 실패하였습니다.");
		    	  		}
		    	  	});
		      });
		    }
		
		function createOrderNum(){
			const date = new Date();
			const year = date.getFullYear();
			const month = String(date.getMonth() + 1).padStart(2, "0");
			const day = String(date.getDate()).padStart(2, "0");
			
			let orderNum = year + month + day;
			for (let i=0;i<10;i++){
				orderNum += Math.floor(Math.random() * 8);
			}
		};
</script>
</body>
</html>