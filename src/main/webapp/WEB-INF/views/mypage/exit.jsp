<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/css.jsp" %>


<div id="app" class="container d-flex" v-cloak>
<!-- 사이드바 -->

	<div class="row col-3 mt-3">
		<ul class="nav flex-column text-center">
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/main" class="nav-link btn-outline-dark fw-bold fs-large">마이페이지</a>
		  </li>
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/info" class="nav-link btn-outline-info">내 정보 수정</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/goodsSell" class="nav-link btn-outline-info">내 상품</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/goodsBuy" class="nav-link btn-outline-info">구매 내역</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/exit" class="nav-link btn-outline-secondary">회원 탈퇴</a>
		  </li>
		</ul>
	</div>

	<!-- 본문 -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>