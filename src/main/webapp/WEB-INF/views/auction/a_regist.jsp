<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>
</head>
<body>
<br><br><br><br><br><br>

<form action="" method="post"> 
<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
	<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
		<h4>
			상품 등록
		</h4><br>
	
		<div class="flex-w flex-t bor12 p-b-13">
			<div class="size-208">
					상품이미지:
			</div>
	
			<div class="size-209">
				<span class="mtext-110 cl2">
					<input type="file" name="auction_image" enctype="mulmultipart/form-data"><br>
				</span>
			</div>
		</div>
	
			
			<div class="p-t-15">
					<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
						<select name="auction_category">
						<!-- class="js-select2 select2-hidden-accessible"  -->
							  <option selected>카테고리를 입력하세요</option>
							  <option value="전자기기">전자기기</option>
							  <option value="의류/뷰티/잡화">의류/뷰티/잡화</option>
							  <option value="생활가전/주방">생활가전/주방</option>
							  <option value="인테리어/가구">인테리어/가구</option>
							  <option value="도서/티켓/교환권">도서/티켓/교환권</option>
							  <option value="식품">식품</option>
							  <option value="기타 중고물품">기타 중고물품</option>
						</select> 
					</div>
					</div> <br>
		<div class="flex-w flex-t bor12 p-t-15 p-b-30">
			
			<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
				<p class="stext-111 cl6 p-t-2">
					<input type="text" name="auction_title" placeholder="상품명을 입력하세요"><br>
				</p>
				<br>
				<p class="stext-111 cl6 p-t-2">
					<textarea rows="10" cols="70" name="auction_detail" placeholder="내용을 입력하세요"></textarea> <br>
				</p>
				
				</div>
			</div>
	
			<div class="flex-w flex-t p-t-27 p-b-33">
				<div class="size-208">
					<span class="mtext-101 cl2">
						가격:
					</span>
				</div>
	
				<div class="size-209 p-t-1">
					<span class="mtext-110 cl2">
						<input type="text" name="auction_price" placeholder="기본 가격을 입력하세요"><br>
					</span>
				</div>
			</div>
	
			<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" type="submit" style="width:200px;">
				신청
			</button>
			<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" type="reset" style="width:200px;">
				취소
			</button>
		</div>
	</div>
</form>



<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>	
</body>
</html>