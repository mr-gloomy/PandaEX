<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- css -->
<style type="text/css">
.form-check-input {
	position: absolute;
	margin-top: 0.25rem;
	margin-left: 0rem;
}
.stext-104 {
	font-family: Poppins-Regular;
	font-size: 18px;
	line-height: 1.466667;
}
.cl3 {
	color: #262424;
}
.cl0 {
	color: #1d1d1d;
}

.element.style {
	position: absolute;
	left: 0%;
	top: 0px;
	float: left;
}
</style>
</head>
<body class="animsition">
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-10 p-tb-92">
		<h2 class="ltext-105 cl0 txt-center">중고상품</h2>
	</section>


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120" style="align-content:center;">
		<div class="container">
			<form action="" method="get">
				<!-- 카테고리 -->
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
						    data-filter="*">All</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".machine">전자기기</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".beauty">의류/뷰티/잡화</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".kitchen">생활가전/주방</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".interior">인테리어/가구</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".book">도서/티켓/교환권</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".food">식품</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						    data-filter=".etc">기타 중고물품</button>
						
						
					<!-- 카테고리 -->

					<!-- 위치정보 -->


					<!-- 위치정보 -->

					<!-- Search -->
					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>

				<div class="dis-none panel-search w-full p-t-10 p-b-15"
					style="display: block;">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
					</div>
				</div>
				<!-- Search -->

				<!-- 상품목록 -->
				<c:set var="size" value="${GoodsList.size() }" />
				<c:set var="col" value="4" />
				<c:set var="row" value="${ Math.ceil(size/col) }" />
				<c:set var="num" value="0" />

				<table>
					<div class="row isotope-grid" style="position: relative; height: 0px;">
						<c:forEach begin="1" end="${row }" step="1">
							<c:forEach var="i" begin="1" end="${col }" step="1">
								<c:if test="${num < size}">
										<!-- Block -->
									<c:set var="vo" value="${GoodsList[num]}" />
									  <div class="col-sm-5 col-md-3 col-lg-3 p-b-35 isotope-item ${vo.goods_category} }" style="position: absolute; left: 25%; top: 400px;">
										<div class="block2">
											<div class="block2-txt-child1 flex-col-l ">
												<div class="block2-pic hov-img0">
													<!-- **** 상품 임시파일 **** -->
													<img src="/resources/images/product-04.jpg" alt="IMG-PRODUCT">
													<%-- <img src="/resources/upload/${vo.goods_thumbnail.split(',')[0] } }" class="rounded float-start" alt="null.png"> --%>
													<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
														Quick View 
													</a>
												</div>
											</div>
											<div class="block2-txt flex-w flex-t p-t-14">
												<a href="/goods/read?goods_no=${vo.goods_no}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													${vo.goods_title } 
												</a>
												<!-- 상품 찜 -->
												<div class="block2-txt-child2 flex-r p-t-3">
													<a href="#"
														class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
														<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
														<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
													</a>
												</div>
											</div>
											<span class="stext-105 cl3"> 
												<fmt:formatNumber value="${vo.goods_price }" /> 원
											</span><br> 
											<span class="stext-105 cl3">
												조회수 ${gvo.goods_viewcount } 
												채팅 
											</span>
										</div>
									</div>
								  <c:set var="num" value="${num+1 }" />
							   </c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</table>
				<!-- 상품목록 -->
			</form>
		</div>
	</section>
	<!--   푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>