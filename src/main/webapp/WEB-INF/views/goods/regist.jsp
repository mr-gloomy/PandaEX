<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>
<!-- css -->
<style type="text/css">
.form-check-input {
    position: absolute;
    margin-top: 0.25rem;
    margin-left: 0rem;
}
</style>

</head>
<body class="animsition">
  
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('');">
		<h2 class="ltext-105 cl0 txt-center">
			중고상품 등록
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
	  <div class="container">
		<form method="post">
		  <div class="row mb-3">
		 	<!-- 숨겨진항목 --> 
		    <input type="hidden" name="goods_no">
		    <input type="hidden" name="goods_donation" value="0"> <!-- 0: 중고상품 1: 기부상품 -->
		    <input type="hidden" name="goods_like" value="1"> <!-- 0: on 1: off -->
		    <input type="hidden" name="goods_trade" value="0"> <!-- 0:거래전, 1:거래중, 2:거래후 --> 
		    
		    <!-- 보이는 항목 -->
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상품이미지</label>
		    <div class="col-sm-10">
		      <input type="file" name="goods_image" accept="image/jpg, image/jpeg, image/png" multiple="">
			  <div class="sc-hkaZBZ fIHSLw">
				<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b> 
				<br>- 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다. 
				<br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다. 
				<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. 
				<br>- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다. 
				<br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다. 
				<br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
			  </div>
		    </div>
		    
		    <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리</label>
		    <div class="col-sm-10">
			  <div class="sc-hkaZBZ fIHSLw">
			  	<select class="form-select" name="goods_category" >
				  <option selected>카테고리를 입력하세요</option>
				  <option value="All">All</option>
				  <option value="전자기기">전자기기</option>
				  <option value="의류/뷰티/잡화">의류/뷰티/잡화</option>
				  <option value="생활가전/주방">생활가전/주방</option>
				  <option value="인테리어/가구">인테리어/가구</option>
				  <option value="도서/티켓/교환권">도서/티켓/교환권</option>
				  <option value="식품">식품</option>
				  <option value="기타 중고물품">기타 중고물품</option>
				</select>
			  </div>
		    </div>
		    
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="goods_title" placeholder="제목을 입락하세요.">
		    </div>
		    
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상품상태</label>
		    <div class="col-sm-10">
		       <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_condition" value="0">
				  <label class="form-check-label" for="inlineRadio1">새상품</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_condition" value="1">
				  <label class="form-check-label" for="inlineRadio2">거의 새 것</label>
			  	</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_condition" value="2">
				  <label class="form-check-label" for="inlineRadio3">사용감 있음</label>
			  	</div>
		   	</div><br/>
		   	
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상품환불여부</label>
		    <div class="col-sm-10">
		       <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_refund" value="0">
				  <label class="form-check-label" for="inlineRadio1">가능</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_refund" value="1">
				  <label class="form-check-label" for="inlineRadio2">불가능</label>
			  	</div>
		   	</div><br/>
		   	
		    <label for="inputEmail3" class="col-sm-2 col-form-label">가격제안여부</label>
		    <div class="col-sm-10">
		       <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_discount" value="0">
				  <label class="form-check-label" for="inlineRadio1">가능</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_discount" value="1"> 
				  <label class="form-check-label" for="inlineRadio2">불가능</label>
			  	</div>
		   	</div><br/>
		    
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상품가격</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="goods_price" placeholder="금액을 입력하세요.">
		    </div>
		    
		    <label for="inputEmail3" class="col-sm-2 col-form-label">상세설명</label>
		    <div class="col-sm-7">
		    	<textarea name="goods_detail" class="form-control" rows="5" placeholder="내용을 입력하세요."></textarea>
		    </div>
		  </div>
		 
		<!-- 버튼 -->
		<div class="col-sm-7" align="center">
             <button type="submit" class="btn btn-primary">작성완료</button>
             <button type="reset" class="btn btn-primary">초기화</button>
             <button type="submit" class="btn btn-primary">목록이동</button>
	  	</div>
	  </form>
     </div>
	</section>	

<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>