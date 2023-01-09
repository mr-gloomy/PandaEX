<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<div class="container d-flex" id="app">
	<div class="row col-3 mt-3">
		<ul class="nav flex-column text-center">
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/index" class="nav-link btn-outline-dark fw-bold fs-large">마이페이지</a>
		  </li>
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/info" class="nav-link btn-outline-info">내 정보 수정</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/auction_history" class="nav-link btn-outline-info">내 경매</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/pay_history" class="nav-link btn-outline-info">내 입찰</a>
		  </li>
		  <li class="nav-item border-bottom">
			<a href="${root}/payment/paymentReady" class="nav-link btn-outline-info">포인트 충전</a>
		  </li>
		  <li class="nav-item border-bottom">
			<a href="${root}/payment/list" class="nav-link btn-outline-info">포인트 충전 내역</a>
		  </li>
		  <li class="nav-item border-bottom">
			<a href="${root}/payment/cashing" class="nav-link btn-outline-info">현금화 신청</a>
		  </li>
		  <li class="nav-item border-bottom">
			<a href="${root}/payment/cashingList" class="nav-link btn-outline-info">현금화 신청 내역</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/exit" class="nav-link btn-outline-secondary">회원 탈퇴</a>
		  </li>
		</ul>
	</div>
	
	<div class="row flex-fill d-flex flex-column">
		<h4 class="row fw-bold my-4 pt-2">현금화 신청</h4>
			
		<div class="row fw-bold mt-1 pt-2 justify-content-center">
			<h3 class="text-center">출금 신청이 완료되었습니다.</h3>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>