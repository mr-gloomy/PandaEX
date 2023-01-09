<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@include file="/WEB-INF/views/template/header.jsp" %> --%>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="row mt-5 justify-content-center">
		<h2>낙찰이 완료되었습니다!</h2>
	</div>
	<div class="row mt-2 justify-content-center">
		<p class="text-muted">거래 상대방과 대화 후 실제 거래를 완료해주세요.</p>
	</div>
	<div class="row mt-2 justify-content-center">
		<a href="${root}/mypage/pay_history">입찰 내역 보기</a>
	</div>
</div>

<%-- <%@include file="/WEB-INF/views/template/footer.jsp" %> --%>
<%@ include file="../include/footer.jsp" %>
