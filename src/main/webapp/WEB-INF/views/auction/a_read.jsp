<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
 <!-- 파비콘 -->
<link rel="icon" href="/resources/image/favicon.ico">
<!-- Noto Sans 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custom.css">

<script type="text/javascript">

// 새로고침
$(function(){
	$('#refreshP').on('click',function(){
		var aNo = '${param.auction_no}';
		
		$.ajax({
			url:"/auctions/refreshP/"+aNo,
			type:"get",
			contentType:"application/json; charset:UTF-8",
			success:function(data) {
				var a = String(data.auction_bid).replace(/(.)(?=(\d{3})+$)/g,'$1,');
				$('#closingBid').html(a);
				$('#count').html(data.auction_cnt);
			}
		});
		
	});
});

// 타이머
function CountDownTimer(dt, id) {
     var end = new Date(dt);
     var _second = 1000;
     var _minute = _second * 60;
     var _hour = _minute * 60;
     var _day = _hour * 24;
     var timer;
     function showRemaining() {
         var now = new Date();
         var distance = end - now;
         if (distance < 0) {
             clearInterval(timer);
             document.getElementById(id).innerHTML = '타임딜 종료됨';
             return;
         }
         var days = Math.floor(distance / _day);
         var hours = Math.floor((distance % _day) / _hour);
         var minutes = Math.floor((distance % _hour) / _minute);
         var seconds = Math.floor((distance % _minute) / _second);
         document.getElementById(id).innerHTML = days + '일 ';
         document.getElementById(id).innerHTML += hours + '시간 ';
         document.getElementById(id).innerHTML += minutes + '분 ';
         document.getElementById(id).innerHTML += seconds + '초 후';
     }
     timer = setInterval(showRemaining, 250);
 }
</script>

</head>
<body>
	<br><br><br><br><br><br>
<%-- 	${avooo } --%>
<%-- 		${avo } --%>
<%-- 		${avo1 } --%>
<%-- ${avooo.auction_no } --%>
	<!-- 수정,삭제_경매번호 전달-->
	<form role="form" method="post">
		<input type="hidden" name="auction_no" value="${avooo.auction_no }" > 
		<input type="hidden" name="user_no" value="${avooo.user_no }">
		<input type="hidden" name="auction_bid" value="${avooo.auction_bid }">
		<input type="hidden" name="auction_cnt" value="${avooo.auction_cnt }">
	</form>


<!-- <button type="submit" class="btn btn-danger"
	style="width: 200px;">수정</button>
<button type="submit" class="btn btn-warning"
	style="width: 200px;">삭제</button>
<button type="submit" class="btn btn-success"
	style="width: 200px;">목록</button>
 -->

	<div class="container">
		<div class="container-fluid" id="app" data-v-app="">
			<div class="row pt-5">
				<span class="text-muted mr-3">카테고리</span><span
					class="text-muted mr-3">&gt;</span><a
					href=""><span
					class="text-muted">${avooo.auction_category}</span></a>
			</div>
			<div class="row mt-4 py-4 border-bottom border-top">
				<div class="col-5 p-0">
					<div id="carousel" class="carousel slide" data-ride="carousel"
						data-bs-interval="false">
						<ol class="carousel-indicators">
							<li data-bs-target="#carousel" data-bs-slide-to="0"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="/resources/images/gallery-04.jpg"
									class="d-block w-100">
								<!--v-if-->
							</div>
						</div>
						<!--v-if-->
						<!--v-if-->
					</div>
				</div>
				<div class="col ml-5 pl-3 pr-0 d-flex flex-column">
					<div class="row pr-1 mb-3">
						<h3 class="fw-bold">${avooo.auction_title }</h3>
					</div>
					<div class="row mb-3 mr-5">
						<div class="col-3 p-0 text-muted">
							<i class="fa-solid fa-gavel pr-2"></i><span id="count">${avooo.auction_cnt }</span> 건
						</div>
						<div class="col text-muted p-0">
							<i class="fa-solid fa-clock pr-2"></i> 
								<fmt:formatDate value="${avooo.auction_cdate }" pattern="yyyy-MM-dd HH:mm:ss"/> 마감 
								<script>CountDownTimer('${avooo.auction_cdate }','timer')</script>
								(<span id="timer"></span>)
						</div>
					</div>
					<div class="row mb-2 mr-5">
						<div class="col-3 p-0 d-flex align-items-end">
							<h5 class="fw-bold">최초 입찰가</h5>
							<h5 id="maxBidLabel" class="fw-bold" style="display: none;">현재
								최고가</h5>
						</div>
						<div class="col p-0">
							<h3 class="text-primary fw-bold">
								<span id="openingBid" class="comma">
								<fmt:formatNumber value="${avooo.auction_price }"/>
								</span> 원
							</h3>
							<h3 class="text-primary fw-bold" id="blind"
								style="display: none;">
								<span id="maxBid" class="comma">0</span> 원
							</h3>
						</div>
					</div>
					<div class="row mr-5">
						<div class="col-3 p-0 d-flex align-items-end">
							<h5 class="fw-bold">현재 입찰가</h5>
						</div>
						<div class="col p-0">
							<h3 class="text-info fw-bold">
								<span id="closingBid" class="comma">
								<fmt:formatNumber value="${avooo.auction_bid }"/>
								</span> 원
							</h3>
						</div>
					</div>
					<div class="row mt-3 mr-5 mb-auto pt-3 border-top"
						style="display: none;">
						<div class="col-3 p-0 d-flex align-items-end">
							<h5 class="fw-bold">내 입찰가</h5>
						</div>
						<div class="col p-0">
							<h3 class="text-secondary fw-bold">
								<span id="myBid" class="comma">0</span> 원 <span
									class="text-warning pl-2 align-self-center" id="topBidder"
									style="display: none;"><i class="fa-solid fa-crown"></i>
									최고 입찰자</span>
							</h3>
						</div>
					</div>
					<div class="row mt-auto mb-3 pl-5 d-flex justify-content-end">
						<div id="refresh" class="col-3 text-muted p-0 pointer">
							<span class="pl-5" id="refreshP"><i id="rotate"
								class="fa-solid fa-arrow-rotate-left"></i> 새로고침</span>
						</div>
						<div class="col-3 p-0 pl-2 mr-2 text-muted pointer"
							data-toggle="modal" data-target="#myModal">
							<i class="fa-solid fa-land-mine-on pl-3 pr-2"></i> 신고하기
						</div>
					</div>
					
					<c:if test="${sessionScope.user_id eq avooo.user_id || sessionScope.user_id eq 'admin' }">
					<div class="row">
						<div class="col p-0">
							<a class="btn btn-info btn-lg btn-block py-3"
								href="/auction/a_modify?auction_no=${avooo.auction_no }&user_no=${avooo.user_no}" role="button"><i
								class="fa-solid fa-comments-dollar pr-2"></i> 경매 수정 </a>
						</div>
						<div class="col">
							<button type="button"
								class="btn btn-primary btn-lg btn-block py-3"
								data-bs-toggle="modal" data-bs-target="#cancelAuctionModal">
								<i class="fa-solid fa-ban pr-2"></i> 경매 취소
							</button>
						</div>
					</div>
					</c:if>
					
					<c:if test="${sessionScope.user_id ne avooo.user_id && sessionScope.user_id ne 'admin'}">
					<div class="row">
						<div class="col p-0">
							<a class="btn btn-info btn-lg btn-block py-3"
								href="" role="button"><i
								class="fa-solid fa-comments-dollar pr-2"></i> 1:1 채팅하기  </a>
						</div>
						<div class="col">
							<button type="button" class="btn btn-primary btn-lg btn-block py-3" id="startBidding" data-bs-toggle="modal" data-bs-target="#biddingModal">
			                    <i class="fa-solid fa-gavel pr-2"></i> 입찰하기
			                </button>
		                </div>
		             </div>  
						</c:if>
					
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-8">
					<div class="row mb-3">
						<h5 class="fw-bold">경매 물품 정보</h5>
					</div>
					<div class="row">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active">물품 상태 : <span
									class="text-primary pl-1">${avooo.auction_condition }</span></li>
							</ol>
						</nav>
					</div>
					<div class="row">
						<p class="text-muted pr-4">
							${avooo.auction_detail }
						</p>
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
							부정 평가 <span class="text-primary fw-bold fs-large ml-3">0개</span>
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
											class="comma text-primary">1,000</span> 원 )
										</label><input type="number" class="form-control" id="inputBid"
											autocomplete="off" max="999999900">
											<small class="form-text text-info pl-1"></small>
										<div class="invalid-feedback">최고 입찰가보다 높고, 입찰 단위에 부합하는
											금액만 가능합니다.</div>
									</div>
								</div>
								<div class="col align-self-center p-0">원</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">돌아가기</button>
							<button type="button" class="btn btn-primary" id="updateBid"
								data-bs-dismiss="modal">입찰하기</button>
<!-- 							<button type="button" class="btn btn-primary d-none" -->
<!-- 								id="blindBid" data-bs-dismiss="modal">입찰하기</button> -->
						</div>
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
								<span class="text-primary">0</span> / 100
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">돌아가기</button>
							<button type="button" class="btn btn-primary"
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
								<i class="fa-solid fa-ban pr-2 text-primary"></i> 경매 중지
							</h5>
							<button type="button" class="btn-close close"
								data-bs-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							입찰자가 있는 경매를 중지하면 <span class="fw-bold text-primary">사이트
								이용에 관한 불이익</span>을 받게 됩니다. <br>
							<br> 정말 경매를 중지하시겠습니까?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니오</button>
							<button type="button" class="btn btn-primary"
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
								<i class="fa-solid fa-ban pr-2 text-primary"></i> 경매 취소
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
							<button type="button" class="btn btn-primary" id="sysy" 
								data-bs-dismiss="modal">예</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content" style="width:80%;">

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log("formObj : "+formObj);
		
		//경매취소(삭제) 버튼
		$("#sysy").click(function(){
			formObj.attr("action", "/auction/a_remove");
			formObj.submit();
		});
		
		//입찰하기 버튼
		$("#updateBid").click(function(){
			formObj.attr("action", "/auction/a_bid");
			formObj.submit();
		});
	});
</script>



<style scoped="">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">신고하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <form action="/member/reportA" method="post" id="frm">
      	<input type="hidden" name="user_no" value="${param.user_no }">
      	<input type="hidden" name="auction_no" value="${param.auction_no }">
      	<input type="hidden" name="u_id" value="${user_id }">
        <input type="text" name="rep_subject" placeholder="신고 제목" style="width:100%;"><br><br>
        <select name="rep_sort" style="width:100%;">
        	<option selected>신고 분류</option>
        	<option value="1">욕설</option>
        	<option value="2">거래에 문제가 있었어요!</option>
        	<option value="3">기타</option>
        </select><br><br>
        <textarea rows="10" cols="10" style="width:100%;" name="rep_reason" placeholder="신고 사유"></textarea>
        </form>
      </div>
		
      <!-- Modal footer -->
      <div class="modal-footer">
      	<a href="#" class="btn btn-primary" onclick="document.getElementById('frm').submit();">신고하기</a>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
	</div>
	</div>
	
<br><br><br><br><br><br>
<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>