<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>

		<!-- 글 내용 vo -->

		<!-- 제목창 윗부분 -->
		<p class="stext-115 cl6 size-213 p-t-18">글 작성일 : ${cvo.regdate }</p>


<!-- 글 내용 -->
<div class="box box-warning">
	<div class="box-header with-border">
		<h3 class="box-title">공지사항</h3>
	</div>

	<div class="box-body">
		<form role="form" method="post">
			
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					 value=${cvo.title } name="title">
			</div>
			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control"
				 value=${cvo.writer } name="writer" readonly>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea rows="5" name="content"
				   style="width: 1469px; height: 287px;">${cvo.content }</textarea>
			</div>



			
			
			<button type="submit" class="btn btn-block btn-success btn-lg" >수정하기</button>
			
			
			<!-- <div class="form-group">
				<label>Select</label> <select class="form-control">
					<option>option 1</option>
					<option>option 2</option>
					<option>option 3</option>
					<option>option 4</option>
					<option>option 5</option>
				</select>
			</div>
			<div class="form-group">
				<label>Select Disabled</label> <select class="form-control"
					disabled="">
					<option>option 1</option>
					<option>option 2</option>
					<option>option 3</option>
					<option>option 4</option>
					<option>option 5</option>
				</select>
			</div>

			<div class="form-group">
				<label>Select Multiple</label> <select multiple=""
					class="form-control">
					<option>option 1</option>
					<option>option 2</option>
					<option>option 3</option>
					<option>option 4</option>
					<option>option 5</option>
				</select>
			</div>
			<div class="form-group">
				<label>Select Multiple Disabled</label> <select multiple=""
					class="form-control" disabled="">
					<option>option 1</option>
					<option>option 2</option>
					<option>option 3</option>
					<option>option 4</option>
					<option>option 5</option>
				</select>
			</div> -->
		</form>
	</div>

</div>





<!-- 푸터 -->
<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>

