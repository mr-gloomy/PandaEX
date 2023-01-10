<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/css.jsp" %>

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
		<div class="col">
		<h4 class="row fw-bold my-4 pt-2">내 정보 수정</h4>
		<form action="info" method="post" enctype="multipart/form-data">
			<div class="row mt-4">프로필 사진</div>
			<div class="input-group row center m-1 mb-3">
				<label id="profile-label" class="position-relative">
                    <img id="profile" class="rounded-circle" src="${pageContext.request.contextPath}${profileUrl}"/>
                    <input class="form-control d-none" type="file" name="attachment" accept=".png, .jpg, .gif"/>
                    <a id="profile-hover" class="d-none rounded-circle position-absolute fw-bold text-white">프로필 변경</a>
                </label>
			</div>
				
				<div class="row mt-5">
					<div class="col-7 px-0">
						<label>이메일</label>
						<div class="input-group m-1">
							<input type="email" name="memberEmail" value="${memberDto.memberEmail}" aria-describedby="email-btn" 
								class="email-input form-control bg-white form-control-plaintext fw-bold text-dark" readonly>
							<input type="button" value="인증이 완료되었습니다" class="btn-send-email btn btn-outline-info" id="email-btn" disabled>
						</div>
					</div>
				</div>
		
				
				
				<div class="row mt-5">
					<label>비밀번호</label>
					<div class="input-group row center m-1">
						<button class="btn btn-info btn-send-email">비밀번호 재설정을 위한 링크를 메일 발송해드립니다</button>
					</div>
				</div>
				
				<div class="row mt-5">
					<label>닉네임</label>
					<div class="input-group row center m-1">		
						<input type="text" name="memberNick" value="${memberDto.memberNick}" placeholder="한글 2~10자" 
							class="form-control" aria-describedby="nick-btn" autocomplete="off" required>
	<!-- 					<input type="button" value="닉네임 재설정" class="btn-send-nick btn-outline-info btn-small"  -->
	<!-- 						id="nick-btn" disabled>	 -->
					</div>
		
					<div class="mb-2">
						<span id="valid-nick" class="text-success">사용 가능한 닉네임입니다</span>
						<span id="nick-exists" class="text-info">이미 존재하는 닉네임입니다</span>
						<span id="invalid-nick" class="text-primary">잘못된 닉네임 양식입니다</span>
					</div>		
				</div>
				
				<div class="row mt-5">
					<button type="submit" onkeydown="hitEnterkey(event);" class="btn btn-primary btn-block py-2">정보 수정하기</button>
				</div>
			</form>
		</div>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>


<style scoped>

	#profile {
		object-fit: cover;
	    width: 250px;
	    height: 250px;
	}
	
	#profile-hover {
		top: 0;
	    left: 0;
	    background-color: rgba(111, 117, 246, 0.6);
	    width: 250px;
	    height: 250px;
	    line-height: 250px;
	    text-align: center;
	    cursor: pointer;
	}

</style>