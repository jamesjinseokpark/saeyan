<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerReal.jsp"%>

<%@ include file="../include/sbheader.jsp"%>

<!--  1009 session id, grade 수정 js -->
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style >
.mg {
    margin-left: 10%;
    margin-right: 10%;
}
.ml-20{
	margin-left:45%;
	margin-top: 5%;
	margin-bottom: 5% !important;
}
.align{
	text-align: center;
}

</style>

<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content" class="mg">
		<div class="container-fluid">
			<h3 class="h3 mb-2 text-gray-800 ml-20" style="font-size: 5em;">문의 게시판</h3>
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="table-responsive" style="text-align:center;">
						<form role="form" method="get">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr style="font-size: 20px;">
										<th>문의글 번호</th>
										<th>문의글 제목</th>
										<th>문의글 작성자</th>
										<th>업체명</th>
										<th>등록일</th>
									</tr>
								</thead>
								<!--  리스트 노출 -->
								<c:forEach items="${schatList}" var="schatList">
									<tr style="font-size:20px;">
										<td><c:out value="${schatList.c_no}" /></td>
										<td><a href="/user/schatR?c_no=${schatList.c_no}"><c:out
													value="${schatList.c_title}" />&nbsp; 
													<c:if test="${schatList.c_cnt ne null }">
													<small><b>[&nbsp;<c:out value="${schatList.c_cnt}"/>&nbsp;]
													</b></small>
												</c:if></a></td>
										<td><c:out value="${schatList.w_id}" /></td>
										
										<td><c:out value="${schatList.sname}" /></td>
										
										<td><fmt:formatDate value="${schatList.c_date}"
												pattern="yyyy-MM-dd" /></td>
							
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 	<div id="root"> -->
<!-- 		<header> -->
<!-- 			<h1>나의 문의게시판</h1> -->
<!-- 		</header> -->


<!-- 		<section id="container"> -->
<!-- 			<form role="form" method="get"> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<!-- 						<th>문의글 번호</th> -->
<!-- 						<th>문의글 제목</th> -->
<!-- 						<th>문의글 작성자</th> -->
<!-- 						<th>업체명</th> -->
<!-- 						<th>등록일</th> -->


<!-- 					</tr> -->
<%-- 					<c:forEach items="${schatList}" var="schatList"> --%>
<!-- 						<tr> -->
<%-- 							<td><c:out value="${schatList.c_no}" /></td> --%>
<%-- 							<td><a href="/user/schatR?c_no=${schatList.c_no}"><c:out --%>
<%-- 										value="${schatList.c_title}" />&nbsp;  --%>
<%-- 										<c:if test="${schatList.c_cnt ne null }"> --%>
<%-- 										<small><b>[&nbsp;<c:out value="${schatList.c_cnt}"/>&nbsp;] --%>
<!-- 										</b></small> -->
<%-- 									</c:if></a></td> --%>
<%-- 							<td><c:out value="${schatList.w_id}" /></td> --%>
							
<%-- 							<td><c:out value="${schatList.sname}" /></td> --%>
							
<%-- 							<td><fmt:formatDate value="${schatList.c_date}" --%>
<%-- 									pattern="yyyy-MM-dd" /></td> --%>
				
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
					

<!-- 				</table> -->

<!-- 				<div class="search"> -->
<!-- 					<select name="searchType"> -->
<!-- 						<option value="n" -->
<%-- 							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option> --%>
<!-- 						<option value="t" -->
<%-- 							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>게시글 --%>
<!-- 							제목</option> -->
<!-- 						<option value="c" -->
<%-- 							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>게시글 --%>
<!-- 							내용</option> -->
<!-- 						<option value="w" -->
<%-- 							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>게시글 --%>
<!-- 							작성자</option> -->
<!-- 						<option value="tc" -->
<%-- 							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option> --%>
<!-- 					</select> <input type="text" name="keyword" id="keywordInput" -->
<%-- 						value="${scri.keyword}" /> --%>

<!-- 					<button id="searchBtn" type="button">검색</button> -->

<!-- 				</div> -->

<!-- 				<script> -->
					
<!-- 				</script> -->



<!-- 				<div> -->
<!-- 					<ul> -->
<%-- 						<c:if test="${pageMaker.prev}"> --%>
<!-- 							<li><a -->
<%-- 								href="cChat${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li> --%>
<%-- 						</c:if> --%>

<%-- 						<c:forEach begin="${pageMaker.startPage}" --%>
<%-- 							end="${pageMaker.endPage}" var="idx"> --%>
<%-- 							<li><a href="cChat${pageMaker.makeSearch(idx)}">${idx}</a></li> --%>
<%-- 						</c:forEach> --%>

<%-- 						<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<!-- 							<li><a -->
<%-- 								href="cChat${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li> --%>
<%-- 						</c:if> --%>
<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 		<hr /> -->

</body>
</html>