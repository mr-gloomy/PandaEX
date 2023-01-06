<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- JS -->
<script>
$(document).ready(function(){
	// 상품명 글자수제한
	$("#searchKeyword").keyup(function(e) {
		//alert("@@@@@@@@@@@@@@@@@@@@");
	    console.log("키업!");
		var content = $(this).val();
		$("#textLengthCheck").val("(" + content.length + "/ 30)"); //실시간 글자수 카운팅
		if (content.length > 30) {
			alert("최대 30자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 30));
			$('#textLengthCheck').html("(30 / 최대 30자)");
		}
	});
	
	$("#resetB").click(function() {
		$(".note-editable").empty();
	});

});

</script>

<!--  CSS -->
<style type="text/css">
.card {
    margin: auto;
    margin-top: 130px;
    margin-bottom: 70px;
    width: 1050px;
}
.card-body {
    padding: 4.5rem;
}
.form-check-label {
    padding-left: 0.5rem;
    padding-right: 1.5rem;
    align-content: center;
}
.form {
	align-content: center;
}
.py-4 {
    padding-top: 1rem!important;
}
.btn {
    padding: 3rem 3rem;
    font-size: 1rem;
    line-height: 1.25;
    border-radius: 0.25rem;
}
.form-check-input { 
    position: absolute;
    margin-top: 0.25rem;
    margin-left: -1.25rem;
    accent-color: #28a745;
}
.form-control:focus {
  border-color: #28a745;
}
</style>
</head>
<body class="animsition">

<!-- 본문 -->
<div class="container">
	<div>
		<form method="post" enctype="multipart/form-data">
			<!-- 판매현황 -->
			<input type="text" name="goods_trade" value="판매중">
			<!-- 작성자 -->
			<input type="hidden" name="${sessionScope.user_id}" value="user_id">
				
			<div class="card">
				<div class="card-body">
					<div>
						<div class="col-sm">
							<h2>중고상품 등록</h2><hr>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">이미지 <span class="text-success"></label>
						</div>
						<div class="col-sm d-flex">
<!-- 							<div class="uploadDiv"> -->
<!-- 								<label class="btn btn-outline-success pt-5" >  -->
<!-- 									<i class="fa-solid fa-camera fa-2x"></i><br>  -->
<!-- 									   사진 추가  -->
<!-- 									<input class="form-control d-none" type="file" name="uploadFile" accept=".png, .jpg, .gif" multiple> -->
<!-- 								</label> -->
<!-- 							</div> -->
							<input type="file" name="uploadFile" multiple="multiple">
							
							<script type="text/javascript">
							$(document).ready(function(){
								
								var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
								var maxSize = 5242880; //5MB

								function checkExtension(fileName, fileSize) {

									if (fileSize >= maxSize) {
										alert("파일 사이즈 초과");
										return false;
									}

									if (regex.test(fileName)) {
										alert("해당 종류의 파일은 업로드할 수 없습니다.");
										return false;
									}
									return true;
								}


								$("#uploadBtn").on("click", function(e) {

									var formData = new FormData();
									var inputFile = $("input[name='uploadFile']");
									var files = inputFile[0].files;

									console.log(files);

									for (var i = 0; i < files.length; i++) {

										if (!checkExtension(files[i].name, files[i].size)) {
											return false;
										}

										formData.append("uploadFile", files[i]);

									}
							
									 $.ajax({
										 url: '/regist',
										 processData: false,
										 contentType: false,
										 data: formData,
										 type: 'POST',
										 success : function(result) {
												console.log(result);
												showUploadedFile(result);
										 }
									 }); //$.ajax
								
								});  
							}); 
							</script>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label for="goods_title" class="form-label"></label>
						</div>
						<div class="col-sm">
							<br>* 상품 이미지는 640x640에 최적화 되어 있습니다. 
							<br>- 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다. 
							<br>- 이미지는 상품 등록 시정사각형으로 잘려서 등록됩니다. 
							<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. 
							<br>- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다. 
							<br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다. 
							<br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label for="goods_title" class="form-label">상품명</label>
						</div>
						<div class="col-sm">
							<input type="text" class="form-control" name="goods_title" id="searchKeyword" placeholder="상품명을 입력해주세요" maxlength="30" />
							<div class="text-right mt-1">
								<span class="text-success">
									<input type="text" id="textLengthCheck" style="display: inline-block; text-align: right;">
								</span>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label for="goods_category" class="form-label">카테고리</label>
						</div>
						<div class="col-sm">
							<select class="form-control" id="goods_category" name="goods_category">
								<option selected>카테고리를 입력하세요</option>
								<option value="전자기기">전자기기</option>
								<option value="의류">의류</option>
								<option value="생활가전">생활가전</option>
								<option value="인테리어">인테리어</option>
								<option value="도서">도서</option>
								<option value="교환권">교환권</option>
								<option value="식품">식품</option>
								<option value="기타중고물품">기타중고물품</option>
							</select>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">상품상태</label>
						</div>
						<div class="col-sm">
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_condition" value="새상품"> 
									<label class="form-check-label" for="inlineRadio1">새상품</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_condition" value="거의 새 것"> 
									<label class="form-check-label" for="inlineRadio2">거의 새 것</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_condition" value="사용감 있음"> 
									<label class="form-check-label" for="inlineRadio3">사용감 있음</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">상품환불</label>
						</div>
						<div class="col-sm">
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_refund" value="가능"> 
									<label class="form-check-label" for="inlineRadio1">가능</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_refund" value="불가능"> 
									<label class="form-check-label" for="inlineRadio2">불가능</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">가격제안</label>
						</div>
						<div class="col-sm">
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_discount" value="가능"> 
									<label class="form-check-label" for="inlineRadio1">가능</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_discount" value="불가능"> 
									<label class="form-check-label" for="inlineRadio2">불가능</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">판매가격</label>
						</div>
						<div class="col-sm">
							<input type="number" class="form-control" name="goods_price" placeholder="숫자만 입력하세요" maxlength="9" />
						</div>
						<div class="col-sm align-self-center">원</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">상품소개</label>
						</div>
						<div class="col-sm">
							<textarea id="summernote" name="goods_detail" rows="5" maxlength="1000"></textarea>
							<script>
							 $('#summernote').summernote({
			    			        tabsize: 2,
			    			        height: 150,
			    			        toolbar: [
			    			          ['style', ['style']],
			    			          ['font', ['bold', 'underline', 'clear']],
			    			          ['color', ['color']],
			    			          ['para', ['ul', 'ol', 'paragraph']],
			    			          ['table', ['table']],
			    			          ['insert', ['link', 'picture', 'video']],
			    			          ['view', ['fullscreen', 'codeview', 'help']]
			    			        ]
			    			  });
							 </script>
						</div>
					</div>
					<div class="G_btn" align="center">
						<button type="submit" class="btn btn-success py-2 px-3" id="uploadBtn">작성완료</button>
						<button type="reset" class="btn btn-success py-2 px-3">초기화</button>
						<button onclick="href='/goods/list';" class="btn btn-success py-2 px-3">목록이동</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>