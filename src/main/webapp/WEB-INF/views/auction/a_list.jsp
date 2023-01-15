<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icons/PANDA.png">
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#sort").val($("#a_sort").val()).prop("selected", true);
		
		$("#searchA").keydown(function(keyNum){
			if(keyNum.keyCode == 13){ 
				var keyword = $("#searchA").val();
				var sort = $("#sort").val();
				location.href='/auction/a_list?k='+keyword+'&s='+sort;
			}
		})
		
		$('#sort').change(function() {
			var sort = $("#sort").val();
			var keyword = $("#searchA").val();
			location.href='/auction/a_list?s='+sort;
			if (keyword!="") {
				location.href='/auction/a_list?k='+keyword+'&s='+sort;
			}
		});
		
	});
	
	
	function getDate(y) {
		var date1 = new Date().getTime();
		var date2 = new Date(y).getTime();
		
		document.write("남은 "+parseInt((date2-date1)/(1000*60*60*24))+"일");
	}
</script>
</head>
<body>
<br><br><br><br><br><br>
<input type="hidden" value="${param.s}" name="a_sort" id="a_sort">
<section class="bg0 p-t-75 p-b-120" style="align-content:center;">
	<div class="container">
		<div class="box" style="padding:35px; width:100%; text-align:center; border:1px solid #e4e4e4; box-sizing:border-box; margin-bottom:45px;">
			<div>
				<span style="display:block; margin-bottom:30px; font-size:48px; font-weight:bold;">
					<img src="/resources/images/icons/icon_concentrated.png">해피판다</span>
						<c:set var="today" value="<%=new Date()%>" />
  					 	<fmt:formatDate var="today1" pattern="yyyy년 M월 dd일" value="${today }"/>
							<p style="font-size:20px; color:#666;"><span class="panda-date" style="font-weight:bold;">
								${today1 }까지</span><br> 해피판다를 통해<br>
					<span style="color:#28a745; font-weight:bold;">${finishBidInfo.auction_bid_cnt }</span>분이 
					<span style="color:#28a745; font-weight:bold;">
						<fmt:formatNumber value="${finishBidInfo.auction_bid_sum }" /></span>원의<br> 마음을 모아주셨습니다.</p>
			</div>
		</div>
	<div class="flex-w flex-sb-m p-b-52">
	<div class="filter-tope-group" align="center" style="margin-top: 0px;">
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
	
		<div class="flex-w flex-c-m m-tb-10">
            <div class="col pl-0 mr-5">
                <select class="form-select form-select-sm border-0 text-muted" id="sort">
                    <option value="0">최신 등록순</option>
                    <option value="1">입찰가&#8593;순</option>
                    <option value="2">입찰가&#8595;순</option>
                    <option value="3">마감 임박순</option>
                    <option value="4">조회수순</option>
                    <option value="5">종료된 경매</option>
                </select>
            </div>
	
			<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
				<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
				<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
				Search
			</div>
		</div>
		
		<!-- Search product -->
		<div class="dis-none panel-search w-full p-t-10 p-b-15">
			<div class="bor8 dis-flex p-l-15">
				<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="mtext-107 cl2 size-114 plh2 p-r-15" id="searchA" type="text" name="search-product" placeholder="Search" value="${param.k }">
			</div>	
		</div>
	</div>
	
	<div id="auctions" class="row isotope-grid" style="position: relative; height: 4141.62px;">
				<c:forEach var="avo" items="${auctionList }">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${avo.auction_category}" style="position: absolute; left: 0%; top: 0px;">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<c:if test="${avo.auction_bidok eq 0}">
									<a href="/auction/a_read?auction_no=${avo.auction_no }&user_no=${avo.user_no}">
										<img src="${avo.thumbnail }" alt="IMG-PRODUCT" style="width: 290px; height: 250px;"></a>
								</c:if>
								<c:if test="${avo.auction_bidok eq 1}">
										<figure style="margin: 0;">
											<img src="${avo.thumbnail }" alt="IMG-PRODUCT" style="width: 290px; height: 250px; filter: brightness(50%);">
											<figcaption style="position:absolute; font-weight:bold; text-align:center; top:0; width:100%; color:white; margin-top:110px; font-family:Poppins-Regular; font-size:28px;">
												경매종료</figcaption>
										</figure>		
								</c:if>
							</div>
	
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l " style="margin-right:-20px;">
									<c:if test="${avo.auction_bidok eq 0}">
										<a href="/auction/a_read?auction_no=${avo.auction_no }&user_no=${avo.user_no}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" 
										style="font-weight:bold; font-size:17px; color:darkslategray;">
											${avo.auction_title }
										</a>
									</c:if>
									<c:if test="${avo.auction_bidok eq 1}">
										<a class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" 
										style="font-weight:bold; font-size:17px; color:darkslategray;">
											${avo.auction_title }
										</a>
									</c:if>
									
									<span class="stext-105 cl3" style="font-size:17px; color:darkslategray;">
										<c:if test="${avo.auction_bid eq 0}">
											현재 <span style="color:#28a745;"><fmt:formatNumber value="${avo.auction_price }"/></span>원
										</c:if>
										<c:if test="${avo.auction_bid ne 0}">
											현재 <span style="color:#28a745;"><fmt:formatNumber value="${avo.auction_bid }"/></span>원
										</c:if>
									</span>
									<span class="stext-105 cl3">
									<c:if test="${avo.auction_bidok!=1 }">
										 <script>getDate('${avo.auction_cdate.toString().substring(0,10)}')</script>
									</c:if>
									</span>
									<span class="stext-105 cl3" style="color:gray; font-size:13px;">
										조회수 ${avo.auction_viewcount }회
									</span>
								</div>
								
								<div class="block2-txt-child2 flex-r p-t-3" id="${avo.auction_no}" >
									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2" style="margin-right:10px;">
										<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
	</div>
	</div>
</section>
			
	<script type="text/javascript">
		var result = '${result}';
		if(result == 'creatOK') {
			alert("상품등록완료");
		}
		if (result == 'modOK') {
			alert(" 글 수정 완료! ")
		}
		if (result == 'removeOK') {
			alert(" 글 삭제 완료! ")
		}
	</script>
	
<br><br><br><br><br><br>
<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>			
</body>
</html>