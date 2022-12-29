<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>
<!-- css -->
<style type="text/css">
.form-check-input {
    position: absolute;
    margin-top: 0.25rem;
    margin-left: 0rem;
}

</style>
</head>
<body class="animsition">
 	<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('');">
	<h2 class="ltext-105 cl0 txt-center">
		중고거래
	</h2>
</section>	

<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
  <div class="container">
	<form action="" method="get">
		<!-- 카테고리 -->
		<div class="flex-w flex-l-m filter-tope-group m-tb-10">
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*"> All Products </button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".전자기기">전자기기</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".의류/뷰티/잡화">의류/뷰티/잡화</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".생활가전/주방">생활가전/주방</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".인테리어/가구">인테리어/가구</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".도서/티켓/교환권">도서/티켓/교환권</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".식품">식품</button>
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".기타 중고물품">기타 중고물품</button>
		<!-- 카테고리 -->
		
		<!-- 위치정보 -->


		<!-- 위치정보 -->
		
		<!-- Search -->
			<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
				<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
				<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
				Search
			</div>
		</div>

		<div class="dis-none panel-search w-full p-t-10 p-b-15" style="display: block;">
			<div class="bor8 dis-flex p-l-15">
				<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>

				<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
			</div>	
		</div>
		<!-- Search -->                                                                                                                      
		
		<!-- 상품목록 -->
		<div class="row isotope-grid" style="position: relative; height: 1721.62px;">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item watches" style="position: absolute; left: 25%; top: 430px;">
				<!-- Block -->
				<c:forEach var="gvo" items="${GoodsList }">
					<div class="block2">
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/goods/read?goods_no=${gvo.goods_no}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${gvo.goods_title }
								</a>
								<span class="stext-105 cl3">
									${gvo.goods_price }
								</span>
								<span class="stext-105 cl3">
									조회수 ${gvo.goods_viewcount }
								</span>
							</div>
	
							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 상품목록 -->
		
		
		
	</form>
  </div>
</section>
<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>