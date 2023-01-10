<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<tr>
						<td></td>
						<td></td>
						<td></td>								
						<td style="color:black;">일반회원</td>
						<td><a href="/auctionara/admin/member/detail/164">상세보기</a></td>
					</tr>
			</tbody>
		</table>
		<div class="p-2 mt-2 text-center pagination">
			<!-- 숫자 링크 영역 -->
			
		<a class="active" href="list?p=1&amp;s=10">1</a>
			<!-- 다음 버튼 영역 -->
		</div>
		
		<div class="row p-2 mt-2">
			<!-- 검색창 -->
			<form action="list" method="get">
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






<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.16/dist/sweetalert2.all.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#theForm').submit(function(event) {

			// 자동 submit을 시키는 것을 막는다.
			event.preventDefault();

			// 초기값은 false로 셋팅을 한다.
			var isSubmit = false;

			if ($("input[name=title]").val() == "") {
				Swal.fire({
					icon : 'error',
					title : '제목을 작성하세요!'
				})
				isSubmit = false;
			}

			else if ($("input[name=writer]").val() == "") {
				Swal.fire({
					icon : 'error',
					title : '작성자명을 작성하세요!'
				})
				isSubmit = false;
			}

			else if ($("#id_select").val() == null) {
				Swal.fire({
					icon : 'error',
					title : '카테고리를 선택하세요!'
				})

				isSubmit = false;
			}

			else {
				isSubmit = true;
			}

			if (isSubmit)
				this.submit();

		});

	});
</script>
<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>