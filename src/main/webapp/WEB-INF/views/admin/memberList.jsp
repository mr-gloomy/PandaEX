<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>
	



<div class="container">

	<div class="card">
		<div class="card-body">
			<div class="row p-2 mt-2">
				<h1>회원 목록</h1>
			</div>
		</div>
	</div>
	<div class="row p-2 mt-2">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>회원 등급</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="mvo" items="${memberList }" step="1">
					<tr>
						<td>${mvo.user_id }</td>
						<td>${mvo.user_nick }</td>
						<td>${mvo.user_email }</td>	
							<c:choose>		
								<c:when test="${mvo.user_black == '0' }">				
							<td style="color:black;">일반회원</td>
								</c:when>
								<c:when test="${mvo.user_black == '1' }">				
							<td style="color:red;">블랙회원</td>
								</c:when>
							</c:choose>
						<td><a href="/admin/memberDetail?user_no=${mvo.user_no }">상세보기</a></td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		<div class="p-2 mt-2 text-center pagination">
			<!-- 숫자 링크 영역 -->
			
		<a class="active" href="list?p=1&amp;s=10">1</a>
			<!-- 다음 버튼 영역 -->
		</div>
		
		<div class="row p-2 mt-2">
		
		
			<!-- 검색창(미완성) -->
			<form action="" method="get">
				<div class="row justify-content-md-center">
					<div class="col-2">
						<select name="type" class="form-select">
							<option value="member_nick">닉네임</option>
							<option value="member_email">이메일</option>
						</select>
					</div>
					<div class="col-3">
						<input type="search" name="keyword" placeholder="검색어 입력" required="" class="form-control" value="" autocomplete="off">
					</div>
					<div class="col-2">
						<input type="submit" value="검색" class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>






<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>