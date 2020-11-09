<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hk.saeyan.dto.Members"%>
<%
	Members loginMember = (Members) session.getAttribute("loginMember");
%>

<c:choose>
	<c:when test="${loginMember.grade eq '0'}">    
    

		<a href="/support/notice">목록</a>
		<a href="/support/noticeW">새글 작성하기</a>
		<a href="/">메인으로 이동</a>

	</c:when>
	
	<c:when test="${loginMember.grade eq '1'}">    
    

		<a href="/support/notice">목록</a>
		<a href="/">메인으로 이동</a>

	</c:when>
	
	<c:when test="${loginMember.grade eq '2'}">    
    

		<a href="/support/notice">목록</a>
		<a href="/">메인으로 이동</a>

	</c:when>
	
	
	
	
</c:choose>