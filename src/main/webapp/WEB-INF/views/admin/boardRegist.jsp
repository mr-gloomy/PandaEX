<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>

<div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">게시판 글 작성 </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form name="theForm" id="theForm" action="" method="post">
                <!-- text input -->
                <div class="form-group">
                  <label>제목 </label>
                  <input type="text" class="form-control" placeholder="Enter ..." name="title">
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>글 내용 </label>
                  <textarea class="form-control" rows="3" placeholder="Enter ..." name="content"></textarea>
                </div>

                <!-- select -->
                <div class="form-group">
                  <label>카테고리 </label>
                  <select class="form-control" name="category" id="id_select">
                <option value selected disabled hidden>카테고리를 선택하세요</option>
                <option value="notice">공지사항</option>
				<option value="event">이벤트</option>
				<option value="donate">기부문의</option>
                  </select>
                </div>

              <input type="submit" class="btn btn-block btn-default" value="글 쓰기">
              </form>
              <button type="button" class="btn btn-block btn-default"
              onclick="location.href='/admin/list';">글 목록 </button>
            </div>
            <!-- /.box-body -->
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