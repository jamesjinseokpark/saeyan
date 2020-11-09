<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 리스트</title>
</head>
<body>
<h1>정산 리스트</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>사업자번호</td>
		<td>업체명</td>
		<td>정산시작기간</td>
		<td>정산끝기간</td>
		<td>정산날짜</td>
		<td>정산금액</td>
		<td>정산여부</td>
	</tr>
	<c:forEach items="${asset}" var="one"> <!-- 반복문으로 tr,td생성 -->
		<tr>
		<td>${one.asset_seq }</td>
		<td>${one.snum }</td>
		<td>${one.sname }</td>
		<td>${one.periodStart }</td>
		<td>${one.periodEnd }"</td>
		<td>${one.a_date }"</td>
		<td>${one.a_price }</td>
		<td>${one.a_check }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>