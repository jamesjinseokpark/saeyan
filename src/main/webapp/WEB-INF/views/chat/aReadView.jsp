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
			
			formObj.attr("action", "/admin/aChatU");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {

			var deleteYN = confirm("게시글을 삭제하시겠습니까?");
			if (deleteYN == true) {

				formObj.attr("action", "/admin/aChatD");
				formObj.attr("method", "post");
				formObj.submit();

			}
		})

		// 취소
		$(".list_btn").on("click", function() {

			location.href = "/admin/aChat";
		})
		//관리자 댓글 작성버튼 1011 추가 james
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			if (fn_valiChk()) {
				return false;
			}
			alert("댓글 작성이완료되었습니다")
			formObj.attr("action", "/admin/aChatCom");
			formObj.attr("method", "post");
			formObj.submit();
		});

		function fn_valiChk() {
			var commentForm = $("form[name='commentForm'] .chk").length;
			for (var i = 0; i < commentForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		
	})
</script>

<body>
	<h1>문의게시판</h1>
	<hr />
	<!-- <div> -->
	<%--<%@include file="nav.jsp"%> --%>
	<!-- </div> -->
	<hr />
	<%@ include file="../include/headerReal.jsp"%>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<div class="brd-bx">
		<div class="inner">
			<form name="readForm" method="post">
				<input type="hidden" id="c_no" name="c_no" value="${selectOne.c_no}" />
			</form>
			<div class="write-bx">
				<div class="rows">
					<span class="tit-tx m-12">제목<i class="req">필수</i></span>
					<div class="con-tx m-12">${selectOne.c_title}</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">내용<i class="req">필수</i></span>
					<div class="con-tx m-12" id="remaining">
						<textarea class="textarea block" rows="10" name="cv_contents"
							id="cv_contents" required="required" title="내용을 입력해 주세요"
							readonly="readonly">${selectOne.c_content}</textarea>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-5">작성자</span>
					<div class="con-tx m-7">${selectOne.w_id}</div>
				</div>
				<div class="rows">
					<span class="tit-tx">회원등급<i class="req">필수</i></span>
					<div class="con-tx">
						<span class="m-rows">${selectOne.g_check}</span>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-5">작성날짜</span>
					<div class="con-tx m-7">
						<fmt:formatDate value="${selectOne.c_date}" pattern="yyyy-MM-dd" />
					</div>
				</div>
				<div class="rows">
					<div class="btn-box">
						<a href="#" class="btn btn-default1 btn-lg update_btn">수정</a> <a
							href="#" class="btn btn-default1 btn-lg delete_btn">삭제</a> <a
							href="#" class="btn btn-default1 btn-lg list_btn">목록</a>
					</div>
				</div>
				<%int i=1; %>
				<c:forEach items="${commentList}" var="commentList">
					<div class="rows">
						<span class="tit-tx m-5"><%=i %><i class="req">필수</i></span>
						<div class="con-tx m-7" id="remaining">
							<pre class="textarea block" rows="10" name="cv_contents"
								id="cv_contents" required="required" title="내용을 입력해 주세요"
								readonly="readonly">
								<p>작성자 : ${commentList.r_id}</p>
								<p>작성 날짜 :<fmt:formatDate value="${commentList.com_date}"
										pattern="yyyy-MM-dd" />
								</p>
								<p>내용 :${commentList.com_content}</p>
							</pre>
						</div>
					</div>
					<%i++; %>
				</c:forEach>
				<form name="commentForm" method="post">
					<input type="hidden" id="c_no" name="c_no"
						value="${selectOne.c_no}" />

					<div class="rows">
						<span class="tit-tx">댓글 작성자</span>
						<div class="con-tx">
							<span class="m-rows">${loginMember.id}</span> <input
								type="hidden" id="r_id" name="r_id" value="${loginMember.id}">
						</div>
					</div>
					<div class="rows">
						<span class="tit-tx m-12">댓글 내용<i class="req">필수</i></span>
						<div class="con-tx m-12" id="remaining">
							<textarea class="textarea block chk" rows="10" name="com_content"
								id="com_content" required="required" title="내용을 입력해 주세요"></textarea>
						</div>
					</div>
					<div class="btn-box">
						<a href="#" class="btn btn-default1 btn-lg commentWriteBtn">작성</a>
					</div>
				</form>
			</div>
			<!-- /inner -->
		</div>
	</div>
</body>
</html>