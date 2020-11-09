<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.saeyan.dto.Members" %>
<%
	Members user = (Members) request.getAttribute("user");
%>
<%@ include file="../include/headerReal.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>회원탈회 확인</title>
<div id="container">
	<div id="content" class="brd-wr">
		<div class="tit-area">
			<h2>회원탈퇴</h2>
		</div>
		<div class="brd-bx">
			<div class="inner">
				<h3 class="h3-tit fir">정말 정말 탈퇴하시겠습니까?ㅠㅠ</h3>
				<span class="help-tx">탈퇴를 원하신다면 비밀번호를 입력하신 후 탈퇴사유를 선택해주세요.</span>
				<div class="write-bx">
					<form action='delet' name='rform' method='post' id='rform'>
						<div class="rows">
							<span class="tit-tx m-4">
								<b>아이디</b>
							</span>
							<div class="con-tx m-8">
								<span class="input p-4 m-12">${loginMember.id }</span>
								<input type='hidden' id='id' name='id' value="${loginMember.id }" readonly><br>  <!--${loginMember.name }-->
							</div>
						</div>
						<div class="rows">
							<span class="tit-tx m-4">
								<b>비밀번호</b>
							</span>
							<div class="con-tx m-8">
								<input id='pwdcheck' type='password' >&nbsp;&nbsp;<span id="result1"></span><br>
							</div>
						</div>
						<div class="rows">
							<span class="tit-tx m-4">
								<b>이름</b>
							</span>
							<div class="con-tx m-8">
							<span class="input p4 m-12">${user.name}</span>
							</div>
						</div>
						<div class="rows">
							<span class="tit-tx m-4">
								<b>탈퇴사유</b>
							</span>
							<div class="con-tx m-8">
								<select id="reason" name="reason" form="rform">
										<option value="" selected>-탈퇴사유를 선택 해주세요-</option>
										<option value="사이트 이용">사이트 이용이 불편함</option>
										<option value="가격 불만족">세탁 가격이 비쌈</option>
										<option value="세탁 불만족">세탁 결과 불만족</option>
										<option value="세탁 진행">세탁 진행이 오래걸림</option>
										<option value="기타">기타 사유</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="btn-box">
					<a href="javascript:void(0);" class="btn btn-blue btn-lg deleteBtn"  >삭제</a>
					<a href="/" class="btn btn-default1 btn-lg">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$().ready(function() {
	$("#pwdcheck").change(function() {
		var pwdch = document.getElementById('pwdcheck').value;
		if(pwdch===("<%=user.getPwd()%>")){
			$("#result1").text("비밀번호가 일치합니다.");
			$('#btn').prop('disabled',false);
		} else {
			$("#result1").text("비밀번호가 일치 하지 않습니다.");
			$('#btn').prop('disabled',true);
		}
var pwdch = $('#pwdcheck').val();
var userPwd = "<%=user.getPwd()%>";
console.log('pwdch', pwdch);
console.log('userPwd', userPwd);
$(".deleteBtn").click(function abcd(){
	if($('#reason').val() == ''){
		//console.log("이유1", $("#reason").val());
		document.getElementById('reason').focus();
		return false;
	} else if($('#pwdcheck').val() == ''){
		alert('비밀번호를 입력해주세요');
		document.getElementById('pwdcheck').focus();
		return false;
	} else if(pwdch != userPwd){
		console.log('pwdch',pwdch);
		alert('비밀번호를 다시 확인해주세요');
		document.getElementById('pwdcheck').focus();
		return false;
	} else {
		document.rform.submit();
		//alert('회원탈퇴가 완료되었습니다.');
	}
});
	});
});


</script>
</body>
</html>