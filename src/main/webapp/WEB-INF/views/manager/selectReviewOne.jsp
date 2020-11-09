<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.hk.saeyan.dto.StoreInfo"%>
<%
	StoreInfo stInfo = (StoreInfo) request.getAttribute("storeInfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
	<style>
.starcolor {
	color: red;
}

</style>	

</head>
<body>
	<h1>리뷰보기</h1>

	<div>
		<%@include file="navi.jsp"%>
	</div>
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
					<th>리뷰번호</th>
					<th>주문번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>별점</th>
				</tr>

				<c:forEach items="${reviewList}" var="reviewList">
				
					<c:set var="star0" value="${reviewList.star}" />
									<c:choose>
										<c:when test="${star0 eq '1' }">
											<c:set var="star1" value="${fn:replace(star0, '1', '★' ) }" />
										</c:when>

										<c:when test="${star0 eq '2' }">
											<c:set var="star1" value="${fn:replace(star0, '2', '★★')  }" />
										</c:when>


										<c:when test="${star0 eq '3' }">
											<c:set var="star1" value="${fn:replace(star0, '3', '★★★' ) }" />
										</c:when>


										<c:when test="${star0 eq '4' }">
											<c:set var="star1"
												value="${fn:replace(star0, '4', '★★★★')  }" />
										</c:when>


										<c:when test="${star0 eq '5' }">

											<c:set var="star1"
												value="${fn:replace(star0, '5', '★★★★★')  }" />
										</c:when>


									</c:choose>
					<tr>
						<td><c:out value="${reviewList.r_no}" /></td>
						<td><c:out value="${reviewList.orderNum}" /></td>
						<td><c:out value="${reviewList.r_content}" /></td>
						<td><c:out value="${reviewList.w_id}" /></td>
						<td><fmt:formatDate value="${reviewList.r_date}"
								pattern="yyyy-MM-dd" /></td>
						<td class="starcolor"><c:out value="${star1}" /></td>		
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