<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<!--  1009 session id, grade 수정 js -->

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/user/schatU");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {

			var deleteYN = confirm("게시글을 삭제하시겠습니까?");
			if (deleteYN == true) {

				formObj.attr("action", "/user/schatD");
				formObj.attr("method", "post");
				formObj.submit();

			}
		})

		// 취소
		$(".list_btn").on("click", function() {

			location.href = "/user/schat";
		})
		
	})
</script>

<body>

	<div id="root">
		<header>
			<h1>문의게시판</h1>
		</header>

		<section id="container">
			<form name="readForm" method="post">
				<input type="hidden" id="c_no" name="c_no" value="${selectOne.c_no}" />
			</form>
			<table>
				<tbody>
					<tr>
						<td><label for="title">제목</label><input type="text"
							id="title" name="c_title" value="${selectOne.c_title}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="content">내용</label> <textarea id="content"
								name="c_content" readonly="readonly"><c:out
									value="${selectOne.c_content}" /></textarea></td>
					</tr>
					<tr>
						<td><label for="writer">작성자</label><input type="text"
							id="writer" name="w_id" value="${selectOne.w_id}"
							readonly="readonly" /></td>
					</tr>

					<tr>
						<td><label for="writer">회원등급</label><input type="text"
							id="grade" name="g_check" value="${selectOne.g_check}"
							readonly="readonly" /></td>
					</tr>


					<tr>
						<td><label for="sysdate">작성날짜</label> <fmt:formatDate
								value="${selectOne.c_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
			</div>

			<!-- 댓글목록 1009 추가 james-->
			<div id="comment">
				<ol class="commentList">
					<c:forEach items="${commentList}" var="commentList">
						<li>
							<p>
								작성자 : ${commentList.r_id}<br /> 작성 날짜 :
								<fmt:formatDate value="${commentList.com_date}"
									pattern="yyyy-MM-dd" />
							</p>

							<p>${commentList.com_content}</p>
						</li>
					</c:forEach>
				</ol>
			</div>

		</section>
		<hr />
	</div>
</body>
</html>