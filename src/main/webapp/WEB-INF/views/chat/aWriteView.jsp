<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerReal.jsp"%>
<%@ include file="../include/sbheader.jsp"%>


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="../resources/ckeditor/ckeditor.js"></script>

<title>게시판</title>

<!--  1009 session id, grade 수정 js -->
<script type="text/javascript">
	$(document).ready(function() {

		function checkForm(form) {
			if(CKEDITOR.instances.c_content.getData() =='' 
		        || CKEDITOR.instances.c_content.getData().length ==0){
		    alert("내용을 입력해주세요.");
		    $("#c_content").focus();
		    return false;
		}
		}
	
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/admin/aChatW");
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



<div id="root">

	<section id="container">
		<form name="writeForm" method="post" action="/user/cChatW">
			<table>
				<tbody>
					<tr>
						<td><label for="title"></label><input type="hidden"
							id="title" name="c_title" class="chk" title="제목을 입력하세요"
							value="문의드립니다" /></td>
					</tr>
					<tr>
						<td><textarea name="c_content" id="c_content"
								title="내용을 입력하세요." placeholder="내용을 입력해주세요" required="required"></textarea></td>
					</tr>
					<tr>
						<td><label for="writer"></label><input type="hidden"
							id="writer" name="w_id" placeholder="ID가져올 예정"
							value="${loginMember.id}" readOnly /></td>
					<tr>
					<tr>
						<td><label for="writer"></label><input type="hidden"
							id="grade" name="g_check" placeholder="회원등급 가져올예정"
							value="${loginMember.grade}" /></td>
					<tr>
						<td>
							<button onsubmit="return checkForm(this);" class="write_btn">작성하기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
	<hr />

</div>

<script>CKEDITOR.replace('c_content');</script>


</body>
</html>