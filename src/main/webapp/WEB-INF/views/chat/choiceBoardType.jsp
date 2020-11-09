<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hk.saeyan.dto.Members"%>
<%
	Members loginMember = (Members) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${loginMember.grade eq '1'}">
			<h3>게시판 오신걸 환영합니다.</h3>
			<input type="button" value="관리자 문의 페이지"
				onclick="location.href='/user/cChatL'">
			<br>
			<input type="button" value="업체 문의 목록"
				onclick="location.href='/user/schat'">
		</c:when>

		<c:when test="${loginMember.grade eq '2'}">

<h3>게시판 오신걸 환영합니다.</h3>
			<input type="button" value="관리자 문의 페이지"
				onclick="location.href='/manager/aChatL'">
			<br>
			<input type="button" value="업체 문의 목록"
				onclick="location.href='/manager/schat'">

		</c:when>


	</c:choose>
</body>
</html>