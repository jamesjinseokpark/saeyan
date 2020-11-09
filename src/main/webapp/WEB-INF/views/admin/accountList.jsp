<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>관리자 자산 관리 페이지</title>
</head>
<body>
<h1>관리자 자산 관리</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>일자</td>
		<td>입금액</td>
		<td>출금액</td>
		<td>세부사항</td>
		<td>총액</td>
	</tr>
	<c:forEach items="${account}" var="acc"> <!-- 반복문으로 tr,td생성 -->
		<tr>
		<td>${acc.a_seq }</td>
		<td>${acc.id}</td>
		<td>${acc.a_date }</td>
		<td>${acc.o_price }</td>
		<td>${acc.i_price }</td>
		<td>${acc.detail }</td>
		<td>${acc.balance }</td>
		</tr>
	</c:forEach>
</table>
	<button onclick="window.location.href='/'">메인으로</button>
</body>
</html>