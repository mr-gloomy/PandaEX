<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
</head>
<body>
	<br><br><br><br><br><br>

	<!-- 수정,삭제 bno정보를 전달하는 폼태그 -->
	<form role="form" method="post">
	
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">본문내용 수정</h3>
		</div>
	
	
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail1">글 번 호</label> 
					<input type="text" class="form-control" id="exampleInputEmail1" name="bno" value="${avo.auction_no}" readonly>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">제   목</label> 
					<input type="text" class="form-control" id="exampleInputEmail1" name="title" value="${avo.auction_title}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">최초 입찰가</label> 
					<input type="text" class="form-control" id="exampleInputPassword1" name="writer" value="${avo.auction_price }원">
				</div>
				<div class="form-group">
					<label>내   용</label>
					<textarea class="form-control" rows="3" name="content">${avo.auction_detail }</textarea>
				</div>
			</div>
			
	
			<div class="box-footer">
				<button type="submit" class="btn btn-danger">수정</button>
				<button type="reset" class="btn btn-warning">취소</button>
			</div>
	</div>
	</form>


<script type="text/javascript">
	$(document).ready(function(){
		$(".btn-warning").click(function(){
			// 목록으로 이동
			location.href="/auction/a_read?auction_no=${avo.auction_no}";
		});
		
	});
</script>

<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>	
</body>
</html>