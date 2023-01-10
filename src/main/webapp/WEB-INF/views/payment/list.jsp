<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

<div id="app" class="container d-flex" v-cloak>

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
		<div class="col-7">
        	<div class="row my-4 pt-2">
        		<div class="col-6">
        			<h4 class="fw-bold">내 포인트 충전 내역</h4>
        		</div>
        		<div class="col pt-1 pr-0">
	        		<select class="form-select form-select-sm border-0 text-muted" v-model.number="filter" @change="updateList">
	                    <option value="0">전체</option>
	                    <option value="1">취소 가능</option>
	                </select>
        		</div>        		
        		<div class="col pt-1 pl-0">
	        		<select class="form-select form-select-sm border-0 text-muted" v-model.number="sort" @change="updateList">
	                    <option value="0">최신순</option>
	                    <option value="1">오래된 순</option>
	                    <option value="2">충전 포인트↑순</option>
	                    <option value="3">충전 포인트↓순</option>
	                </select>
        		</div>
        	</div>
        	<div class="row">
	        	<table class="table table-hover border-bottom">
					<thead>
				    	<tr>
				    		<th scope="col" class="col-2">결제일시</th>
				    		<th scope="col" class="col-2">충전 금액</th>
				    		<th scope="col" class="col-1">취소하기</th>
				    	</tr>
					</thead>
					<tbody>
				    	<tr v-for="(payment, index) in list" :key="index">
				    		<td class="text-muted fs-small">{{ dateFormat(payment.paymentTime) }}</td>	    		
							<td class="fw-bold fs-small">
				    			<span class="text-dark text-truncate">{{ comma(payment.paymentPrice) }}p</span>
				    		</td>
				    		<td class="fs-small fw-bold">
				    			<a :href="'${root}/payment/refund/' + payment.paymentNo" v-if="payment.refund != ''"><span class="text-primary">{{ payment.refund }}</span></a>
				    		</td>
				    	</tr>			    			    
					</tbody>
				</table>
        	</div>
	        <div class="row justify-content-center mt-4">
		        <nav>
				  <ul class="pagination">
				    <li class="page-item" :class="{'disabled': pageList == 0}">
				    	<a class="page-link" href="#" @click="prev">
				        	<span aria-hidden="true">&laquo;</span>
				    	</a>
				    </li>			    
				    <li class="page-item" v-for="pageItem in totalPage" :key="pageItem" 
				    	:class="{'active': pageItem == page}" v-show="parseInt((pageItem - 1) / 10) == pageList">
				    	<a class="page-link" href="#" @click="pagination(pageItem)">{{ pageItem }}</a>
				    </li>
				    <li class="page-item" :class="{'disabled': parseInt((totalPage - 1) / 10) == pageList}">
				    	<a class="page-link" href="#" @click="next">
				        	<span aria-hidden="true">&raquo;</span>
				    	</a>
				    </li>			    
				  </ul>
				</nav>
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
            	page: 1,
            	list: [],
            	filter: 0,
            	sort: 0,
				paymentCount: 0,
				totalPage: 1,
				pageList: 0,
            };
        },
        methods: {
        	comma(money) { // 금액 콤마 찍기
        	  	return String(money).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	},
        	dateFormat(time) { // 날짜 포맷
        		let date = new Date(time);
        	  	return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " 
        	  		+ (date.getHours() < 10 ? "0" : "") + date.getHours() + ":" + (date.getMinutes() < 10 ? "0" : "") + date.getMinutes();
        	},          	
            loadMore() { // 리스트 불러오기
            	axios.get("${root}/payment/loadList", {
            		params: {
            			page: this.page,
            			filter: this.filter,
            			sort: this.sort,
            	      }
            	})
            	.then(resp => {
    				this.list = resp.data;
    				if(resp.data.length != 0) {
        				this.paymentCount = resp.data[0].paymentCount;
        				this.totalPage = parseInt((resp.data[0].paymentCount - 1) / 10) + 1;    					
    				} else {
        				this.paymentCount = 0;
        				this.totalPage = 1;      					
    				}
            	})
            },
            updateList() { // 검색, 필터, 정렬 변경 시 리스트 갱신
            	this.page = 1;
            	this.pageList = 0;
            	this.loadMore();
            },
            pagination(pageItem) { // 페이지 교체
            	this.page = pageItem;
            	this.loadMore();
            },
            prev() { // 이전 페이지 리스트
            	this.pageList--;
            	this.page = (this.pageList * 10) + 1;
            	this.loadMore();
            },
            next() { // 다음 페이지 리스트
            	this.pageList++;
            	this.page = (this.pageList * 10) + 1;
            	this.loadMore();
            },
        },
        mounted() {
        	this.loadMore(); // 1페이지 불러오기
        },
    });
    app.mount("#app");
</script>
<style scoped>
	#app {
		min-height: 700px;
	}
	
	select {
		font-size: 0.9em;
	}

	select:focus {
		outline: none;
	}
</style>

<%@ include file="../include/footer.jsp" %>