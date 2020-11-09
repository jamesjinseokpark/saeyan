<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.hk.saeyan.dto.StoreInfo"%>
<%
	StoreInfo stInfo = (StoreInfo) request.getAttribute("storeInfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저로부터 문의글</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</head>
<body>
	<h1>유저로부터 문의글</h1>

	<form action='updateOne' name='storeform' method='post' id='storeform'>
		ID :<input type='text' name='id' value=${loginMember.id } readonly><br>
		<!--${loginMember.name }-->
		상호명 :<input type='text' name='sname' value="${storeInfo.sname}"
			readonly><br> 사업자 등록 번호:<input type='number' name='snum'
			value="${storeInfo.snum}" readonly><br>
	</form>

	<section id="container">
		<form role="form" method="get">
			<table>
				<tr>
					<th>문의글번호</th>
					<th>문의글 제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>

				<c:forEach items="${schatList}" var="schatList">
					<tr>
						<td><c:out value="${schatList.c_no}" /></td>
						<td><a href="/manager/schatR?c_no=${schatList.c_no}"><c:out
										value="${schatList.c_title}" />&nbsp; 
										<c:if test="${schatList.c_cnt ne null }">
										<small><b>[&nbsp;<c:out value="${schatList.c_cnt}"/>&nbsp;]
										</b></small>
									</c:if></a></td>
						<td><c:out value="${schatList.w_id}" /></td>
						<td><fmt:formatDate value="${schatList.c_date}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>

			</table>
		</form>
	</section>






	<script>
	window.onload = function() {
		

</script>
</body>
</html>