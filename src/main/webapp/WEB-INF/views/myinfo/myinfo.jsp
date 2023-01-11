<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script id="happytalkSDK"
	src="https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js"></script>
<script type="text/javascript">
	var ht = new Happytalk({
		siteId : '4000002564',
		siteName : 'PANDA',
		categoryId : '155093',
		divisionId : '155094',

	});
</script>
<script src="/resources/js/myinfo.js"></script>
</head>


<body>
	<c:set var="user" value="${memberVO }" />
	<fmt:formatDate var="open" pattern="yyyy년 MM월 dd일"
		value="${user.user_regdate }" />
	<fmt:formatNumber var="visit" pattern="#,###"
		value="${user.user_visit }" />



	<div class="container"
		style="margin-top: 100px; height: auto; width: 1000px;">
		<ul class="myp_side">
			<li class="side_name" style="border-bottom:0px;">마이페이지</li>
			<li class="side_info mypactive">내 정보</li>
			<li class="side_auction">내 경매</li>
			<li class="side_modify">내 정보 수정</li>
			<li class="side_pointcharge">포인트 충전</li>
			<li class="side_pointhistory">포인트 충전 내역</li>
			<li class="side_drop">회원탈퇴</li>
		</ul>
		<div class="hide001">
			<div class="myp_info">
				<div class="myp_user">
					<div class="myp_img">
						<img src="/resources/images/icons/man1.png">
					</div>
					<div class="myp_name">${user.user_name }</div>
				</div>
				<div class="myp_shop_info">
					<div class="myp_shop_1">
						<div class="myp_shop_name">${user.user_nick }님 상점</div>

					</div>
					<div class="shop_grade_po">
						<div class="shop_grade">
							<p>상점등급</p>
							<c:choose>
								<c:when test="${user.user_grade eq 0 }">
									<img src="/resources/images/icons/memberlv1.png"
										class="shop_icon" style="margin-left: 5px;">
								</c:when>
								<c:when test="${user.user_grade eq 1 }">
									<img src="/resources/images/icons/memberlv2.png"
										class="shop_icon" style="margin-left: 5px;">
								</c:when>
								<c:when test="${user.user_grade eq 2 }">
									<img src="/resources/images/icons/memberlv3.png"
										class="shop_icon" style="margin-left: 5px;">
								</c:when>
								<c:when test="${user.user_grade eq 3 }">
									<img src="/resources/images/icons/memberlv4.png"
										class="shop_icon" style="margin-left: 5px;">
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="myp_shop_2">
						<img src="/resources/images/icons/store.png" class="shop_icons">
						<p style="margin-right: 5px;">상점오픈일 :</p>
						<strong>${open }</strong> <img
							src="/resources/images/icons/visit.png" class="shop_icon">
						<p style="margin-right: 5px;">상점방문수 :</p>
						<strong>${visit }명</strong> <img
							src="/resources/images/icons/sell.png" class="shop_icon">
						<p style="margin-right: 5px;">상품판매수 :</p>
						<strong style="margin-right: 10px;">??개</strong>

					</div>
					<div class="myp_shop_3">
						<textarea rows="6" cols="200" maxlength="200"></textarea>
						<input type="button" value="상점소개수정">
					</div>
				</div>

			</div>

			<div class="myp_subtab">
				<div class="myp_subtab1 myp_subtab_active">판매 상품</div>
				<div class="myp_subtab2">상점 후기</div>
				<div class="myp_subtab3">찜한 상품</div>
				<div class="myp_subtab4">구매 상품</div>
			</div>

			<!-- 	<div class="myp_subtab"> -->
			<!-- 		<a class="myp_subtab1 myp_subtab_active">판매 상품</a> -->
			<!-- 		<a class="myp_subtab2">상점 후기</a> -->
			<!-- 		<a class="myp_subtab3">찜한 상품</a> -->
			<!-- 		<a class="myp_subtab4">구매 상품</a> -->
			<!-- 		<a class="myp_subtab5">회원 정보 관리</a> -->
			<!-- 	</div> -->


			<div class="myp_sell_goods">
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>

				<!-- 더미 -->
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>
				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>

				<div class="sell_goods_set">
					<div class="set_position">
						<img src="/resources/images/icons/myloveuza.jpg">
						<p class="sellgoodsname">상&nbsp;&nbsp;품&nbsp;&nbsp;명 : 아이패드</p>
						<p>상품가격 : 500,000원
						<p>
							<input type="button" value="수정" class="goods_modify"> <input
								type="button" value="삭제" class="goods_remove">
					</div>
				</div>
				<!-- 더미 -->
			</div>
			<div class="myp_shop_review"></div>
			<div class="myp_zzim"></div>
			<div class="myp_buy_goods"></div>
		</div>
		<!-- 001 hide -->
		<div class="hide002">내 경매</div>
		<div class="hide003">내 정보 수정</div>
		<div class="hide004">포인트 충전</div>
		<div class="hide005">포인트 충전 내역</div>
		<div class="hide006">회원탈퇴</div>
	</div>


	<div class="remote1" style="opacity: 1;">
		<div class="chat-button">
			<img class="kakao" src="/resources/images/icons/kakao-talk.png"
				alt="">
			<!-- 카카오챗 -->
			<img class="chat-bot" src="/resources/images/icons/chat-bot.png"
				alt="">
			<!-- 챗봇 -->
		</div>
		<div class="move-top">
			<a href="#"><img class="top"
				src="/resources/images/icons/up-arrow.png" alt="top"></a>
		</div>
	</div>
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>