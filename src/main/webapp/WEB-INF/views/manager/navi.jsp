<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hk.saeyan.dto.Members"%>


<c:choose>
		
	<c:when test="${loginMember.grade eq '2'}">

		<a href="/manager/review">사업체 목록</a>
		<a href="/">메인으로 이동하기</a>

	</c:when>
	
</c:choose>