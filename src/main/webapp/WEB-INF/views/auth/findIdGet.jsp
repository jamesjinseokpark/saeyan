<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<form action="/auth/findId" method="post">
		이름: <input type="text" id="name" name="name"><br>
		이메일: <input type="text" id="email" name="email"><br>
		<input type="submit" id="findIdBtn" value="아이디 찾기">
	</form>
</body>
</html>