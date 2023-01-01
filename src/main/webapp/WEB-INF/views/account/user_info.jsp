<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>views/account/user_info.jsp</h1>
	<h1>사용자 정보 조회</h1>
	<h3>고객번호 : ${userInfo.user_seq_no }</h3>  <!-- 사용자일련번호 -->
	<h3>고객CI값 : ${userInfo.user_ci }</h3> <!-- CI(Connect Info) -->
	
	<c:forEach var="user" items="${userInfo.res_list }">
	<h3>핀테크이용번호 : ${user.fintech_use_num }</h3>
	</c:forEach>
	${access_token }
</body>
</html>