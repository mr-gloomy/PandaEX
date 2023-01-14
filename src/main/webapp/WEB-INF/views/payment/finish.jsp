<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function next()
{location = "/main/index";}
</script>
<head>
<meta charset="UTF-8">
<title>PANDA</title>
<!-- 헤더 -->	 
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>

</head>
<body onLoad="setTimeout('next()', 10000)">
<div class="container d-flex" id="app" style="display: flex;
    justify-content: center; margin-bottom : 40px;">
<%-- 	${success } --%>
	<div class="row flex-fill d-flex flex-column" style=" align-items: center;">
<!-- 		<h4 class="row fw-bold my-4 pt-2">포인트 충전	</h4> -->
		<br><br><br><br>
		<img src="/resources/images/icons/PANDA.png" height="350px" width="250px">
		
		<div class="row fw-bold mt-1 pt-2 justify-content-center">
			<h3 class="text-center">${success.payment_price }원 충전이 완료되었습니다.</h3>
		</div>
	
		<div class="row fw-bold mt-1 pt-2 justify-content-center">
			<span class="text-center text-muted">${mvo.user_name }님의 현재 보유 포인트는 ${success.user_pandaPay } P 입니다.</span>
		</div>
		<br><br><br><br>
		<div class="row fw-bold mt-1 pt-2 justify-content-center">
			<span class="text-center text-muted">10초 후 메인페이지로 이동합니다. 다양한 거래를 즐겨보세요!</span>
		</div>
	</div>
</div>
    

			
<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>			
</body>
</html>