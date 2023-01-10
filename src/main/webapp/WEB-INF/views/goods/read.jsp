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
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
 <!-- 파비콘 -->
<link rel="icon" href="/resources/image/favicon.ico">
<!-- Noto Sans 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
								<img src="${vo.thumbnail }" class="d-block w-100">
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
							<h3 class="text-info fw-bold">
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
						<div id="refresh" class="col-3 text-muted p-0 pointer">
							<span class="pl-5" id="refreshP">
								<i id="rotate" class="fa-solid fa-arrow-rotate-left"></i> 새로고침</span>
						</div>
						<div class="col-3 p-0 pl-2 mr-2 text-muted pointer"
							data-bs-toggle="modal" data-bs-target="#reportModal">
							<i class="fa-solid fa-land-mine-on pl-3 pr-2"></i> 신고하기
						</div>
					</div>
					<div class="row">
						<div class="col p-0">
							<a class="btn btn-info btn-lg btn-block py-3"
								href="/auctionara/chat" role="button"><i
								class="fa-solid fa-comments-dollar pr-2"></i> 1:1 채팅하기  </a>
						</div>
						<div class="col">
							<button type="button"
								class="btn btn-success btn-lg btn-block py-3"
								data-bs-toggle="modal" data-bs-target="#cancelAuctionModal">
								<i class="fa-solid fa-ban pr-2"></i> 바로구매
							</button>
						</div>
					</div>
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
					<div class="row mb-3">
						<h5 class="fw-bold">첨부파일</h5>
					</div>
					<div class="row">
					    <c:forEach var="fileName" items="${map.fileList }">
					        <h3><a href="/download?fileName=${fileName }">${fileName }</a></h3>
					    </c:forEach>
					</div>
				</div>
				<div class="col">
					<div class="row ml-3 mb-3">
						<h5 class="fw-bold">판매자 정보</h5>
					</div>
					<div class="row ml-3 pb-3 border-bottom">
						<div class="col-2">
							<img id="profile" class="rounded-circle"
								src="/resources/image/default_attachment.jpg">
						</div>
						<div class="col ml-4">
							<h6 class="row fw-bold mb-2">${avooo.user_nick }</h6>
							<h6 class="row text-muted">${avooo.user_area } ${avooo.user_addr }</h6>
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
						<fmt:formatDate value="${avooo.user_regdate }" pattern="yyyy-MM-dd"/></div>
					</div>
					<div class="row ml-3">
						<div class="text-muted">누적 제재 : 4회</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="modal465" tabindex="-1"
				aria-hidden="true">
				<div class="photo-modal-wrap">
					<div
						class="modal-dialog modal-dialog-centered border-0 photo-modal">
						<div class="modal-content">
							<img src="/auctionara/attachment/download?attachmentNo=465"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="biddingModal" tabindex="-1"
				aria-labelledby="biddingModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="biddingModalLabel">
								<i class="fa-solid fa-gavel pr-2"></i>입찰하기
							</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-10">
									<div class="form-group pl-2">
										<label for="inputBid"> 입찰 가격을 입력해주세요 ( 입찰 단위 : <span
											class="comma text-success">1,000</span> 원 )
										</label><input type="number" class="form-control" id="inputBid"
											autocomplete="off" max="999999900"><small
											class="form-text text-info pl-1">일만오천원</small>
										<div class="invalid-feedback">최고 입찰가보다 높고, 입찰 단위에 부합하는
											금액만 가능합니다.</div>
									</div>
								</div>
								<div class="col align-self-center p-0">원</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary">입찰 단위만큼
								올리기</button>
							<button type="button" class="btn btn-info"
								data-bs-dismiss="modal">즉시 낙찰하기</button>
							<button type="button" class="btn btn-success" id="insertBid"
								data-bs-dismiss="modal">입찰하기</button>
							<button type="button" class="btn btn-success d-none"
								id="blindBid" data-bs-dismiss="modal">입찰하기</button>
						</div>
						<!--v-if-->
					</div>
				</div>
			</div>
			<div class="modal fade" id="failBiddingModal" aria-hidden="true"
				aria-labelledby="failBiddingModalLable" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="failBiddingModalLable">😢 입찰 실패</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">누군가 이미 낙찰하여 경매가 종료되었습니다</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="reportModal"
				aria-labelledby="reportModalLable" tabindex="-1" aria-hidden="true"
				style="display: none;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reportModalLable">🥺 경매 신고하기</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							경매 신고 이유를 알려주세요! <input type="text" class="form-control mt-2"
								autocomplete="off" maxlength="100">
							<div class="text-right mt-1">
								<span class="text-success">0</span> / 100
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">돌아가기</button>
							<button type="button" class="btn btn-success"
								data-bs-dismiss="modal" disabled="">신고하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="stopAuctionModal" aria-hidden="true"
				aria-labelledby="stopAuctionModalLable" tabindex="-1"
				style="display: none;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="stopAuctionModalLable">
								<i class="fa-solid fa-ban pr-2 text-success"></i> 경매 중지
							</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							입찰자가 있는 경매를 중지하면 <span class="fw-bold text-success">사이트
								이용에 관한 불이익</span>을 받게 됩니다. <br>
							<br> 정말 경매를 중지하시겠습니까?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니오</button>
							<button type="button" class="btn btn-success"
								data-bs-dismiss="modal">예</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="cancelAuctionModal"
				aria-labelledby="cancelAuctionModalLable" tabindex="-1"
				aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="cancelAuctionModalLable">
								<i class="fa-solid fa-ban pr-2 text-success"></i> 경매 취소
							</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">정말 경매를 취소하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니오</button>
							<button type="button" class="btn btn-success"
								data-bs-dismiss="modal">예</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="failCancleModal" aria-hidden="true"
				aria-labelledby="failCancleModalLable" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="failCancleModalLable">🥺 경매
								취소/중지 실패</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">이미 낙찰된 경매이므로 경매를 취소하거나 중지할 수 없습니다.</div>
					</div>
				</div>
			</div>
		</div>




		<style scoped="">
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
</style>





	</div>
<br><br><br><br><br><br>
<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>