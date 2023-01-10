<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<script id="happytalkSDK" src="https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js"></script>
<script type="text/javascript">
var ht = new Happytalk({
    siteId: '4000002564',
    siteName: 'PANDA',
    categoryId: '155093',
    divisionId: '155094',

});
</script>
<script src="/resources/js/myinfo.js"></script>
</head>


<body>

	<%-- <h1>${sessionScope.user_id }</h1> --%>

	<div class="container" style="margin-top: 100px; height: auto; width: 1000px;">
		<ul class="myp_side">
			<li class="side_name">마이페이지</li>
			<li class="side_auction">내 경매</li>
			<li class="side_modify">내 정보 수정</li>
			<li class="side_pointcharge">포인트 충전</li>
			<li class="side_pointhistory">포인트 충전 내역</li>
			<li class="side_drop">회원탈퇴</li>
		</ul>
		<div class="myp_info">
			<div class="myp_user">
				<div class="myp_img">
					<img src="/resources/images/icons/man1.png">
				</div>
				<div class="myp_name">${sessionScope.user_id }</div>
			</div>
			<div class="myp_shop_info">
				<div class="myp_shop_1">
					<div class="myp_shop_name">${sessionScope.user_id }님의 상점</div>

				</div>
				<div class="shop_grade_po">
					<div class="shop_grade">
						<p>상점등급  </p>
						<img src="/resources/images/icons/memberlv4.png" class="shop_icon" style="margin-left:5px;">
					</div>
				</div>
				<div class="myp_shop_2">
					<img src="/resources/images/icons/store.png" class="shop_icons">
					<p style="margin-right: 5px;">상점오픈일 :</p>
					<strong>10일전</strong> <img src="/resources/images/icons/visit.png"
						class="shop_icon">
					<p style="margin-right: 5px;">상점방문수 :</p>
					<strong>100명</strong> <img src="/resources/images/icons/sell.png"
						class="shop_icon">
					<p style="margin-right: 5px;">상품판매수 :</p>
					<strong style="margin-right: 10px;">10개</strong>

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
	

<div class="remote1" style="opacity: 1;">
	<div class="chat-button">
		<img class="kakao" src="/resources/images/icons/kakao-talk.png" alt="">
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