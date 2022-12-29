<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>views/bank_main.jsp</h1>
<h1>인증완료(토큰발급)</h1>
<h2>access_token : ${responseTokenVO.access_token }</h2>
<h2>token_type : ${responseTokenVO.token_type }</h2>
<h2>expires_in : ${responseTokenVO.expires_in }</h2>
<h2>refresh_token : ${responseTokenVO.refresh_token }</h2>
<h2>scope : ${responseTokenVO.scope }</h2>
<h2>user_seq_no : ${responseTokenVO.user_seq_no }</h2> <!-- 사용자일련번호 -->

<h2>사용자정보 조회</h2>
<form action="userInfo" method="get">
 <input type="hidden" name="access_token" value = "${responseTokenVO.refresh_token }">
 <input type="hidden" name="tser_seq_no" value = "${responseTokenVO.user_seq_no }">
 <input type="submit" value = "사용자정보조회">
</form>

<h2>등록계좌조회</h2>
<form action="accountList" method="get">
 <input type="hidden" name="access_token" value = "${responseTokenVO.refresh_token }">
 <input type="hidden" name="tser_seq_no" value = "${responseTokenVO.user_seq_no }">
 <input type="hidden" name="include_cancel_yn" value = "Y">
 <input type="hidden" name="sort_order" value = "D">
 <input type="submit" value = "등록계좌조회">
</form>

</body>
</html>