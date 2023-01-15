<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icons/PANDA.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<!-- 서머노트를 위해 추가해야할 부분 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- JS -->


<!--  CSS -->
<style type="text/css">
/* .card-body { */
/*     padding: 4.5rem; */
/* } */
/* .form-check-label { */
/*     padding-left: 0.5rem; */
/*     padding-right: 1.5rem; */
/*     align-content: center; */
/* } */
/* .form { */
/* 	align-content: center; */
/* } */
/* .py-4 { */
/*     padding-top: 1rem!important; */
/* } */
/* .btn { */
/*     padding: 3rem 3rem; */
/*     font-size: 1rem; */
/*     line-height: 1.25; */
/*     border-radius: 0.25rem; */
/* } */
/* .form-check-input {  */
/*     position: absolute; */
/*     margin-top: 0.25rem; */
/*     margin-left: -1.25rem; */
/*     accent-color: #28a745; */
/* } */
/* .form-control:focus { */
/*   border-color: #28a745; */
/* } */
</style>
</head>
<body class="animsition">
<!-- 상품찜 -->
<input type="hidden" name="goods_like" value="off">
<!-- 판매현황 -->
<input type="hidden" name="goods_trade" value="0">
<!-- 0:등록, 1:예약 2:완료 -->
<!-- 작성자 -->
<input type="hidden" name="${sessionScope.user_id}" value="user_id">
<!-- 본문 -->
<div class="container" style="margin-top: 90px;">
	<div>
		<form method="post" enctype="multipart/form-data" name="fr">
			<div class="card">
				<div class="card-body">
					<div>
						<div class="col-sm">
							<h2>중고상품 수정하기</h2><hr>
						</div>
					</div>
					<input type="hidden" name="goods_no" value=${vo.goods_no }>
					
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">이미지</label>
						</div>
						<div class="col-sm d-flex">
							<div class="inputArea">
							 <label for="gdsImg"></label>
							 <img src="${vo.thumbnail }" alt="사진없음" style="width: 200px; height: 200px; ">
							 <div class="select_img"><img src="" /></div>
							</div>
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
							<input type="text" class="form-control" name="goods_title" value="${vo.goods_title }"
								   placeholder="상품명을 입력해주세요" maxlength="30" id="searchKeyword"/>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label for="goods_category" class="form-label">카테고리</label>
						</div>
						<div class="col-sm">
							<select class="form-control" id="goods_category" name="goods_category">
								<option value="" selected>카테고리를 다시 입력하세요</option>
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
									<input class="form-check-input" type="radio" name="goods_condition" value="새상품" 
									<c:if test="${vo.goods_condition == '새상품'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio1">새상품</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_condition" value="거의 새 것"
									<c:if test="${vo.goods_condition == '거의 새 것'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio2">거의 새 것</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_condition" value="사용감 있음"
									<c:if test="${vo.goods_condition == '사용감 있음'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio3">사용감 있음</label>
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
									<input class="form-check-input" type="radio" name="goods_refund" value="가능"
									<c:if test="${vo.goods_refund == '가능'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio1">가능</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_refund" value="불가능"
									<c:if test="${vo.goods_refund == '불가능'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio2">불가능</label>
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
									<input class="form-check-input" type="radio" name="goods_discount" value="가능"
									<c:if test="${vo.goods_discount == '가능'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio1">가능</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_discount" value="불가능"
									<c:if test="${vo.goods_discount == '불가능'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio2">불가능</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">거래상태</label>
						</div>
						<div class="col-sm">
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_trade" value="판매중"
									<c:if test="${vo.goods_trade == '판매중'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio1">판매중</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_trade" value="예약중"
									<c:if test="${vo.goods_trade == '예약중'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio2">예약중</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="goods_trade" value="판매완료"
									<c:if test="${vo.goods_trade == '판매완료'}">
									checked									
									</c:if>
									><label class="form-check-label" for="inlineRadio3">판매완료</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">가격</label>
						</div>
						<div class="col-sm">
							<input type="number" class="form-control" name="goods_price" value="${vo.goods_price}"
								   placeholder="숫자만 입력하세요" maxlength="9" />
						</div>
						<div class="col-sm align-self-center">원</div>
					</div>
					<div class="row py-4 border-bottom">
						<div class="col-sm-2">
							<label class="form-label">상품소개</label>
						</div>
						<div class="col-sm">
							<textarea id="summernote" name="goods_detail" rows="5" maxlength="1000" >${vo.goods_detail }</textarea>
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
						<button type="button" class="btn btn-success py-2 px-3" onclick="fun1()">수정완료</button>
						<button onclick="history.back();" class="btn btn-success py-2 px-3">수정취소</button>
						<button onclick="location.href='/goods/remove?goods_no=${vo.goods_no}';" class="btn btn-success py-2 px-3">삭제하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
function fun1() {
	if(document.fr.searchKeyword.value==""){
		alert("상품명을 입력하세요");
		document.fr.goods_title.focus();
		return;
	}
	if(document.fr.goods_category.value==""){
		alert("카테고리를 입력하세요");
		document.fr.goods_category.focus();
		return;
	}
	if(document.fr.goods_condition[0].checked==false && document.fr.goods_condition[1].checked==false
	   && document.fr.goods_condition[2].checked==false){
		alert("상품상태를 선택하세요");
		return;
	}
	if(document.fr.goods_refund[0].checked==false && document.fr.goods_refund[1].checked==false){
		alert("환불여부를 선택하세요");
		return;
	}
	if(document.fr.goods_discount[0].checked==false && document.fr.goods_discount[1].checked==false){
		alert("가격제안 여부를 선택하세요");
		return;
	}
	if(document.fr.goods_price.value==""){
		alert("상품가격을 입력하세요");
		document.fr.goods_price.focus();
		return;
	}
	if(document.fr.goods_detail.value==""){
		alert("내용을 입력하세요");
		document.fr.goods_detail.focus();
		return;
	}
	// 폼태그 내용 서버에 전송
	document.fr.submit();
}

</script>

<!--   푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>