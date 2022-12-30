<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<td>경매번호</td>
		<td>이미지</td>
		<td>등록일</td>
		<td>마감일</td>
		<td>상품명</td>
		<td>기본금액</td>
		<td>경매찜</td>
		<td>입찰횟수</td>
	</tr>
	
	<c:forEach var="avo" items="${auctionList }">
		<tr>	
			<td>${avo.auction_no }</td>
			<td>${avo.auction_image }</td>
			<td>
			  <fmt:formatDate value="${avo.auction_date }" pattern="yy-MM-dd"/>
			</td>
			<td>
			  <fmt:formatDate value="${avo.auction_cdate }" pattern="yy-MM-dd"/>
			</td>
			<td>${avo.auction_title }</td>
			<td>${avo.auction_price }</td>
			<td>${avo.auction_like }</td>
			<td>${avo.auction_cnt }</td>
		</tr>
	</c:forEach>
</table>

	<script type="text/javascript">
		var result = '${result}';
		if(result == 'creatOK') {
			alert("상품등록완료");
		}
	</script>

</body>
</html>