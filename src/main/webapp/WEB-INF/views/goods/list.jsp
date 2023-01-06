<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<!-- JS -->

<!-- css -->
<style type="text/css">
.py-5 {
    padding-top: 3rem;
    padding-bottom: 3rem;
	padding-left: 6rem;
}
.how-active1 {
    color: #28a745;
}

.px-2 {
    padding-right: 1rem!important;
    padding-left: 1rem!important;
}
.row {
    margin-top: 100px;
    margin-bottom: 100px;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}
.stext-104 {
    font-family: fangsong;
    font-size: 20px;
    line-height: 2;
}
.stext-105 {
    font-family: ui-monospace;
    font-size: 18px;
    line-height: 1.466667;
    letter-spacing: 1px;
}
.cl4 {
    color: #343a40;
}
</style>
</head>
<body>
<!-- 위치 -->
<div class="container">
  <div class="row">
     <div class="col-8 py-4 px-5 " style="background-color: #ecc84a; border-color: #ecc84a; border-radius: 40px 0px 0px 40px/ 40px 0px 0px 40px;" >
    	<h5 class="text-white mt-1"> 내가 선택한 위치는  </h5>
        <h5 class="text-white"><span class="text-white"><b>{ ** 위치값 넣어주기  ** }</b></span> 입니다</h5>
    </div>
    <div class="col py-4 px-3 bg-light" style="border-radius: 0px 40px 40px 0px/ 0px 40px 40px 0px;">
    	<a href="#" class="btn btn-info" role="button" style="background-color: #ecc84a; border-color: #ecc84a; margin-left: 180px; margin-top: 30px"> 
    		<i>내 위치 변경하기 ▶ </i>
    	</a>
    </div>
  </div>
  <!-- 위치 -->

    <!-- 카테고리 -->
	<div class="filter-tope-group" align="center" style="margin-top: 50px;">
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*"><b>All</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".전자기기"><b>전자기기</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".의류"><b>의류</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".생활가전"><b>생활가전</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".인테리어"><b>인테리어</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".도서"><b>도서</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".교환권"><b>교환권</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".식품"><b>식품</b></button>
		<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".기타중고물품"><b>기타 중고물품</b></button>
	</div>
	<!-- 카테고리 -->
	
	<!-- 메뉴(최신순,인기순 등) -->
	<div class="row mb-4 mt-5">
	    <div class="col-9 mr-5">
	        <h2 class="fw-bold"><b>중고상품</b></h2>
	      
	    </div>
	    <div class="col pl-0" align="right">
	        <select class="form-select form-select-sm border-0 text-muted">
	            <option value="0">최신순</option>
	            <option value="1">인기순</option>
	            <option value="2">조회순</option>
	            <option value="4">판매자 별점순</option>
	        </select>
	    </div>
	 </div>
	<!-- 메뉴(최신순,인기순 등) -->
	
	<!-- 상품목록 -->
	<c:set var="size" value="${GoodsList.size() }" />
	<c:set var="col" value="4" />
	<c:set var="row" value="${ Math.ceil(size/col) }" />
	<c:set var="num" value="0" />
	
	<h7>총 게시글 수 : ${GoodsList.size()}</h7>
	<div class="row isotope-grid">	
		<c:forEach begin="1" end="${row }" step="1">
			<c:forEach var="i" begin="1" end="${col }" step="1">
				<c:if test="${num < size}">
					<c:set var="vo" value="${GoodsList[num]}" />
					<div class="card rounded border-0 mb-4 px-2 isotope-item ${vo.goods_category}" style="width: 300px; height: 380px;">
						<img src="/resources/image/login_bg.jpg" class="rounded float-start" >
<%-- 						<img src="/resources/upload/${vo.thumbnail }" class="rounded" alt="사진없음">  ************************ --%>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/goods/read?goods_no=${vo.goods_no}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<c:choose>
									 	<c:when test="${vo.goods_trade == '판매중'}">			
											<button type="button" class="btn btn-outline-success">${vo.goods_trade}</button>&nbsp; <b>${vo.goods_title }</b>
										</c:when>
									 	<c:when test="${vo.goods_trade == '예약중'}">			
											<button type="button" class="btn btn-outline-warning">${vo.goods_trade}</button>&nbsp; <b>${vo.goods_title }</b>
										</c:when>
									 	<c:otherwise>			
											<button type="button" class="btn btn-outline-secondary">${vo.goods_trade}</button>&nbsp; <b>${vo.goods_title }</b>
										</c:otherwise>
									</c:choose>
								</a>
	
								<span class="stext-105 cl3 text-success">
									<fmt:formatNumber value="${vo.goods_price }" pattern="#,###"/> 원
								</span>
								<span class="stext-106 cl4">
									조회수 ${vo.viewcount } 
									채팅 
								</span>
							</div>
							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					  </div>
					<c:set var="num" value="${num+1 }" />
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
</div>
<!-- 상품목록 -->



<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>