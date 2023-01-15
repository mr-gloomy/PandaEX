<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js">
	
</script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>



	<div class="flex-w flex-sb-m p-b-52">
		<div class="flex-w flex-l-m filter-tope-group m-tb-10">
		
		
			
				
				


		</div>



	<!-- 테이블 시작 -->
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">통합게시판</h3>
		</div>

	<!-- 	<button
			class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
			onclick="location.href='/admin/boardRegist';">글쓰기</button> -->

		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-6">
						<div class="dataTables_length" id="example1_length">
							<form role="form">
							<button
								class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
								name="p_category" value="all" id="btnA">전체</button>
				
							<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
								name="p_category" value="notice" id="btnN">공지사항</button>
				
							<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
								 name="p_category" value="event" id="btnE">이벤트</button>
				
							<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
								name="p_category" value="donate" id="btnD">기부문의</button>
							<br>
							
							
							
							<label> 글 표시갯수
							<select name="perPageNum" id="perpageNum"
								aria-controls="example1" class="form-control input-sm">
								<option value="10" <c:if test="${pvo.cri.perPageNum == 10 }">selected="selected"</c:if>>10</option>
								<option value="25" <c:if test="${pvo.cri.perPageNum == 25 }">selected="selected"</c:if>>25</option>
								<option value="50" <c:if test="${pvo.cri.perPageNum == 50 }">selected="selected"</c:if>>50</option>
								<option value="100" <c:if test="${pvo.cri.perPageNum == 100 }">selected="selected"</c:if>>100</option></select> 
							</label>
							
							
							
							
							</form>
							
						</div>
					</div>
					<div class="col-sm-6">
						<div id="example1_filter" class="dataTables_filter">

							<!-- 검색 -->
							<label>Search: <input type="search"
								class="form-control input-sm" placeholder=""
								aria-controls="example1"></label>
						</div>
					</div>
				</div>




				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable" role="grid"
							aria-describedby="example1_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1" aria-sort="ascending"
										aria-label="Rendering engine: activate to sort column descending"
										style="width: 297.469px;">글 종류</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending"
										style="width: 361.984px;">제목</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending"
										style="width: 322.266px;">작성자</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1" ar
										ia-label="Engine version: activate to sort column ascending"
										style="width: 257.094px;">작성일</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										style="width: 188.188px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${boardList }" step="1">
									<tr role="row" class="odd">
										<td class="sorting_1">
										<c:choose>
											<c:when test="${vo.category.equals('notice') }">공지사항</c:when>
											<c:when test="${vo.category.equals('event') }">이벤트</c:when>
											<c:when test="${vo.category.equals('donate') }">기부문의</c:when>
										</c:choose>
										</td>
										<td><a href="/admin/content?bno=${vo.bno }">${vo.title }</a></td>
										<td>${vo.writer }</td>
										<td><fmt:formatDate value="${vo.regdate }" type="date" /></td>
										<td>${vo.viewcnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="example1_info" role="status"
							aria-live="polite">Showing 1 to 10 of 57 entries</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="example1_paginate">
							<ul class="pagination">
								<li class="paginate_button previous disabled"
									id="example1_previous"><a href="#"
									aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
								<li class="paginate_button active"><a href="#"
									aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
								<li class="paginate_button "><a href="#"
									aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
								<li class="paginate_button next" id="example1_next"><a
									href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>
							</ul>
						</div>
					</div>
				</div> -->
			</div>
		</div>



		<br> <br>

		<div class="box-footer clearfix">
			<ul class="pagination pagination-sm no-margin pull-right">
				<!-- 이전 버튼 -->
				<c:if test="${pvo.prev }">
					<li><a href="/admin/list?page=${pvo.startPage-1 }">이전</a></li>
				</c:if>

				<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }"
					step="1">

					 <li
                <c:out value="${i==pvo.cri.page? 'class=active':''  }" /> 
                ><a href="/admin/list?page=${i }&p_category=${pvo.cri.p_category}&perPageNum=${pvo.cri.perPageNum}">${i }</a></li>

				</c:forEach>


				<!-- 다음 버튼 -->
				<c:if test="${pvo.next }">
					<li><a href="/admin/list?page=${pvo.endPage+1 }">다음</a></li>
				</c:if>

			</ul>

		</div>
	</div>



<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.16/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">
		// alert('${result}'); => EL표현식 -> JS사용 값전달 가능 (DB데이터 사용가능) 
		// ajax호출시 (DB데이터 전달 가능)

		var result = '${result}';

		if (result == 'registOK') {

			Swal.fire(
					  '글 쓰기 성공',
					  '좋은 글이네용',
					  'success'
					)

		} else if (result == 'modOK') {
			
			Swal.fire(
					  '글 수정 성공',
					  '수정하길 잘했어용',
					  'success'
					)
			

		} else if (result == 'remOK') {

			Swal.fire(
					  '글 삭제 성공',
					  '삭제할만하긴 했어용',
					  'success'
					)

		}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj=$("form[role='form']");
		var perPageNum = $("#perpageNum option:selected").val();
		console.log(perPageNum);
		
			$("button[name=p_category]").on('click', function() {
				console.log(formObj);
				formObj.attr("action","/admin/list?perPageNum="+perPageNum);			
				formObj.attr("method","get");
				formObj.submit();
				
			});
			
			$("#perpageNum").change(function(){
				
				formObj.attr("action","/admin/list?perPageNum="+perPageNum);			
				formObj.attr("method","get");
				formObj.submit();
			});
			
			
			
		
	
	
			/* $("#perpageNum").change(function(){
// 			  console.log($(this).val()); //value값 가져오기
			  $.ajax({
				  	type:"post",
					url:"/admins/list",
					data:{"perpageNum" : $(this).val()},
					success:function(data){
						alert('성공');
						console.log(data);
						
						
					},error:function(data){
						alert('에러');
						console.log(data);
						
					}
				  
			  });
		}); */
	});
	</script>




<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>
</body>
</html>