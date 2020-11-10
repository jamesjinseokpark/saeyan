<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.hk.saeyan.dto.StoreInfo"%>
<%
	StoreInfo stInfo = (StoreInfo) request.getAttribute("storeInfo");
%>
<%@ include file="../include/headerReal.jsp"%>

<%@ include file="../include/sbheader.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<style>
.starcolor {
	color: red;
}

.mg {
    margin-left: 10%;
    margin-right: 10%;
}

.ml-20{
	margin-left:40%;
	margin-top: 5%;
	margin-bottom: 5% !important;
}
</style>	
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content" class="mg">
		<div class="container-fluid">
			<h1 class="h3 mb-2 text-gray-800 ml-20" style="font-size: 5em;">내가 작성한 리뷰</h1>
			<form action='updateOne' name='storeform' method='post' id='storeform'>
				<input type='hidden' name='id' value=${loginMember.id } readonly><br>
				<!--${loginMember.name }-->
			</form>
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="table-responsive" style="text-align:center;">
						<form role="form" method="get">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr style="font-size:20px;">
										<th>리뷰번호</th>
										<th>주문번호</th>
										<th>내용</th>
										<th>작성자</th>
										<th>등록일</th>
<!-- 										<th>사업자번호</th> -->
										<th>별점</th>
									</tr>
										<c:forEach items="${reviewListU}" var="reviewListU">
											<c:set var="star0" value="${reviewListU.star}" />
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
														<c:set var="star1" value="${fn:replace(star0, '4', '★★★★')  }" />
													</c:when>
													
													<c:when test="${star0 eq '5' }">
														<c:set var="star1" value="${fn:replace(star0, '5', '★★★★★')  }" />
													</c:when>
											</c:choose>
									<tr style="font-size:17px;">
										<td><c:out value="${reviewListU.r_no}" /></td>
										<td><c:out value="${reviewListU.orderNum}" /></td>
										<td><c:out value="${reviewListU.r_content}" /></td>
										<td><c:out value="${reviewListU.w_id}" /></td>
										<td><fmt:formatDate value="${reviewListU.r_date}" pattern="yyyy-MM-dd" /></td>
<%-- 										<td><c:out value="${reviewListU.snum}" /></td>	 --%>
										<td class="starcolor"><c:out value="${star1}" /></td>	
									</tr>
									</c:forEach>
								</thead>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 	<h1>리뷰보기</h1> -->


<!-- 	<form action='updateOne' name='storeform' method='post' id='storeform'> -->
<%-- 		ID :<input type='text' name='id' value=${loginMember.id } readonly><br> --%>
<!-- 		<!--${loginMember.name }--> -->

<!-- 	</form> -->

<!-- 	<section id="container"> -->
<!-- 		<form role="form" method="get"> -->
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<th>리뷰번호</th> -->
<!-- 					<th>주문번호</th> -->
<!-- 					<th>내용</th> -->
<!-- 					<th>작성자</th> -->
<!-- 					<th>등록일</th> -->
<!-- 					<th>사업자번호</th> -->
<!-- 					<th>별점</th> -->
<!-- 				</tr> -->

<%-- 				<c:forEach items="${reviewListU}" var="reviewListU"> --%>
<%-- 				<c:set var="star0" value="${reviewListU.star}" /> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${star0 eq '1' }"> --%>
<%-- 											<c:set var="star1" value="${fn:replace(star0, '1', '★' ) }" /> --%>
<%-- 										</c:when> --%>

<%-- 										<c:when test="${star0 eq '2' }"> --%>
<%-- 											<c:set var="star1" value="${fn:replace(star0, '2', '★★')  }" /> --%>
<%-- 										</c:when> --%>


<%-- 										<c:when test="${star0 eq '3' }"> --%>
<%-- 											<c:set var="star1" value="${fn:replace(star0, '3', '★★★' ) }" /> --%>
<%-- 										</c:when> --%>


<%-- 										<c:when test="${star0 eq '4' }"> --%>
<%-- 											<c:set var="star1" --%>
<%-- 												value="${fn:replace(star0, '4', '★★★★')  }" /> --%>
<%-- 										</c:when> --%>


<%-- 										<c:when test="${star0 eq '5' }"> --%>

<%-- 											<c:set var="star1" --%>
<%-- 												value="${fn:replace(star0, '5', '★★★★★')  }" /> --%>
<%-- 										</c:when> --%>


<%-- 									</c:choose> --%>
				
				
<!-- 					<tr> -->
<%-- 						<td><c:out value="${reviewListU.r_no}" /></td> --%>
<%-- 						<td><c:out value="${reviewListU.orderNum}" /></td> --%>
<%-- 						<td><c:out value="${reviewListU.r_content}" /></td> --%>
<%-- 						<td><c:out value="${reviewListU.w_id}" /></td> --%>
<%-- 						<td><fmt:formatDate value="${reviewListU.r_date}" --%>
<%-- 								pattern="yyyy-MM-dd" /></td> --%>
<%-- 						<td><c:out value="${reviewListU.snum}" /></td>	 --%>
<%-- 						<td class="starcolor"><c:out value="${star1}" /></td>	 --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>

<!-- 			</table> -->
<!-- 		</form> -->
<!-- 	</section> -->
<script>
	window.onload = function() {
</script>
</body>
</html>