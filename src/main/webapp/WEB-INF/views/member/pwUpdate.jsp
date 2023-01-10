<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>hi</h1>
 	
 	
 	<form action="/member/pw-change" method="POST">
 		임시 비밀번호 : <input type="text" name="user_pw"><br><br>
 		새로운 비밀번호 : <input type="text" name="new_user_pw">
 		
		<input type="submit" value="비밀번호 바꾸기">
 	
 	</form>
</body>
</html>