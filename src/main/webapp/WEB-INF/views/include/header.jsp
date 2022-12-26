<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>
<!-- Header -->

<header>
	<!-- 임시 -->
	<script>
		function mo() {
			alert('정보수정할래요');
		}
		function lo() {
			alert('로그아웃할래요');
		}
	</script>


	<%-- 변수값은 임시값입니다. --%>
	<c:set var="username" value="김태홍" />
	<c:set var="admin" value="관리자" />
	<c:set var="adminchk" value="1" />
	<!-- 밸류값 0 : 일반유저, 1: 어드민 입니다. -->
	<c:set var="userid" value="null" />
	<!-- 밸류값 null : 비로그인상태, null제외한 다른값 로그인상태화면 -->





	<!-- Header desktop -->
	<div class="container-menu-desktop">

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="index.html" class="logo"> <img
					src="/resources/images/icons/PANDA.png" alt="IMG-LOGO"> <span
					class="maintext">PANDA</span>
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop" style="padding-top: 13px;">
					<ul class="main-menu">
						<li class="active-menu"><a href="index.html">중고거래</a></li>
						<li><a href="#">기부하기</a></li>
					</ul>
				</div>

				<!-- Icon header -->


				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search"
						style="padding-right: 0px;">
						<a href="#" memo="채팅방연동예정"> <img class="panda-header-chaticon"
							src="/resources/images/icons/Panda_Chat.png" alt="panda-chat">
							<img class="panda-header-chaticon-hover"
							src="/resources/images/icons/panda_chat_hover.gif"
							alt="panda-chat-hover">
						</a>
					</div>
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
						style="padding-bottom: 10px; padding-right: 0px;">
						<a href="#" memo="my shop 이동"> <img class="panda-header-shop"
							src="/resources/images/icons/panda-shop.png" alt="panda-shop">
						</a>
					</div>


					<div class="icon-header-item trans-04 p-l-22 p-r-11" id="usersel"
						style="padding-bottom: 10px; padding-right: 15px; display: inline-block;">
						<a memo="내정보"> <img class="panda-header-user"
							src="/resources/images/icons/panda-user.png" alt="panda-user">
						</a>
					</div>
					<div class="hoversup"></div>
					<div class="category">
						<div class="user-sel-images">
							<c:choose>
								<c:when test="${userid eq 'null'}">
									<img class="bamboo" src="/resources/images/icons/bamboo.png"
										style="margin-left: 166px;">
								</c:when>
								<c:when test="${userid ne 'null' and adminchk lt '1' }">
									<img class="bamboo" src="/resources/images/icons/bamboo.png"
										style="height: 88px;">
								</c:when>
								<c:otherwise>
									<img class="bamboo" src="/resources/images/icons/bamboo.png">
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 로그인 시 -->
						<c:choose>
							<c:when test="${userid eq 'null' }">
								<p>
									<strong>로그인</strong> 후 이용해주세요
								</p>
								<q>아이디가 없으시다면?<br> &nbsp;회원가입 후 이용해주세요!
								</q>
								<div class="user-modify">
									<input type="button" class="usermodal" value="로그인"
										style="width: 64.5px; margin-top: 7px;">
								</div>
								<div class="user-logout">
									<input type="button" onclick="location.href='#'" class="logout"
										value="회원가입" style="margin-top: 7px;">
								</div>
							</c:when>
							<c:when test="${userid ne 'null' and adminchk gt '0'}">
								<p>
									<span>${username }</span> 님 환영합니다
								</p>
								<ul>
									<li><a class="my" href="#">내 정보<img class="right"
											src="/resources/images/icons/right-arrow.png"></a></li>
									<li><a class="my" href="#">내 상점<img class="right"
											src="/resources/images/icons/right-arrow.png"></a></li>
								</ul>
								<div class="user-modify">
									<input type="button" onclick="mo()" class="modify" value="정보수정">
								</div>
								<div class="user-logout">
									<input type="button" onclick="lo()" class="logout" value="로그아웃">
								</div>
							</c:when>
							<c:when test="${userid ne 'null' and adminchk lt '1'}">
								<p style="margin-bottom: 5px;">
									<span class="login-admin">${admin }</span> 님 환영합니다
								</p>
								<ul>
									<li><a class="adminmenu" href="#">관리자 메뉴 이동<img
											class="right" src="/resources/images/icons/right-arrow.png"></a></li>
								</ul>
								<div class="user-logout" style="margin-left: 40px;">
									<input type="button" onclick="lo()" class="logout" value="로그아웃"
										style="margin-top: 7px;">
								</div>
							</c:when>
						</c:choose>
						<!-- 로그인 시  -->


					</div>

				</div>
			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<a href="index.html" class="logo"> <img
			src="/resources/images/icons/PANDA.png" alt="IMG-LOGO"> <span
			class="maintext">PANDA</span>
		</a>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
				<i class="zmdi zmdi-search"></i>
			</div>

			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#"
				class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="main-menu-m">
			<li class="active-menu"><a href="index.html">중고거래</a></li>
			<li><a href="#">기부하기</a></li>
		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="/resources/images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>
</header>
</head>

<!-- 로그인 모달창 -->
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<div class="login-modal">
	<div class="modal-body">
		<div class="modal-logo">
			<img src="/resources/images/icons/PANDA.png" alt="IMG-LOGO">
		</div>
		<div class="modal-top">PANDA LOGIN</div>
		<img src="/resources/images/icons/close.png" alt="IMG-close"
			class="modalhide">
		<img src="/resources/images/icons/back.png" alt="IMG-back"
		class="back-joinpage">
		<div class="modal-text">
			<img src="/resources/images/icons/user.png" alt="id입력"
				class="userimg">
			<!-- 			<img src="/resources/images/icons/reset.png" alt="idreset" id="idreset" class="resetimg"> -->
			<input type="text" id="user_id" name="user_id" placeholder="PANDA ID"
				maxlength="15" class="id" onkeypress="chkCapsLock(event)"
				onclick="chkCapsLock(event)" onblur="chkCapsLock1(event)"> <img
				src="/resources/images/icons/pass.png" alt="id입력" class="passimg">
			<!-- 			<img src="/resources/images/icons/reset.png" alt="idreset" id="pwreset"class="resetimg"> -->
			<input type="password" id="user_pw" name="user_pw"
				placeholder="PANDA PW" maxlength="20" class="pass"
				onkeypress="chkCapsLock(event)" onclick="chkCapsLock(event)"
				onblur="chkCapsLock1(event)">
			<div id="capslock"
				style="font-size: 12px; margin: -2px 0 0 200px; color: darkblue; position: absolute;"></div>
			<div class="check-box">
				<label class="chk_id"><input type="checkbox" class="id_save">
					<strong>아이디 저장</strong></label> <label class="show_pw"><input
					type="checkbox" class="pw_show" onclick="chkCapsLock(event)"
					onblur="chkCapsLock1(event)"> <strong>패스워드 보기</strong></label>
			</div>
		</div>
		<div class="login-submit">
			<input type="button" value="로그인" class="submit">
		</div>
		<div class="find">
			<div class="findid">아이디찾기</div>
			<div class="division">│</div>
			<div class="findpw">비밀번호찾기</div>
		</div>
		<div class="join">
			<a>계정이 없으신가요?</a>&nbsp;&nbsp;
			<p id="onclick-join">회원가입</p>
		</div>
		<div class="social-login">
			<img src="/resources/images/icons/division-line.png">
			<p>Social Login</p>
			<img src="/resources/images/icons/division-line.png">
		</div>
			<img class="kakaologin" src="/resources/images/icons/kakao_login_large_wide.png">
		<div class="modal-join">
			<div class="join-text">
				<input type="text" placeholder="아이디" maxlength="10">
				<div id="tooltip" class="idtooltip">아이디는 영어,숫자 5~10글자, 한글사용불가</div>
				<input type="text" placeholder="비밀번호" maxlength="20">
				<div id="tooltip" class="pwtooltip">비밀번호는 영어대소문자,숫자,특수기호 5~20글자, 한글사용불가</div>
				<input id="name" type="text" placeholder="본명">
				<input type="text" placeholder="닉네임" maxlength="10">
				<div id="tooltip" class="nicktooltip">닉네임은 3글자이상, 특수기호 사용불가</div>
				<div class="tellsel">
				<select id="tel" >
				<option id="disabled" selected disabled>통신사</option>
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG U+">LG U+</option>
				</select>
				<input type="tel" placeholder="월요일에 디자인예정" maxlength="13">
				</div>
				<div id="tooltip" class="teltooltip">사용중인 전화번호입니다.</div>
				<div class="findloca">
				<input type="text" id="si" readonly>
				<input type="text" id="gu" readonly>
				<input type="button" id="findlocation" value="버튼">
				</div>
			</div>
		</div>	
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c915430ac4edcd6aa694ae234c0de27"></script>

