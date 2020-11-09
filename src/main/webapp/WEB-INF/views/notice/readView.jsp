<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.hk.saeyan.dto.Members"%>

<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>

<script type="text/javascript">

$(document).ready(function() {
	var formObj = $("form[name='readForm']");

	// 수정 
	$(".update_btn").on("click", function() {
		
		formObj.attr("action", "/support/noticeU");
		formObj.attr("method", "get");
		formObj.submit();
	})

	// 삭제
	$(".delete_btn").on("click", function() {

		var deleteYN = confirm("게시글을 삭제하시겠습니까?");
		if (deleteYN == true) {

			formObj.attr("action", "/support/noticeD");
			formObj.attr("method", "post");
			formObj.submit();

		}
	})

	// 취소
	$(".list_btn").on("click", function() {

		location.href = "/support/notice";
	})
	
})

</script>

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
			<form name="readForm" method="post">
				<input type="hidden" id="n_seq" name="n_seq"
					value="${selectOne.n_seq}" />
			</form>
			<table>
				<tbody>
					<tr>
						<td><label for="n_title">제목</label><input type="text"
							id="n_title" name="n_title" value="${selectOne.n_title}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="content">내용</label> <textarea id="content"
								name="n_content" readonly="readonly"><c:out
									value="${selectOne.n_content}" /></textarea></td>
					</tr>
					<tr>
						<td><label for="writer">작성자</label><input type="text"
							id="writer" name="id" value="${selectOne.id}" readonly="readonly" /></td>
					</tr>


					<tr>
						<td><label for="sysdate">작성날짜</label> <fmt:formatDate
								value="${selectOne.n_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table>

			<c:choose>
				<c:when test="${loginMember.grade eq '0'}">

					<div>
						<button type="submit" class="update_btn">수정</button>
						<button type="submit" class="delete_btn">삭제</button>
						<button type="submit" class="list_btn">목록</button>
					</div>

				</c:when>




			</c:choose>




		</section>
		<hr />
	</div>
</body>
</html>

