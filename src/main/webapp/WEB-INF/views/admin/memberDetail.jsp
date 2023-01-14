<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>

<div class="col-md-6">
	<div class="box box-solid">

		<h3 class="box-title">사용자 아이디 : ${uvo.user_id }</h3>
		<!-- /.box-header -->
		<div class="box-body">
			<div>닉네임 : ${uvo.user_nick }</div>
			<div>이메일 : ${uvo.user_email }</div>
			<div>전화번호 : ${uvo.user_tel }</div>
			블랙리스트 여부 :
			<form action="/admin/changeblack" method="post">
				<input type="hidden" name="user_no" value="${uvo.user_no }">
				<input type="hidden" name="user_black" value="${uvo.user_black }">
				<c:if test="${uvo.user_black == 0 }">
					<div style="color: blue;">일반회원</div>
				</c:if>
				<c:if test="${uvo.user_black == 1 }">
					<div style="color: red;">블랙회원</div>
				</c:if>
				<button type="submit">
					<c:choose>
						<c:when test="${uvo.user_black == 0  }">블랙</c:when>
						<c:when test="${uvo.user_black == 1  }">일반</c:when>
					</c:choose>
					회원으로 전환

				</button>
			</form>
			<!-- <div>신고사유 : 
				<select>
					<option></option>
					<option></option>
					<option></option>
				</select>
			</div> -->
		</div>


	<!-- <div class="box-body">
		<h3 class="box-title">상품정보</h3>
		<div>구매한 상품 :</div>
		<div>판매중인 상품 :</div>
		<div>:</div>
	</div> -->
	<!-- /.box-body -->
	<button type="button" onclick="location.href='/admin/memberList';">회원목록</button>
</div>
<!-- /.box -->
	</div>
<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>