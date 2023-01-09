<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<h3 class="text-center">${memberDto.memberNick }님의 현재 보유 포인트는 
				<span class="text-info text-center">
					<fmt:formatNumber value="${memberDto.memberHoldingPoints }" pattern="#,###" /> P
				</span> 
				입니다.
			</h3>
		</div>
		<div class="row justify-content-center text-muted mt-1">
			<c:choose>
				<c:when test="${memberDto.memberHoldingPoints > 0}">
					<span class="text-muted">현재 출금 가능한 포인트는 
						<fmt:formatNumber value="${memberDto.memberHoldingPoints }" pattern="#,###" /> 
						P 입니다.
					</span>
				</c:when>
				<c:when test="${memberDto.memberHoldingPoints <= 0}">
					<span class="text-muted">현재 출금 가능한 포인트가 존재하지 않습니다.</span>
				</c:when>
			</c:choose>
		</div>
			
		<div class="row justify-content-center mt-4 pt-2">
			<div class="col-6">
				<form action="cashingRequest" method="post">
					<div class="row">
						현금화할 포인트
						<input type="number" name="cashingMoney" class="form-control mt-2" v-model="cashingMoney" step="100">
					</div>
					<div class="row mt-2">
						입금 은행명
						<input type="text" name="cashingBank" class="form-control mt-2" v-model="cashingBank" autocomplete="off">
					</div>
					<div class="row mt-2">
						입금 계좌번호
						<input type="text" name="cashingAccount" class="form-control mt-2" v-model="cashingAccount" autocomplete="off">
					</div>
					<div class="row mt-4">
						<input type="submit" class="btn btn-primary btn-block" value="신청하기" :disabled="!submitAble()">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	const app = Vue.createApp({
        data() {
            return {
            	cashingMoney:0,
            	cashingBank:"",
            	cashingAccount:"",
            };
        },
        methods: {
        	submitAble(){
        		return this.cashingMoney > 0 && this.cashingBank && this.cashingAccount;
        	}
        },
        mounted() {
        	
        },
    });
    app.mount("#app");
</script>

<%@ include file="../include/footer.jsp" %>