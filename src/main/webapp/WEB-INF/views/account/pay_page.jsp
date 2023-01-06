<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello~</title>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp" />
<!-- css -->
<jsp:include page="../include/css.jsp" />
<script src="/resources/js/pay.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<%--임시변수 나중에 지우고 쓰세요~   --%>
	<c:set var="user_coin" value="12312" />
	<c:set var="itemprice" value="25000" />
	<c:set var="itemname" value="내사랑 따듯한 유자차" />
	<c:set var="fareper" value="100" />
	<c:set var="safefare" value="${itemprice div fareper}" />
	<!-- safefare = 안전거래 수수료 상품금액 1%입니다. 
		 fareper 100당 1% 입니다.
	-->
	<c:set var="postprice" value="2500" />
	<c:set var="total" value="${itemprice + postprice + safefare - coin }" />
	<fmt:formatNumber var="user_coins" value="${user_coin }" type="number"
		maxFractionDigits="0" />
	<fmt:formatNumber var="itemprices" value="${itemprice }" type="number"
		maxFractionDigits="0" />
	<fmt:formatNumber var="safefares" value="${safefare }" type="number"
		maxFractionDigits="0" />
	<fmt:formatNumber var="postprices" value="${postprice }" type="number"
		maxFractionDigits="0" />
	<fmt:formatNumber var="totals" value="${total }" type="number"
		maxFractionDigits="0" />

	<%--임시변수 나중에 지우고 쓰세요~  --%>


	<section class="pay_section">
		<div class="pay_body">
			<div class="body-1">
				<p class="body-1-1">택배거래,</p>
				<p>안전거래로 구매</p>
			</div>
			<div class="body-2">
				<ul class="body-2-1">
					<li class="body-2-1-1"><img
						src="/resources/images/icons/myloveuza.jpg" class="item_image"></li>
				</ul>
				<ul class="body-2-2">
					<li><i class="body-2-2-1">${itemprices }원</i></li>
					<li><p class="body-2-2-2">${itemname }</p></li>
				</ul>
			</div>
			<div class="body-3">
				<p class="body-3-1">배송지 입력</p>
				<input type="text" readonly class="address" value="" placeholder="주소를 검색해주세요."> 
				<input type="button" class="address-search" value="주소검색"> 
				<input type="text" class="detail-address" placeholder="세부주소를 입력해주세요."> 
				<input type="text" class="post-message" placeholder="배송 시 요청사항(선택)">
				<img class="message-option" src="/resources/images/icons/updown.png">
				<div class="massage-option-sel">
				<!-- 4809 투명도 제거하기 -->
					<div class="sel-1">직접입력</div>
					<div class="sel-2">빠른 배송 부탁드립니다.</div>
					<div class="sel-3">배송 전, 연락주세요</div>
					<div class="sel-4">부재 시, 휴대폰으로 연락주세요.</div>
					<div class="sel-5">부재 시, 경비실에 맡겨주세요.</div>
					<div class="sel-6">선택 안함</div>
				</div>
			</div>
			<div class="body-4">
				<p class="body-4-1">판다코인</p>
					<p class="coin-posion">내 보유코인 : ${user_coins }코인</p> 
				<input type="number" class="panda-coin" value="" step="100" placeholder="0" >
				<div class="coinwon">코인</div>
			</div>
			<div class="body-5">
				<p class="pay-price">결제금액</p>
				<div class="body-5-1">
					<div class="pay-name">
						<div class="body-5-1-1">상품금액</div>
						<div>안전 결제 수수료</div>
						<div>배송비</div>
						<div>판다코인 차감</div>
					</div>
					<div class="pay_price">
						<div class="body-5-1-2">${itemprices }원</div>
						<div>${safefares }원</div>
						<div>${postprices }원</div>
						<div>
							<input type="text" readonly value="0원" class="coinprice">
<!-- 							<p class="coinwon2">원</p> -->
						</div>
					</div>
				</div>
				<div class="body-5-2">
					<div class="body-5-2-1">총 결제금액</div>
					<div class="body-5-2-2"><i>${totals}원</i></div>
				</div>
				<div class="fareinfo">안전결제 수수료 : 결제금액의 1%</div>
			</div>
			<div class="body-6"></div>
			
		</div>

	</section>




	<jsp:include page="../include/footer.jsp" />
</body>
</html>