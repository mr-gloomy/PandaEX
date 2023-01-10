<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/css.jsp" %>


<div class="container d-flex">
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
	<div class="row flex-fill d-flex flex-column">
		<h4 class="row fw-bold my-4 pt-2">회원 탈퇴</h4>
		<div class="alert alert-info text-center" role="alert">
			<h5>정말 저희와<br>
				헤어지실 건가요?
			</h5>
		</div>
		
		<div class="text-center m-2">
				
			<p></p>
				
			<p>탈퇴를 원하신다면<br> 
				현재 비밀번호를 입력해주세요</p>
			
		</div>
	
		<div class="mb-5">

			<form action="exit" method="post">
				<div class="form-group">
					<label for="email">이메일 계정</label>
					<input type="email" name="memberEmail" value="${MemberDTO.userEmail}" readonly id="email"
						class="form-control-plaintext">
				</div>
				<div class="mt-2">
					<label for="pw">비밀번호</label>
					<input type="password" name="memberPw" required placeholder="현재 비밀번호를 입력해주세요" id="pw"
						class="form-control mb-4">
				</div>
				<c:if test="${param.error != null}">
				<div class="row alert alert-primary" role="alert">
					<i class="fa-solid fa-circle-exclamation mr-2 mt-1"></i>
					현재 진행 중인 거래가 존재합니다<br>
				</div>	
				</c:if>
				<div class="mb-5">
					<button type="submit" class="btn btn-secondary btn-block py-2">탈퇴하겠습니다</button>
				</div>
			</form>
		</div>
	
	
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>