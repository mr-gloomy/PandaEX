<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.16/dist/sweetalert2.all.min.js"></script>

<!-- 헤더 -->
<jsp:include page="../include/header.jsp" />
<!-- css -->
<jsp:include page="../include/css.jsp" />
<!-- remote -->
<jsp:include page="../addon/remote.jsp" />


<br>
<br>
<br>
<br>
<br>
<%-- 	${cvo } --%>
<!-- 글 내용 vo -->

<!-- 제목창 윗부분 -->
<p></p>
<p class="stext-115 cl6 size-213 p-t-18">글 작성일 : ${cvo.regdate }</p>


<!-- 글 내용 -->
<div class="box box-warning">
	<div class="box-header with-border">
		<h3 class="box-title">공지사항</h3>
	</div>

	<div class="box-body">
		<form role="form">
			<!-- 글번호 넘기기 -->
			<input type="hidden" name="bno" value="${cvo.bno }">

			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					placeholder="Enter ..." value=${cvo.title } readonly>
			</div>
			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control"
					placeholder="Enter ..." value=${cvo.writer } readonly>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" readonly>${cvo.content }</textarea>
			</div>



			<!-- 본인글만 가능 -->
			<button type="submit" class="btn btn-block btn-success btn-lg"
				id="btnU">수정</button>
			<button type="submit" class="btn btn-block btn-success btn-lg"
				id="btnR">삭제</button>
			<!-- 본인글만 가능 -->


			<button type="button" class="btn btn-block btn-success btn-lg"
				id="btnL">목록</button>


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

			<div class="form-group">9
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

<!-- jQuery 이용한 버튼으로 페이지이동 -->
<script>
	 $(document).ready(function(){
		var formTag = $("form[role='form']");
		$("#btnU").click(function(){
			
			formTag.attr("action","/admin/modify");
			formTag.attr("method","get");
			formTag.submit();
		});
		$("#btnR").click(function(){
			formTag.attr("action","/admin/remove");
			formTag.attr("method","post");
			formTag.submit();
		});
		$("#btnL").click(function(){
			
			location.href="/admin/list";
			
		});
	}); 
	 
	/*  $(document).ready(function(){
		 
		var formTag = $("form[role='form']");
		
		$("#btnR").click(function(){
			
		Swal.fire({
			  title: '정말 삭제하시겠습니까??',
			  text: "삭제한 글은 복구되지 않습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
					  
			   	formTag.attr("action","/admin/remove");
			  	formTag.attr("method","post");
				formTag.submit();
			  }
			  
			});
		});
	 }); */
	
</script>


<!-- 푸터 -->
<jsp:include page="../include/footer.jsp" />

