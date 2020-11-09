<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.hk.saeyan.dto.MemberLikeStores" %>
<% MemberLikeStores likeStore1 = (MemberLikeStores)request.getAttribute("likeStore1");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 점포</title>
</head>
<body>
	<h3>관심 점포</h3>
		<p>${likeStore1.name }님의 등록된 관심점포 목록 입니다.<br>
			<table border="1">
				<tr>
					<td>관심등록</td>
					<td>업체명</td>
					<td>연락처</td>
				</tr>
				<tr>
					<td>1</td>
					<td>${likeStore1.sname }</td>
					<td>${likeStore1.scontact }</td>
				</tr>
				<tr>
					<td>2</td>
					<td>${likeStore2.sname }</td>
					<td>${likeStore2.scontact }</td>
				</tr>
				<tr>
					<td>3</td>
					<td>${likeStore3.sname }</td>
					<td>${likeStore3.scontact }</td>
				</tr>
	</table>
	<c:if test="${likeStore1==null && likeStore2==null && likeStore3==null} ">
		<p>등록된 관심점포가 없습니다.<br>
		해당 점포를 찾아 등록해주세요.
	</c:if>

</body>
</html>