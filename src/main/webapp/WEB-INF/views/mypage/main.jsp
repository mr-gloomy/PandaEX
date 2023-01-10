<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/css.jsp" %>


<div class="container d-flex">
<!-- 사이드바 -->

	<div class="row col-3 mt-3">
		<ul class="nav flex-column text-center">
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/index" class="nav-link btn-outline-dark fw-bold fs-large">마이페이지</a>
		  </li>
		  <li class="nav-item border-bottom">
		  	<a href="${root}/mypage/info" class="nav-link btn-outline-info">내 정보 수정</a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/goodsSell" class="nav-link btn-outline-info">판매 내역 </a>
		  </li>
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/goodsBuy" class="nav-link btn-outline-info">구매 내역 </a>
		  </li>
		  <li class="nav-item border-bottom">
			<a href="${root}/mypage/likeList" class="nav-link btn-outline-info">찜 목록 </a>
		  </li>		  
		  <li class="nav-item border-bottom">
		    <a href="${root}/mypage/exit" class="nav-link btn-outline-secondary">회원 탈퇴</a>
		  </li>
		</ul>
	</div>
		
	<!-- 본문 -->
	<div class="row flex-fill d-flex flex-column">
		<h4 class="row fw-bold my-4 pt-2">마이페이지</h4>
		<div class="row col-3 m-3 d-inline center">
			<div>
				<img src="${pageContext.request.contextPath}${profileUrl}"
					id="profile" class="rounded-circle center-block">
			</div>
			<div>${memberVO.user_name}</div>
			<div>${memberVO.user_email}</div>
		</div>
		
		
		
		<div class="row m-5 d-inline">
			<table class="table-borderless table-responsive table-sm mt-3">
				<tr>
					<th class="text-left" style="width:50%;">전화번호 </th>
					<td class="text-right">
							${memberVO.user_tel} <i class="fa-solid fa-chevron-right"></i>
					</td>
				</tr>
				<tr>
					<th class="text-left">닉네임 </th>
					<td class="text-right">
							${memberVO.user_nick} <i class="fa-solid fa-chevron-right"></i>
					</td>
				</tr>
				<tr>
					<th class="text-left">등급 </th>
					<td class="text-right">
							${memberVO.user_grade} <i class="fa-solid fa-chevron-right"></i>

					</td>
				</tr>
				<tr>
					<th class="text-left">거래 위치 </th>
					<td class="text-right">
						${memberVO.user_area} <i class="fa-solid fa-chevron-right"></i>
					</td>
				</tr>

			</table>			
			
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

</style>