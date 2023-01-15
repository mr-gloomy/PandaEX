<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- JS -->

<!-- css -->
<style type="text/css">
.py-5 {
    padding-top: 3rem;
    padding-bottom: 3rem;
	padding-left: 10rem;
}
.how-active1 {
    color: #28a745;
}
.show-search:hover:after, .show-filter:hover:after {
    background-color: #28a745;
    border-color: #28a745;
}
.row {
    margin-top: 20px;
    margin-bottom: 60px;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
}
.stext-104 { /* 상품명 말줄임표 넣ㄱ*/
	width: 260px;
	font-family: sans-serif;
	font-size: 16px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow:ellipsis;
	
}
.stext-105 {
    font-family: ui-monospace;
    font-size: 16px;
    line-height: 1.466667;
    letter-spacing: 1px;
}
.cl4 {
    color: #343a40;
}
.flex-c-m {
    justify-content: center;
    -ms-align-items: center;
    align-items: center;
    margin-left: 18px;
}
.container {
    max-width: 80%;
    margin-left: auto;
}
.wrap-menu-desktop {
	top:0px;
}
.hov-btn3:hover {
    border-color: #28a745;
    background-color: #28a745;
    color: #fff;
}
.hov-cl1:hover {
    color: #28a745;
}
</style>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c915430ac4edcd6aa694ae234c0de27"></script>
<script type="text/javascript">
$(function() {
	
	$("#sort").val($("#g_sort").val()).prop("selected", true);
	
	var keyword = $("#searchA").val().trim();
	var sort = $("#sort").val();
	var si = $("#locationS").val();
	var gu = $("#locationG").val();
	var si2 = $("#locationS2").val();
	var gu2 = $("#locationG2").val();
	
	if (si2!="" && si=="") {
		location.href='/goods/list?k='+keyword+'&s='+sort+'&l='+si2+'&ll='+gu2;
	}
	
	$("#searchA").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			keyword = $("#searchA").val().trim();
			location.href='/goods/list?k='+keyword+'&s='+sort+'&l='+si+'&ll='+gu;
		}
	})
	
	$('#sort').change(function() {
		sort = $("#sort").val();
		location.href='/goods/list?k='+keyword+'&s='+sort+'&l='+si+'&ll='+gu;
	});
	
});
$(function() {
	   $('#findlocationH').on('click', function() {
	   	if($('#us').val()!="") {
	      navigator.geolocation.getCurrentPosition(function(position) {
	         var error = "위치정보 조회실패";
	         var error2 = "위치정보 조회를 동의 후 재시도해주세요";
	         var succe = "위치조회가 완료되었습니다.";
	         var userlat = position.coords.latitude;
	         var userlong = position.coords.longitude;
	         var href = window.location.href;
	         var userlocation = {
	               "userlat" : userlat,
	               "userlong" : userlong
	         };
	         $.ajax({
	            type : "get",
	            url : href,
	            data : userlocation,
	            async:false,
	            success : function(data) {
	               $.ajax({
	                  type : 'get',
	                  url : "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+userlong+"&y="+userlat,
	                  headers: {
	                          Authorization: "KakaoAK 02cf39cd2fef571915d16c04ab4e60f7"
	                      },
	                      datatype : 'json',
	                      async:false,
	                  success : function(data){      
	                     var address = JSON.stringify(data);
	                     var addp = JSON.parse(address);
	                     var si = addp.documents[0].region_1depth_name;
	                     var gu = addp.documents[0].region_2depth_name;
	                     var keyword = $("#searchA").val();
	         			 var sort = $("#sort").val();
	                     $('#locationH').html(si+","+gu);
	                     
	                     location.href='/goods/list?k='+keyword+'&s='+sort+'&l='+si+'&ll='+gu;
	                  }
	               });
	            }   
	         });
	      });
	   	}
	   });
});
	   
</script>
</head>
<body class="animsition">
<!-- 위치 -->
<input type="hidden" value="${param.s}" name="g_sort" id="g_sort">
<input type="hidden" value="${user_id}" id="us">
<input type="hidden" value="${param.l}" id="locationS">
<input type="hidden" value="${param.ll}" id="locationG">
<input type="hidden" value="${vo.user_area }" id="locationS2">
<input type="hidden" value="${vo.user_addr }" id="locationG2">
<div class="container">
  <div class="row">
     <div class="col-8 py-4 px-5 " style="background-color: #ecc84a; border-color: #ecc84a; border-radius: 40px 0px 0px 40px/ 40px 0px 0px 40px; margin-top: 80px;" >
    	<h5 class="text-white mt-1"> 내가 선택한 위치는  </h5>
    	<c:if test="${param.l!='' and param.l!=null}">
    	<h5 class="text-white"><span class="text-white" id="locationH"><b>${param.l }, ${param.ll }</b></span> 입니다</h5>	
    	</c:if>
    	<c:if test="${(param.l==null or param.l=='') and user_id!=null}">
        <h5 class="text-white"><span class="text-white" id="locationH"><b>${vo.user_area },${vo.user_addr }</b></span> 입니다</h5>
        </c:if>
        <c:if test="${user_id==null}">
        <h5 class="text-white"><span class="text-white" id="locationH"><b>로그인하시면 확인하실 수 있습니다.</b></span></h5>
        </c:if>
    </div>
    <div class="col py-4 px-3 bg-light" style="border-radius: 0px 40px 40px 0px/ 0px 40px 40px 0px; margin-top: 80px;">
    	<a href="#" class="btn btn-info" id="findlocationH" role="button" style="background-color: #ecc84a; border-color: #ecc84a; margin-left: 180px; margin-top: 30px"> 
    		<i>현재 위치로 변경하기 ▶ </i>
    	</a>
    </div>
  </div>
  <!-- 위치 -->
  
    <!-- 카테고리 -->
	<div class="filter-tope-group" align="center" style="margin-bottom: 70px; font-size: 17px;">
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
	        <h2 class="fw-bold"><b> 우리 동네 중고 상품</b></h2>
 	    </div>
 	</div>

	<div class="flex-w flex-c-m m-tb-10" align="right">
		<h7>총 게시글 수 : ${GoodsList.size()}</h7>
	    <div class="col pl-0 mr-5">
               <select class="form-select form-select-sm border-0 text-muted" id="sort">
                   <option value="0">최신 등록순</option>
                   <option value="1">가격&#8593;순</option>
                   <option value="2">가격&#8595;순</option>
                   <option value="3">조회순</option>
               </select>
           </div>
	    <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
			<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
			<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
			Search
		</div>
	</div>
	<div class="dis-none panel-search w-full p-t-10 p-b-15">
		<div class="bor8 dis-flex p-l-15">
			<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
				<i class="zmdi zmdi-search"></i>
			</button>
			<input class="mtext-107 cl2 size-114 plh2 p-r-15" id="searchA" type="text" name="search-product" placeholder="Search" value="${param.k }">
		</div>	
	</div>
	
	<!-- 상품목록 -->
	<c:set var="size" value="${GoodsList.size() }" />
	<c:set var="col" value="4" />
	<c:set var="row" value="${ Math.ceil(size/col) }" />
	<c:set var="num" value="0" />
	<div class="row isotope-grid">	
		<c:forEach begin="1" end="${row }" step="1">
			<c:forEach var="i" begin="1" end="${col }" step="1">
				<c:if test="${num < size}">
					<c:set var="vo" value="${GoodsList[num]}" />
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${vo.goods_category}"  
						 style="float: left; width: 300px; height: 350px; margin-top: 10px;">
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="${vo.thumbnail }" onerror="this.src='/resources/images/cat.jpg';" style="width: 280px; height: 250px;">
							</div>
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="/goods/read?goods_no=${vo.goods_no}&user_no=${vo.user_no}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<c:choose>
										 	<c:when test="${vo.goods_trade == '판매중'}">			
												<button type="button" class="btn btn-outline-success py-1 px-1">판매중</button>
											</c:when>
										 	<c:when test="${vo.goods_trade == '예약중'}">			
												<button type="button" class="btn btn-outline-warning py-1 px-1">예약중</button> 
											</c:when>
										 	<c:otherwise>			
												<button type="button" class="btn btn-outline-secondary py-1 px-1">판매완료</button>
											</c:otherwise>
										</c:choose>
										<b>${vo.goods_title }</b>
									</a>
									<span class="stext-105 cl3" style="font-size:17px; color:darkslategray;">
										<span style="color:#28a745;"><fmt:formatNumber value="${vo.goods_price }"/></span>원
									</span>
									<div>
										<div style="float: left;"> ${vo.user_area } ${vo.user_addr} </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div style="float: right;">조회 ${vo.viewcount } </div> 
									</div>
								</div>
								<div class="block2-txt-child2 flex-r p-t-3" id="${vo.goods_no}">
									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
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
 <script type="text/javascript">
	var result = '${result}';
	
	if(result == 'createOK'){
		alert('상품 글쓰기 완료!');
	}
	
	if(result == 'modOK'){
		alert('글 수정 완료!');
	}
	
	if(result == 'delOK'){
		alert('글 삭제 완료!');
	}
	
</script>



<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>