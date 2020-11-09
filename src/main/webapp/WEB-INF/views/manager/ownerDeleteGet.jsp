<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.saeyan.dto.Members" %>
<%
	Members owner = (Members) request.getAttribute("owner");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>업주 탈회 확인</title>
</head>
<body>
<h1>업주 탈퇴 확인</h1>
정말로 탈퇴 하시겠습니까?<br>
탈퇴를 원하신다면 비밀번호를 입력해주세요<br>
	<form action='ownerDelete' name='storeform' method='post' id='storeform'>
		ID :<input type='text' id='id' name='id' value="${loginMember.id }" readonly><br>  <!--${loginMember.name }-->
		비밀번호 :<input id='pwdcheck' type='password' value="">&nbsp;&nbsp;<span id="result1"></span><br>
		이름 :<input type='text' name='name' value="${owner.name}"><br>
		<button id='btn' disabled onclick="abcd();">삭제</button>
	</form>
<script>
$().ready(function() {
	$("#pwdcheck").change(function() {
		pwdch = document.getElementById('pwdcheck').value;
		if(pwdch===("<%=owner.getPwd()%>")){
			$("#result1").text("비밀번호가 일치합니다.");
			$('#btn').prop('disabled',false);
		} else {
			$("#result1").text("비밀번호가 일치 하지 않습니다.");
			$('#btn').prop('disabled',true);
		}
	});
});
function abcd(){
	document.storeform.submit();
}

// function abcd(){            탈퇴시 설문조사 페이지로 이동??
// 	var url = "/manager/survey?id="+ document.getElementById('id').value;
// 	window.location.href=url;
// }
</script>
</body>
</html>