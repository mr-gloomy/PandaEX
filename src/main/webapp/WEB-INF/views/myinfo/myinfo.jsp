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
		<ul class="myp_side" style="border: 1px solid rgb(0 0 0 / 5%);">
			<li class="side_name" style="border-bottom:0px;">마이페이지</li>
			<li class="side_info mypactive">내 정보</li>
			<li class="side_auction">내 경매</li>
			<li class="side_modify">내 정보 수정</li>
			<li class="side_orderlist">내 주문 목록</li>
			<li class="side_pointcharge">포인트 충전</li>
			<li class="side_pointhistory">포인트 충전 내역</li>
			<li class="side_drop">회원탈퇴</li>
		</ul>
		<div class="hide001">
			<div class="myp_info">
				<div class="myp_user">
					<div class="myp_img">
						<img src="/resources/images/icons/dd.jpg" style="width:150px;height:150px; border-radius: 50%;background: #ffffff85;">
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
						<strong>${open }</strong> 
<!-- 						<img -->
<!-- 							src="/resources/images/icons/visit.png" class="shop_icon"> -->
<!-- 						<p style="margin-right: 5px;">상점방문수 :</p> -->
<%-- 						<strong>${visit }명</strong>  --%>
						<img
							src="/resources/images/icons/sell.png" class="shop_icon">
						<p style="margin-right: 5px;">상품판매수 :</p>
						<strong style="margin-right: 10px;">??개</strong>

					</div>
					<div class="myp_shop_3">
						<textarea rows="6" cols="200" maxlength="200" style="overflow: hidden;"></textarea>
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
		<div class="hide003" style="height: 500px;">
		
		<p class="mtop-1">나의 정보 수정</p>
		<strong class="mtop-2">${user.user_name }님의 PANDA 회원개인정보 입니다.
		<br>개인정보를 제3자에게 공유,대여등을 금지합니다.</strong>

			<div class="myp-modify">
				<div class="modify-top">
					<p class="mtop-3">회원 정보</p>
				</div>
				<div class="modify-body">
					<ul class="mbody-1">
						<li>이름</li>
						<li>아이디</li>
						<li>닉네임</li>
						<li>휴대전화</li>
						<li>이메일</li>
						<li>변경할 비밀번호</li>
						<li>비밀번호 재확인</li>
					</ul>
					<form id="modimodi" action="/myinfo/update" method="POST">
					<ul class="mbody-2">
						<li><input type="text" id="namemo" class="nickmo" value="${user.user_name }" name="user_name" maxlength="7"></li>
						<li><input type="text" value="${user.user_id }" name="user_id" readonly></li>
						<li><input type="text" id="mypnick" class="nickmo" name="user_nick" value="${user.user_nick }" maxlength="10"></li>
						<li><input type="text" id="myptel" class="nickmo" value="${user.user_tel }" maxlength="13" name="user_tel"></li>
						<li><input type="text" value="${user.user_email }" readonly></li>
						<li><input type="password" id="myppw" name="user_pw" value="${user.user_pw }" placeholder="변경할 비밀번호" maxlength="20"></li>
						<li><input type="password" class="user_pwchk" value="${user.user_pw }" placeholder="비밀번호 재확인" maxlength="20"><div class="pwerr">비밀번호가 일치하지 않습니다.</div></li>
					</ul>
					 <button type="button" id="update" class="info-modify" >내정보 변경</button> 
					</form>
				</div>
			</div>
		</div>
		<div class="hide007">
		주문목록
		</div>
		<div class="hide004" style="height: 500px;">
			<div class="row flex-fill d-flex flex-column" >
				<div class="col justify-content-center">

					<div class="row fw-bold mt-4 pt-2 justify-content-center">
						<h3 class="text-center">${user.user_nick }님의
							현재 보유 포인트는 <span class="text-info text-center"> <fmt:formatNumber
									value="${user.user_pandapay }" pattern="#,###" /> P
							</span> 입니다.
						</h3>
					</div>
					<div class="row justify-content-center text-muted mt-1">충전은
						결제 즉시 진행되며 1주일 이내에 포인트를 사용하지 않은 상태라면 결제 취소가 가능합니다.</div>
				</div>

				<div class="row justify-content-center mt-4 pt-2">
					<div class="col-9" style="margin-top:120px;">
						<hr>
						<form action="/payment/charge" method="post">

							<div class="row text-start">
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="2000" v-model="chargingMoney"> 2,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="5000" v-model="chargingMoney"> 5,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="10000" v-model="chargingMoney"> 10,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="20000" v-model="chargingMoney"> 20,000원
									</label>
								</div>
							</div>
							<div class="row text-start">
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="30000" v-model="chargingMoney"> 30,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="50000" v-model="chargingMoney"> 50,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="70000" v-model="chargingMoney"> 70,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="100000" v-model="chargingMoney"> 100,000원
									</label>
								</div>
							</div>
							<div class="row text-start">
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="200000" v-model="chargingMoney"> 200,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="300000" v-model="chargingMoney"> 300,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="500000" v-model="chargingMoney"> 500,000원
									</label>
								</div>
								<div class="col-3">
									<label> <input type="radio" name="chargeMoney"
										value="1000000" v-model="chargingMoney"> 1,000,000원
									</label>
								</div>
							</div>
							<hr>
							<div class="d-grid gap-2 mt-1">
								<input type="submit" value="충전하기"
									class="btn btn-primary btn-block" :disabled="!moneySelected()">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="hide005" style="height: 500px;">
			포인트 충전 내역
			<div class="row flex-fill d-flex flex-column">
				<div class="col-7">
					<div class="row my-4 pt-2">
						<div class="col-6">
							<h4 class="fw-bold">내 포인트 충전 내역</h4>
						</div>
					</div>
					<div class="row">
						<table class="table table-hover border-bottom">
							<thead>
								<tr>
									<th scope="col" class="col-2">결제일시</th>
									<th scope="col" class="col-2">충전 금액</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="pvo" items="${pList }">
								<tr v-for="(payment, index) in list" :key="index">
									<td class="text-muted fs-small">{{
										dateFormat(payment.payment_time) }}</td>
									<td class="fw-bold fs-small"><span
										class="text-dark text-truncate">{{
											comma(payment.payment_price) }}</span></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<div class="hide006">
			<div class="delep">회원탈퇴</div>
			<br>
			<div class="deletep1">
				<p class="mypass">본인 비밀번호 입력</p>
				<input type="password" class="user_pwmo" name="user_pw"
					placeholder="Password" style="margin-bottom:25px;">
				<div class="pwerror"></div>
				<input type="hidden" class="pwcksd" value="${user.user_id }">
				<p class="mypeu">회원탈퇴사유</p> 
				
				<input type="radio" name="eu"><p class="radiopo">재 가입을 위해서</p>
				<input type="radio" name="eu"><p class="radiopo">시스템 장애(속도저하, 잦은 에러 등)</p> 
				<input type="radio" name="eu"><p class="radiopo">사용자수 부족 </p>
				<input type="radio" name="eu"><p class="radiopo">개인정보(통신 및 신용정보)의 누출 우려</p> 
				<input type="radio" name="eu"><p class="radiopo">기타</p>
				<input type="button" class="sibals" value="탈퇴하기">
			</div>
			<div class="deletep2" style="display: none;">
			<form id="modimodi" action="/myinfo/delete" method="POST">
			<input type="hidden" name="user_id" value="${user.user_id }">
			<p>고객님의 소중한 개인정보는 탈퇴즉시 파기됩니다.</p>
			<button type="submit" class="delebtn">탈퇴하겠습니다.
			</button>
			</form>
			</div>

		</div>
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