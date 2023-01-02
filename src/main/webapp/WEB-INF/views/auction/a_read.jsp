<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
</head>
<body>
	<br><br><br><br><br><br>
<%-- 	${avo } --%>
<section class="bg0 p-t-75 p-b-120">
  <div class="container">
	<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							${avo.auction_title }
						</h3>

						<p class="stext-113 cl6 p-b-26">
							<span>입찰횟수 ${avo.auction_cnt }건</span>  
							<span> 
								마감<fmt:formatDate value="${avo.auction_cdate }" pattern="YYYY-MM-dd HH:mm:00"/>
							</span>
						</p>

						<div>
							<p class="stext-114 cl6 p-r-40 p-b-11">
								<h4><span>최초 입찰가</span>
									<span style="color:red;"> <fmt:formatNumber value="${avo.auction_price }"/>원</span></h4> <br>
								<h4><span>즉시 낙찰가</span>
									<span style="color:blue;"> <fmt:formatNumber value="${avo.auction_bid }"/> 원</span></h4><br>
							</p><br><br>
							<button style="width:200px;">판매자와 1:1 채팅</button>
							<button style="width:200px;">동네인증 필요</button>

						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
  <hr>
  
  <div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							경매 물품 정보
						</h3>

						<p class="stext-113 cl6 p-b-26">
							${avo.auction_detail }
						</p>
					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
						<h3 class="mtext-111 cl2 p-b-16">판매자 정보</h3>
				</div>
			</div>
  </div>
</section>


	<!--   푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>