<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<!-- CSS -->
<style type="text/css">
.carousel-item img {
	object-fit: cover;
	height: 26em;
	border-radius: 1rem;
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

.container-fluid {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	padding-right: 15px;
	padding-left: 15px;
	margin-top: 100px;
	margin-bottom: 100px;
	width: 78%;
}
.ml-3 {
    margin-left: 0rem!important;
}
.ml-2 {
    margin-left: -1.3rem!important;
}
</style>

</head>
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
						<img src="/resources/images/gallery-04.jpg" class="d-block w-100">
					</div>
				</div>
			</div>
		</div>
		<div class="col ml-5 pl-3 pr-0 d-flex flex-column">
			<div class="row pr-1 mb-3">
				
				<c:choose>
				 	<c:when test="${vo.goods_trade == '판매중'}">			
						<button type="button" class="btn btn-outline-success">${vo.goods_trade}</button>
					</c:when>
				 	<c:when test="${vo.goods_trade == '예약중'}">			
						<button type="button" class="btn btn-outline-warning">${vo.goods_trade}</button>
					</c:when>
				 	<c:otherwise>			
						<button type="button" class="btn btn-outline-secondary">${vo.goods_trade}</button>
					</c:otherwise>
				</c:choose>
				<h2>&nbsp; <b>${vo.goods_no} ) ${vo.goods_title}</b></h2>
			</div>
			<div class="row mb-3 mr-5">
				<div class="col-3 p-0 text-muted">
					<i class="fa-solid fa-gavel pr-2"></i><span id="count"> 조회수&nbsp; ${vo.viewcount }</span>
				</div>
				<div class="col-3 p-0 text-muted">
					<i class="fa-solid fa-gavel pr-2"></i><span id="count"> 채팅수&nbsp; {채팅수 }</span>
				</div>
				<div class="col text-muted p-0">
					<i class="fa-solid fa-clock pr-2"></i> 상품등록일&nbsp; ${vo.goods_date }
				</div>
			</div>
			<div class="row mb-2 mr-5">
				<div class="col-3 p-0 d-flex align-items-end">
					<h4 class="fw-bold">판매가격</h4>
				</div>
				<div class="col p-0">
					<h3 class="text-success fw-bold">
						<span class="comma">
							<fmt:formatNumber value="${vo.goods_price }" pattern="#,###"/>
						</span> 원
					</h3>
				</div>
			</div><br><br>
			<div class="row mb-2 mr-5">
				<div class="col-3 p-0 d-flex align-items-end">
					<h5 class="fw-bold">&nbsp; ο 가격제안</h5>
				</div>
				<div class="col p-0">
					<h5 class="text-secondary fw-bold">
						<span>${vo.goods_discount }</span> 
					</h5>
				</div>
			</div>
			<div class="row mb-2 mr-5">
				<div class="col-3 p-0 d-flex align-items-end">
					<h5 class="fw-bold">&nbsp ο 상품환불</h5>
				</div>
				<div class="col p-0">
					<h5 class="text-secondary fw-bold">
						<span>${vo.goods_refund }</span> 
					</h5>
				</div>
			</div>
			<div class="row mt-auto mb-3 pl-5 d-flex justify-content-end">
				<div id="refresh" class="col-3 text-muted p-0 pointer">
					<span class="pl-5">
						<i id="rotate" class="fa-solid fa-arrow-rotate-left"></i> 새로고침</span>
				</div>
				<div class="col-3 p-0 pl-2 mr-2 text-muted pointer"
					data-bs-toggle="modal" data-bs-target="#reportModal">
					<i class="fa-solid fa-land-mine-on pl-3 pr-2"></i> 신고하기</div>
			</div>
			<div class="row">
				<div class="col p-0">
					<button type="button" class="btn btn-success btn-lg btn-block py-3">
						<i class="fa-solid fa-ban pr-2"></i> 1:1 채팅하기
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-8">
			<div class="row mb-3">
				<h5 class="fw-bold">물품 정보</h5>
			</div>
			<div class="row">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active">상품상태 : <span
							class="text-primary pl-1">${vo.goods_condition }</span></li>
					</ol>
				</nav>
			</div>
			<div class="row mb-3">
				<h5 class="fw-bold">상품소개</h5>
			</div>
			<div class="row">
				<p class="text-muted pr-4">${vo.goods_detail }</p>
			</div>
		</div>
		<div class="col">
			<div class="row ml-3 mb-3">
				<h5 class="fw-bold">판매자 정보</h5>
			</div>
				<div class="col-2">
					<img id="profile" class="rounded-circle"
						src="/resources/image/default_attachment.jpg">
				</div>
				<div class="col ml-4">
					<h6 class="row fw-bold mb-2">${avo.user_nick }</h6>
					<h6 class="row text-muted">${avo1.user_area }${avo1.user_addr }</h6>
				</div>
			</div>
			<div class="row ml-3 py-3 border-bottom">
				<div class="col-4 text-muted ml-2">
					긍정 평가 <span class="text-success fw-bold fs-large ml-3">2개</span>
				</div>
				<div class="col-4 text-muted ml-2">
					부정 평가 <span class="text-primary fw-bold fs-large ml-3">0개</span>
				</div>
			</div>
			<div class="row ml-3 pt-3 pb-2">
				<div class="text-muted">
					가입일 :
					<fmt:formatDate value="${avo1.user_regdate }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="row ml-3">
				<div class="text-muted">누적 제재 : 4회</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal465" tabindex="-1" aria-hidden="true">
		<div class="photo-modal-wrap">
			<div class="modal-dialog modal-dialog-centered border-0 photo-modal">
				<div class="modal-content">
				<!-- <img src="/auctionara/attachment/download?attachmentNo=465"
 						class="img-fluid img-thumbnail"> -->
				</div>
			</div>
		</div>
	</div>
	
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
				<div class="modal-body"> 신고 이유를 알려주세요! 
					<input type="text" class="form-control mt-2" autocomplete="off" maxlength="100">
					<div class="text-right mt-1">
						<span class="text-primary">0</span> / 100
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal" disabled="">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>