<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>

</head>
<body>
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
		<div class="col justify-content-center">
			<h4 class="row fw-bold my-4 pt-2">포인트 충전</h4>
			
			<div class="row fw-bold mt-4 pt-2 justify-content-center">
				<h3 class="text-center">${memberDto.memberNick }님의 현재 보유 포인트는 
					<span class="text-info text-center">
						<fmt:formatNumber value="${memberDto.memberHoldingPoints }" pattern="#,###" /> P
					</span>
				 	입니다.
				 </h3>
			</div>
			<div class="row justify-content-center text-muted mt-1">
				충전은 결제 즉시 진행되며 1주일 이내에 포인트를 사용하지 않은 상태라면 결제 취소가 가능합니다.
			</div>
		</div>
		
	    <div class="row justify-content-center mt-4 pt-2">
	    	<div class="col-9">
	    		<hr>
				<form action="/payment/charge" method="post">
				
					<div class="row text-start">
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="2000" v-model="chargingMoney" >
								2,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="5000" v-model="chargingMoney">
								5,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="10000" v-model="chargingMoney">
								10,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="20000" v-model="chargingMoney">
								20,000원
							</label>
						</div>
					</div>
					<div class="row text-start">
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="30000" v-model="chargingMoney">
								30,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="50000" v-model="chargingMoney">
								50,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="70000" v-model="chargingMoney">
								70,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="100000" v-model="chargingMoney">
								100,000원
							</label>
						</div>
					</div>
					<div class="row text-start">
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="200000" v-model="chargingMoney">
								200,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="300000" v-model="chargingMoney">
								300,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="500000" v-model="chargingMoney">
								500,000원
							</label>
						</div>
						<div class="col-3">
							<label>
								<input type="radio" name="chargeMoney" value="1000000" v-model="chargingMoney">
								1,000,000원
							</label>
						</div>
					</div>
	
							
					<hr>
					
					<div class="d-grid gap-2 mt-1">
						<input type="submit" value="충전하기" class="btn btn-primary btn-block" :disabled="!moneySelected()">
					</div>
					<br><br><br><br><br><br>
					
				</form>
			</div>
   		</div>
	</div>
</div>
<!-- <div id="apibtn">카카오페이로 충전하기</div> -->


<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	const app = Vue.createApp({
        data() {
            return {
            	chargingMoney:0,
            };
        },
        methods: {
        	moneySelected(){
        		return this.chargingMoney > 0; 
        	}
        },
        mounted() {
        	
        },
    });
    app.mount("#app");

// $(function(){
// 	  $('#apibtn').click(function(){
// 		 $.ajax({
// 			 url:'/payment/kakaopay',
// 			 dataType:'json',
// 			 success:function(data){
// 				 alert(data.tid);
// 			 },
// 			 error:function(error){
// 				 alert(error);
// 			 }
// 		 }); 
// 	  }); 
//    }); 
    
    
    
   </script>

<%-- <%@ include file="../include/footer.jsp" %> --%>
			
<br><br><br><br><br><br>
<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>			
</body>
</html>
