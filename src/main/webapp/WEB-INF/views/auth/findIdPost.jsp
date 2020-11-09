<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.saeyan.dto.Members" %>
<%  
	Members members = (Members) request.getAttribute("members");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<h3>아이디찾기 결과</h3>
	<p>고객님의 정보와 일치하는 아이디 입니다.<br>
	<strong>${members.id}</strong><br>
	<input type="button"  value="로그인" onclick="location.href='/auth/login'"><input type="button" value="비밀번호 찾기" onclick="location.href='/auth/findPwd'">
</body>
</html>