<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<br><br><br><br><br><br>
	
	<form action="" method="post">
		상품이미지 : <input type="file" name="auction_image" enctype="mulmultipart/form-data"><br>
		카테고리 : 
		<select name="auction_category">
			<option selected>카테고리를 입력하세요</option>
				  <option value="전자기기">전자기기</option>
				  <option value="의류/뷰티/잡화">의류/뷰티/잡화</option>
				  <option value="생활가전/주방">생활가전/주방</option>
				  <option value="인테리어/가구">인테리어/가구</option>
				  <option value="도서/티켓/교환권">도서/티켓/교환권</option>
				  <option value="식품">식품</option>
				  <option value="기타 중고물품">기타 중고물품</option>
		</select> <br>
		상품명 : <input type="text" name="auction_title" placeholder="제목을 입력하세요"><br> 
		상품가격 : <input type="text" name="auction_price" placeholder="기본 가격을 입력하세요"><br>
		상세설명 :<br> <textarea rows="10" cols="20" name="auction_detail" placeholder="내용을 입력하세요"></textarea> <br>
		<button type="submit">신청</button>
		<button type="reset">취소</button>
	</form>
	
</body>
</html>