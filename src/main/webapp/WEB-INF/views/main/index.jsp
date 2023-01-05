<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 헤더 -->
<jsp:include page="../include/header.jsp" />
<!-- css -->
<jsp:include page="../include/css.jsp" />
<!-- remote -->
<jsp:include page="../addon/remote.jsp" />



</head>
<body class="animsition">




	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1"
					style="background-image: url(/resources/images/slide-01.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Women Collection
									2018 </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">NEW SEASON
								</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="zoomIn" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Shop Now </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(/resources/images/slide-02.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Men New-Season </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">Jackets &
									Coats</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="slideInUp" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Shop Now </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(/resources/images/slide-03.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2"> Men Collection 2018
								</span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">New
									arrivals</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateIn" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Shop Now </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%-- 중고마켓 / 기부 바로가기 로 사용예쩡--%>
	<!-- 	<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					Block1
					<div class="block1 wrap-pic-w">
						<img src="/resources/images/banner-01.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8"> Women</span>
								 <span class="block1-info stext-102 trans-04"> Spring 2018 </span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					Block1
					<div class="block1 wrap-pic-w">
						<img src="/resources/images/banner-02.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8"> Men </span>

								<span class="block1-info stext-102 trans-04"> Spring 2018
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					Block1
					<div class="block1 wrap-pic-w">
						<img src="/resources/images/banner-03.jpg" alt="IMG-BANNER">

						<a href="product.html"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Accessories </span> <span class="block1-info stext-102 trans-04">
									New Trend </span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05"> 
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	 -->
	<%-- 중고마켓 / 기부 바로가기 로 사용예쩡--%>

	<%--추천상품 섹션 --%>
	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140"
		style="padding-bottom: 15px; padding-top: 30px;">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5"
					style="color: #505050; cursor: context-menu; opacity: 0.8;">너의
					취향대로 PANDA!</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button
						class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
						data-filter="*">All Products</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".women">Women</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".men">Men</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".bag">Bag</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".shoes">Shoes</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter=".watches">Watches</button>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Filter
					</div>

					<!-- 					<div -->
					<!-- 						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search"> -->
					<!-- 						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i> -->
					<!-- 						<i -->
					<!-- 							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i> -->
					<!-- 						Search -->
					<!-- 					</div> -->
				</div>


			</div>
			<!-- 검색필터 -->
			<div class="main-filter">
				<div class="filter-body">
					<div class="filter-category">
						<ul class="filter-option">
							<li>카테고리</li>
							<li>상품상태</li>
							<li>환불여부</li>
							<li>가격범위</li>
						</ul>
					</div>
					<div class="filter-solt">
						<div class="filter-category-sel">
							<ul class="select-category">
								<li>전자기기</li>
								<li>의류/뷰티/잡화</li>
								<li>생활가전/주방</li>
								<li>인테리어/가구</li>
								<li>도서/티켓/교환권</li>
								<li>식품</li>
								<li>기타 중고물품</li>
							</ul>
						</div>
						<div class="filter-condition-sel">
							<ul class="select-condition">
								<li>새상품</li>
								<li>거이 새 것</li>
								<li>사용감 있음</li>
							</ul>
						</div>
						<div class="filter-discount-sel">
							<ul class="select-discount">
								<li>가능</li>
								<li>불가능</li>
							</ul>
						</div>
						<div class="filter-price-sel">
							<ul class="select-price">
								<li>1만원 이하</li>
								<li>1만원 ~ 3만원</li>
								<li>3만원 ~ 5만원</li>
								<li>5만원 ~ 10만원</li>
								<li class="direct-input">직접입력
									<div class="low-price">
										<input type="text" title="최소가격입력" value="0" placeholder="100">
									</div>
									<p class="price-division">~</p>
									<div class="max-price">
										<input type="text" title="최대가격입력" value="0" placeholder="10000">
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색필터 -->
		</div>
	</section>
	<%--추천상품 섹션 --%>
	<%--상품들~~ --%>
	<section class="rek">
		<div class="rek-item-container">
			<div class="rek-ad">
				<div class="ad-1" id="ad-all">
					<div class="rekcontent" memo="추천상품시작">
						<img src="/resources/images/icons/ads.png" id="rek-tag1">
						<div class="rekimage">
							<img src="/resources/images/icons/PANDA.png">
						</div>
						<div class="rektext">
							<div class="rek-info">
								<div class="rek-shopname">판다몰</div>
								<div class="rek-price">10000원</div>
								<div class="rek-location">부산광역시 진구 부전동</div>
								<div class="rek-interest">관심 5</div>
							</div>
							<div class="rek-go">
								<div class="rek-go-btn">
									<a href="#">자세히 보기</a>
								</div>
							</div>
						</div>
					</div memo="추천상품끝">
				</div>
				<div class="ad-2" id="ad-all">
					<div class="rekcontent" memo="추천상품시작">
						<img src="/resources/images/icons/ads.png" id="rek-tag1">
						<div class="rekimage">
							<img src="/resources/images/icons/PANDA.png">
						</div>
						<div class="rektext">
							<div class="rek-info">
								<div class="rek-shopname">판다몰</div>
								<div class="rek-price">10000원</div>
								<div class="rek-location">부산광역시 진구 부전동</div>
								<div class="rek-interest">관심 5</div>
							</div>
							<div class="rek-go">
								<div class="rek-go-btn">
									<a href="#">자세히 보기</a>
								</div>
							</div>
						</div>
					</div memo="추천상품끝">
				</div>
			</div>
			<div class="rek-item-rank">
				<div class="rank1-3">
					<div class="rank-1" id="rekrank">
						<div class="rank-1-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/one.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
					<div class="rank-2" id="rekrank">
						<div class="rank-2-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/two.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
					<div class="rank-3" id="rekrank">
						<div class="rank-3-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/three.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
				</div>
				<div class="rank4-6">
					<div class="rank-4" id="rekrank">
						<div class="rank-4-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/four.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
					<div class="rank-5" id="rekrank">
						<div class="rank-5-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/five.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
					<div class="rank-6" id="rekrank">
						<div class="rank-6-item">
							<div class="rekcontent" memo="추천상품시작">
								<img src="/resources/images/icons/rekmark.png" id="rek-mark">
								<img src="/resources/images/icons/six.png" id="rek-tag">
								<div class="rekimage">
									<img src="/resources/images/icons/PANDA.png">
								</div>
								<div class="rektext">
									<div class="rek-info">
										<div class="rek-shopname">판다몰</div>
										<div class="rek-price">10000원</div>
										<div class="rek-location">부산광역시 진구 부전동</div>
										<div class="rek-interest">관심 5</div>
									</div>
									<div class="rek-go">
										<div class="rek-go-btn">
											<a href="#">자세히 보기</a>
										</div>
									</div>
								</div>
							</div memo="추천상품끝">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%--상품들~~ --%>

	<%--이벤트 칸 --%>
	<section class="event-section">
		<div class="event-body">
			<div class="event-body-1">
				<div class="body-1-1">
					<img src="/resources/images/eventsmall1.jpg">
				</div>
				<div class="body-1-2">
					<img src="/resources/images/eventsmall2.png">
				</div>
			</div>
			<div class="event-body-2">
				<div class="body2-1">
					<img src="/resources/images/eventbanner-chat.png">
					<div class="p">
						<p>24시간 간편한 채팅상담 중고거래 궁금증을 해결해드려요!</p>
					</div>
				</div>
			</div>

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