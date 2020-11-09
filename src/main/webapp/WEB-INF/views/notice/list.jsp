<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>공지사항</title>

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 10px;
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
</head>

<body>
	<div id="root">
		<header>
			<h1>공지사항</h1>
		</header>

		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />



		<section id="container">
			<form role="form" method="get">
				<table>
					<tr>
						<th>공지 번호</th>
						<th>공지 제목</th>
						<th>공지 작성자</th>
						<th>등록일</th>


					</tr>

					<c:forEach items="${noticeList}" var="noticeList">
						<tr>
							<td><c:out value="${noticeList.n_seq}" /></td>
							<td><a href="/support/noticeR?n_seq=${noticeList.n_seq}"><c:out
										value="${noticeList.n_title}" /></a></td>
							<td><c:out value="${noticeList.id}" /></td>
							<td><fmt:formatDate value="${noticeList.n_date}"
									pattern="yyyy-MM-dd" /></td>

						</tr>
					</c:forEach>

				</table>

				<div class="search">
					<select name="searchType">
						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>게시글
							제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>게시글
							내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>게시글
							작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" />

					<button id="searchBtn" type="button">검색</button>

				</div>


				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="notice${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="notice${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="notice${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>

			</form>
		</section>
		<hr />
	</div>
</body>
</html>