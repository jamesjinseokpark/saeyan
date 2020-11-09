<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hk.saeyan.dto.Members"%>
<%-- <% --%>
<!-- // 	Members loginMember = (Members) session.getAttribute("loginMember"); -->
<%-- %> --%>
<style>
a {
	
	font-size: 20px;
}

.mg-100{
	margin-left: 93%;
}
</style>
<c:choose>
	<c:when test="${loginMember.grade eq '0'}">
	<div class="mg-100">
<!-- 		<a href="/admin/aChat">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<a href="/admin/aChatW">글쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/">메인</a>
	</div>
	</c:when>
	
	<c:when test="${loginMember.grade eq '1'}">
	<div class="mg-100">
<!-- 		<a href="/user/cChat" >목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<a href="/user/cChatW">글쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/">메인</a>
	</div>
	</c:when>
	
	<c:when test="${loginMember.grade eq '2'}">
	<div class="mg-100">
<!-- 		<a href="/manager/aChat">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<a href="/manager/aChatW">글쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/">메인</a>
	</div>
	</c:when>
	
	
</c:choose>