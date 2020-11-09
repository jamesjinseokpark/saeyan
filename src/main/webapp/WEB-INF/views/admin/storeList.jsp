<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 리스트</title>
</head>
<body>
<h1>업체 리스트</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>사업자번호</td>
		<td>업체명</td>
		<td>업주ID</td>
		<td>업체주소</td>
		<td>업체번호</td>
		<td>승인여부</td>
		<td>상세정보</td>
	</tr>
	<%int i=1; %>
	<c:forEach items="${stores}" var="store"> <!-- 반복문으로 tr,td생성 -->
		<tr>
		<td><%=i %></td>
		<td>${store.snum }</td>
		<td>${store.sname }</td>
		<td>${store.id }</td>
		<td>${store.storeFirstAddr }&nbsp;${store.storeSecondAddr}&nbsp;${store.storeExtraAddr}</td>
		<td>${store.scontact }</td>
		<td>${store.permit }</td>
		<td><button onclick="window.location.href='storeUpdate?snum=${store.snum}'">상세정보</button></td>
		<%i++; %>
		</tr>
	</c:forEach>
</table>
</body>
</html>