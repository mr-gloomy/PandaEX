<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icons/PANDA.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<script src="https://kit.fontawesome.com/b57f99e8ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
 <!-- 파비콘 -->
<link rel="icon" href="/resources/image/favicon.ico">
<!-- Noto Sans 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">
$(function() {
	$(".loginControl").click(function(e){
		var targetObjectId = $(e.target)[0].id;
		var userId = '<%=(String)session.getAttribute("user_id")%>';
		if(userId == null || userId == "null") {
			$(".usermodal").trigger("click");
		} else {
			if("chat" == targetObjectId) {
				window.open('/main/chat?u=${vo.user_id}&g=${param.goods_no}','chat01','width=600,height=600');
			} else if("startBidding" == targetObjectId) {
    			$("#biddingModal").modal("show");
			}
			}
		});
});
</script>
</head>
<body>
	<br><br><br>
	<div class="container">
		<div class="container-fluid" id="app" data-v-app="">
			<div class="row pt-5">
				<span class="text-muted mr-3">카테고리</span> 
				<span class="text-muted mr-3">&gt;</span><a href=""> 
				<span class="text-muted">${vo.goods_category}</span></a>
			</div>
			<div class="row mt-4 py-4 border-bottom border-top">
				<div class="col-5 p-0">
					<div id="carousel" class="carousel slide" data-ride="carousel"
						data-bs-interval="false">
						<ol class="carousel-indicators">
							<li data-bs-target="#carousel" data-bs-slide-to="0" class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${vo.uploadFile }" onerror="this.src='/resources/images/cat.jpg';">
							</div>
						</div>
					</div>
				</div>
				<div class="col ml-5 pl-3 pr-0 d-flex flex-column">
					<div class="row pr-1 mb-3">
						<c:choose>
						 	<c:when test="${vo.goods_trade == '판매중'}">			
								<button type="button" class="btn btn-outline-success py-0.7 px-2">${vo.goods_trade}</button>
							</c:when>
						 	<c:when test="${vo.goods_trade == '예약중'}">			
								<button type="button" class="btn btn-outline-warning py-0.7 px-2">${vo.goods_trade}</button>
							</c:when>
						 	<c:otherwise>			
								<button type="button" class="btn btn-outline-secondary py-0.7 px-2">${vo.goods_trade}</button>
							</c:otherwise>
						</c:choose>
						<h2>&nbsp; <b>${vo.goods_title}</b></h2>
					</div>
					<div class="row mb-3 mr-5">
						<div class="col-3 p-0 text-muted">
							<i class="fa-solid fa-gavel pr-2"></i><span id="count"> 조회수 &nbsp; ${vo.viewcount }</span>
						</div>
						<div class="col text-muted p-0">
							<div class="col text-muted p-0">
								<i class="fa-solid fa-clock pr-2"></i> 상품등록일&nbsp; ${vo.goods_date }
							</div>
						</div>
					</div>
					<div class="row mr-5">
						<div class="col-3 p-0 d-flex align-items-end">
							<h5 class="fw-bold">판매가격</h5>
						</div>
						<div class="col p-0">
							<h3 class="text-success fw-bold">
								<span class="comma">
									<fmt:formatNumber value="${vo.goods_price }" pattern="#,###"/>
								</span> 원
							</h3>
						</div>
					</div><br>
					<div class="row mb-2 mr-5">
						<div class="col-3 p-0 d-flex align-items-end">
							<h7 class="fw-bold">&nbsp; - 가격제안</h7>
						</div>
						<div class="col p-0">
							<h7 class="text-secondary fw-bold">
								<span>${vo.goods_discount }</span> 
							</h7>
						</div>
					</div>
					<div class="row mb-2 mr-5">
						<div class="col-3 p-0 d-flex align-items-end">
							<h7 class="fw-bold">&nbsp - 상품환불</h7>
						</div>
						<div class="col p-0">
							<h7 class="text-secondary fw-bold">
								<span>${vo.goods_refund }</span> 
							</h7>
						</div>
					</div>
					<!-- button -->
					<div class="row mt-auto mb-3 pl-5 d-flex justify-content-end">
						<div class="col-3 p-0 pl-2 mr-2 text-muted pointer"
							data-bs-toggle="modal" data-bs-target="#reportModal">
							<i class="fa-solid fa-land-mine-on pl-3 pr-2"></i> 신고하기
						</div>
					</div>
					<c:if test="${sessionScope.user_id eq vo.user_id || sessionScope.user_id eq 'admin' }">
						<div class="row">
							<div class="col p-0">
								<a class="btn btn-warning  btn-lg btn-block py-3"
									href="/goods/modify?goods_no=${vo.goods_no}" role="button">
									<i class="fa-sharp fa-solid fa-paper-plane"></i> 수정하기 </a>
							</div>
							<div class="col">
								<a type="button" class="btn btn-success btn-lg btn-block py-3"
								   href="/goods/remove?goods_no=${vo.goods_no}">
								   <i class="fa-solid fa-ban pr-2"></i> 삭제하기 </a>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.user_id ne vo.user_id && sessionScope.user_id ne 'admin'}">
						<div class="row">
							<div class="col p-0">
								<a class="btn btn-warning btn-lg btn-block py-3 loginControl" 
									href="/payment/pay_page?goods_no=${vo.goods_no }" role="button">
									<i class="fa-sharp fa-solid fa-paper-plane"></i> 판다페이 결제하기 </a>
							</div>
							<div class="col">
								<a type="button" class=
								
								"btn btn-success btn-lg btn-block py-3 loginControl"  
								   id="chat" >
				                   <i class="fa-solid fa-gavel pr-2"></i> 1:1 채팅하기
				                </a>
			                </div>
			             </div>  
					</c:if>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-8">
					<div class="row mb-3">
						<h5 class="fw-bold">상품정보</h5>
					</div>
					<div class="row">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active">상태 : <span
									class="text-success pl-1">${vo.goods_condition }</span></li>
							</ol>
						</nav>
					</div>
					<div class="row mb-3">
						<h5 class="fw-bold">상품소개</h5>
					</div>
					<div class="row">
						<nav aria-label="breadcrumb">
							${vo.goods_detail }
						</nav>
					</div>
				</div>
				<div class="col">
					<div class="row ml-3 mb-3">
						<h5 class="fw-bold">판매자 정보</h5>
					</div>
					<div class="row ml-3 pb-3 border-bottom">
						<div class="col-2">
							<img id="profile" class="rounded-circle"
								src="/resources/images/member.jpg">
						</div>
						<div class="col ml-4">
							<h6 class="row fw-bold mb-2">${vo.user_nick }</h6>
							<h6 class="row text-muted">${vo.user_area } ${vo.user_addr }</h6>
						</div>
					</div>
					<div class="row ml-3 py-3 border-bottom">
						<div class="col-4 text-muted ml-2">
							긍정 평가 <span class="text-success fw-bold fs-large ml-3">2개</span>
						</div>
						<div class="col-4 text-muted ml-2">
							부정 평가 <span class="text-success fw-bold fs-large ml-3">0개</span>
						</div>
					</div>
					<div class="row ml-3 pt-3 pb-2">
						<div class="text-muted">가입일 : 
						<fmt:formatDate value="${vo.user_regdate }" pattern="yyyy-MM-dd"/></div>
					</div>
					<div class="row ml-3">
						<div class="text-muted">누적 제재 : 4회</div>
					</div><hr>
				</div>
			</div>
			<!-- 신고하기 모달창 -->
			<div class="modal fade" id="reportModal"
				aria-labelledby="reportModalLable" tabindex="-1" aria-hidden="true"
				style="display: none;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reportModalLable">🥺 신고하기</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							신고 이유를 알려주세요! <input type="text" class="form-control mt-2"
								autocomplete="off" maxlength="100">
							<div class="text-right mt-1">
								<span class="text-success">0</span> / 100
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">돌아가기</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal" disabled="">신고하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[role='form']");
			console.log("formObj : "+formObj);
			
			//로그인제어
			$(".loginControl").click(function(e){
				var targetObjectId = $(e.target)[0].id;
	    		var userId = '<%=(String)session.getAttribute("user_id")%>';
	    		if(userId == null || userId == "null") {
	    			$(".usermodal").trigger("click");
	    		} else {
	    			if("chat" == targetObjectId) {
	    				window.open('/main/chat?u=${vo.user_id}&a=${param.goods_no}','chat01','width=600,height=600');
	    			} else if("startBidding" == targetObjectId) {
		    			$("#biddingModal").modal("show");
	    			}
	   			}
	   		});
		});
		</script>
<style>
.carousel-item img {
    object-fit: cover;
    height: 100%;
    border-radius: 1rem;
    width: 100%;
}
.carousel-item {
	transition: transform .1s ease;
}
.carousel-caption {
	right: 5%;
	bottom: 0;
	text-align: right;
}
.text-warning {
	font-size: 0.5em;
	vertical-align: middle;
}
@
keyframes rotate {from { transform:rotate(0deg);
	
}
to {
	transform: rotate(360deg);
}
}
.rotate {
	animation: rotate 0.5s ease-out;
}
.modal.fade .modal-dialog {
	transition: transform .1s ease-out;
}
.photo-modal-wrap {
	width: fit-content;
	height: 100%;
	margin: 0 auto;
	max-width: 70%;
}
.photo-modal {
	width: 100%;
	max-width: 100%;
}
#profile {
	object-fit: cover;
	width: 50px;
	height: 50px;
}
.btn-warning {
    color: #ffffff;
    background-color: #ffc107;
    border-color: #ffc107;
}
</style>
	</div>
<br><br><br><br><br><br>
<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>