<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
<h1>회원 정보 리스트</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>연락처</td>
		<td>등급</td>
		<td>비고</td>
	</tr>
	<%int i=0; %>
	<c:forEach items="${memberList}" var="member"> <!-- 반복문으로 tr,td생성 -->
			<%i++; %>
			<c:set var="actor" value="${member.grade}"/>
    		<c:set var="actor" value="${fn:replace(actor, '0', '관리자')}"/>
    		<c:set var="actor" value="${fn:replace(actor, '1', '일반회원')}"/>
     		<c:set var="actor" value="${fn:replace(actor, '2', '업주회원')}"/>
			<tr>
				<td><%=i %></td>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.pnum}</td>
				<td>${actor}</td>
				<td>
				<c:if test="${actor eq '일반회원'}">
				<button onclick="window.location.href='userUpdate?id=${member.id}'">수정</button>
				</c:if>
				<c:if test="${actor eq '업주회원'}">
				<button onclick="window.location.href='managerUpdate?id=${member.id}'">수정</button>
				</c:if>
				</td>
			</tr>
	</c:forEach>
</table>
</body>
</html>