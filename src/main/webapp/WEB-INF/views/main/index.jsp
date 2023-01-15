<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="../addon/remote.jsp"%>
<!-- JS -->
<!-- CSS -->
<style type="text/css">
.img {
	border: 0;
	display: block;
}
.stext-104 { /* 상품명 말줄임표 넣ㄱ*/
	width: 275px;
	font-family: sans-serif;
	font-size: 18px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow:ellipsis;
}
.stext-105 {
    font-family: ui-monospace;
    font-size: 18px;
    line-height: 1.466667;
    letter-spacing: 1px;
}
.stext-104 { /* 상품명 말줄임표 넣ㄱ*/
	
}
.bg1 {
    background-color: #0e5f20;
}
.stext-103 {
    font-size: 17px;
    line-height: 1.466667;
    width: 270px;
	font-size: 16px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow:ellipsis;
}
.cl2 {
    color: #ffffff;
}
.hov-btn1:hover {
    border-color: #28a745;
    background-color: #28a745;
    color: #fff;
}


</style>
</head>
<body class="animsition">
<br><br><br><br>
	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1" style="background-image: url(/resources/images/mai.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									안전한 중고거래 · 기부경매 플랫폼
								</span>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									PANDA
								</h2>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
								<a href="" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									시작하기
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="item-slick1" style="background-image: url(/resources/images/main4.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									일상에서 만나는 환경보호와 나눔에 동참해요!
								</span>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									 중고상품 기부하기
								</h2>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									바로가기
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="item-slick1" style="background-image: url(/resources/images/main3.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									쉽고 빠르고 안전하게 거래하세요!
								</span>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									PANDAPAY
								</h2>
							</div>
							<div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
								<a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									가입하기
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="row mb-4 mt-5">
			    <div class="col-9 mr-5">
			        <h2 class="fw-bold"><b> 오늘의 상품 추천</b></h2>
		 	    </div>
		 	</div>
			<!-- 상품 랜덤 4개 -->
			<c:set var="size" value="${GoodsRand.size() }" />
			<c:set var="col" value="10" />
			<c:set var="row" value="${ Math.ceil(size/col) }" />
			<c:set var="num" value="0" />
	
			<c:forEach begin="1" end="${row }" step="1">
				<c:forEach var="i" begin="1" end="${col }" step="1">
					<c:if test="${num < size}">
						<c:set var="vo" value="${GoodsRand[num]}" />
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women" 
							 style="float: left; width: 300px; height: 350px; margin-top: 10px;">
							<div class="block2">
								<div class="block2-pic hov-img0">
									<img src="${vo.thumbnail }" onerror="this.src='/resources/images/cat.jpg';" style="width: 280px; height: 250px;"">
								</div>
								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href="/goods/read?goods_no=${vo.goods_no }&user_no=${vo.user_no}" class="stext-103 cl3""> 
											<b>${vo.goods_title}</b>
										</a> 
									</div>
									<span class="stext-105 cl3" style="font-size:17px; color:darkslategray;">
										<span style="color:#28a745;"><fmt:formatNumber value="${vo.goods_price }"/></span>원
									</span>
								</div>
								<div>
									<div style="float: left;"> ${vo.user_area } ${vo.user_addr} </div>
									<div style="float: right;"> 조회 ${vo.viewcount } </div> 
								</div>
							</div>
						</div>
						<c:set var="num" value="${num+1 }" />
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>	
		
		<div class="container">
			<!-- 경매 랜덤 4개 -->
			<c:set var="size" value="${AuctionRand.size() }" />
			<c:set var="col" value="4" />
			<c:set var="row" value="${ Math.ceil(size/col) }" />
			<c:set var="num" value="0" />
	
			<c:forEach begin="1" end="${row }" step="1">
				<c:forEach var="i" begin="1" end="${col }" step="1">
					<c:if test="${num < size}">
						<c:set var="avo" value="${AuctionRand[num]}" />
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women" 
							 style="width: 300px; height: 350px; margin-top: 10px; float: left;">
							<div class="block2">
								<div class="block2-pic hov-img0">
									<img src="${avo.thumbnail }" onerror="this.src='/resources/images/cat.jpg';" style="width: 280px; height: 250px;">
								</div>
								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href="/auction/read?auction_no=${avo.auction_no }" class="stext-103 cl3""> 
											<b>${avo.auction_title}</b>
										</a> 
									</div>
									<span class="stext-105 cl3" style="font-size:17px; color:darkslategray;">
										<c:if test="${avo.auction_bid eq 0}">
											현재 <span style="color:#28a745;"><fmt:formatNumber value="${avo.auction_price }"/></span>원
										</c:if>
										<c:if test="${avo.auction_bid ne 0}">
											현재 <span style="color:#28a745;"><fmt:formatNumber value="${avo.auction_bid }"/></span>원
										</c:if>
									</span>
								</div>
								<div>
									<div style="float: left;">  
										<script>getDate('${avo.auction_cdate.toString().substring(0,10)}','${avo.auction_date.toString().substring(0,10)}')</script>
										<script type="text/javascript">
										function getDate(x,y) {
											var date1 = new Date(x).getTime();
											var date2 = new Date(y).getTime();
											
											document.write("남은 "+(date1-date2)/(1000*60*60*24)+"일");
										}
										</script>
									</div>
									<div style="float: right;"> 조회 ${avo.auction_cnt } </div> 
								</div>
							</div>
						</div>
						<c:set var="num" value="${num+1 }" />
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>	
		
		<!-- load page -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
				더보기
			</a>
		</div>
	</section>
	




<!-- 푸터 -->
<jsp:include page="../include/footer.jsp" />
<%--뭔지모를 스크립트목록 ㅋㅋ~~~~ ↓ --%>

<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/slick/slick.min.js"></script>
<script src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script
	src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});
	$('.js-addwish-b2').each(
			function() {
				var nameProduct = $(this).parent().parent().find(
						'.js-name-b2').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");
					$(this).addClass('js-addedwish-b2');
					$(this).off('click');
				});
			});
	$('.js-addwish-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");
					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});
	/*---------------------------------------------*/
	$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent()
						.parent().find('.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
</script>
<!--===============================================================================================-->
<script
	src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function() {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed : 1,
			scrollingThreshold : 1000,
			wheelPropagation : false,
		});
		$(window).on('resize', function() {
			ps.update();
		})
	});
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>