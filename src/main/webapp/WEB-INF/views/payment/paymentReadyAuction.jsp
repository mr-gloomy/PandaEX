<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../include/header.jsp" %>

<div class="container" id="app">
	<div class="row justify-content-center mt-5">
		<h2>${memberDto.memberNick }님의
			현재 보유 포인트는 <span class="text-info">${memberDto.memberHoldingPoints }P</span> 입니다.
		</h2>
	</div>

	<div class="row mt-2 justify-content-center">
		<p class="text-muted">추가로 충전하셔야 하는 포인트는 ${bidDto.succFinalBid - memberDto.memberHoldingPoints }P 입니다. </p>
		<p class="text-muted">포인트를 충전하신 후 결제를 다시 시도해주세요.</p>
	</div>

	<div class="row mt-4 justify-content-center">
		<div class="col-9">
		
			<hr>
		
			<form action="${root }/payment/charge" method="post">
	
				<div class="row text-start">
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney" value="2000"
							v-model="chargingMoney"> 2,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney" value="5000"
							v-model="chargingMoney"> 5,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="10000" v-model="chargingMoney"> 10,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="20000" v-model="chargingMoney"> 20,000원
						</label>
					</div>
				</div>
				<div class="row text-start">
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="30000" v-model="chargingMoney"> 30,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="50000" v-model="chargingMoney"> 50,0000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="70000" v-model="chargingMoney"> 70,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="100000" v-model="chargingMoney"> 100,000원
						</label>
					</div>
				</div>
				<div class="row text-start">
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="200000" v-model="chargingMoney"> 200,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="300000" v-model="chargingMoney"> 300,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="500000" v-model="chargingMoney"> 500,000원
						</label>
					</div>
					<div class="col-3">
						<label> <input type="radio" name="chargeMoney"
							value="1000000" v-model="chargingMoney"> 1,000,000원
						</label>
					</div>
				</div>
	
				<hr>
	
				<div class="d-grid gap-2 mt-1">
					<input type="submit" value="충전하기" class="btn btn-primary btn-block" :disabled="!moneySelected()">
				</div>
	
			</form>
		</div>
	</div>
</div>

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
</script>

<%@ include file="../include/footer.jsp" %>