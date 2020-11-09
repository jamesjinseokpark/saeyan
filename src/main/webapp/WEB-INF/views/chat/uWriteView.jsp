<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판</title>
</head>
<!--  1009 session id, grade 수정 js -->
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			alert("글 작성이 완료되었습니다.")
			formObj.attr("action", "/user/cChatW");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var writeForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < writeForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	
</script>

<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="writeForm" method="post" action="/user/cChatW">
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="c_title" class="chk" title="제목을 입력하세요" placeholder="제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content"
									name="c_content" class="chk" title="내용을 입력하세요." placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input type="text"
								id="writer" name="w_id" placeholder="ID가져올 예정" value="${loginMember.id}"/></td>
						<tr>
						<tr>
							<td><label for="writer">회원등급</label><input type="text"
								id="grade" name="g_check" placeholder="회원등급 가져올예정" value="${loginMember.grade}"/></td>
						<tr>
							<td>
								<button type="submit" class="write_btn">작성하기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>