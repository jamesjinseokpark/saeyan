<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<!--  1009 session.id,grade 수정 js -->
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/support/notice";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			alert("수정이 완료되었습니다")
			formObj.attr("action", "/support/noticeU");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
		
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
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
				<h1> 문의 게시판</h1>
			</header>
			<hr />
			 
				<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm">
					<input type="hidden" name="n_seq" value="${update.n_seq}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="n_title" class="chk" title="제목을 입력하세요" value="${update.n_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="n_content"  class="chk" title="내용을 입력하세요"><c:out value="${update.n_content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="id" value="${update.id}" readonly="readonly"/>
								</td>
							</tr>
																				
							
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.n_date}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>