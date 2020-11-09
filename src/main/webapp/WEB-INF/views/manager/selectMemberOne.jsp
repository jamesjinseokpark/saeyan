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
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- daum 도로명주소 찾기 api -->
</head>
<body>
<h1>회원 정보 수정</h1>
	<form action='ownerUpdate' name='storeform' method='post' id='storeform'>
		ID :<input type='text' name='id' value="${loginMember.id }" readonly><br>  <!--${loginMember.name }-->
		비밀번호 확인 : <input id='pwdcheck' type='password' name= "" value="">&nbsp;&nbsp;<span id="result1"></span><br>
		새 비밀번호 : <input id='newPwd' type='password' value=""><br>
		새 비밀번호 확인 : <input type='password' id='pwd' name="" value="">&nbsp;&nbsp;<span id="result2"></span><br>
		이름 :<input type='text' name='name' value="${owner.name}"><br>
		이메일 :<input type='text' name='email' value="${owner.email}"><br>
		<label>집주소</label>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="userZipCode" value="${owner.userZipCode}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="userFirstAddr" value="${owner.userFirstAddr}"><br>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="userExtraAddr" value="${owner.userExtraAddr}"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="userSecondAddr" value="${owner.userSecondAddr}">
		연락처:<input type='number' name='pnum' value="${owner.pnum}"><br>
	</form>
		<button id='btn' disabled onclick="abcd();">전송</button>
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
	
	$("#pwd").change(function (){newPwdCheck();});
	$("#newPwd").change(function (){newPwdCheck();});
});

function newPwdCheck(){
	newPwd = document.getElementById('newPwd').value;
	rePwd = document.getElementById('pwd').value;
	if(rePwd===newPwd){
		$('#btn').prop('disabled',false);
	} else{
		$('#btn').prop('disabled',true);
	}
	if($('#btn').prop('disabled')){
		$("#result2").text("새 비밀번호가 일치 하지 않습니다.");
	} else {
		$("#result2").text("새 비밀번호가 일치합니다.");
	}
	if(rePwd===""){
		$("#result2").text("");
	}
}

function abcd(){
	pwdcheck = document.getElementById('pwdcheck');
	rePwd = document.getElementById('pwd');
	if(rePwd.value!=""){
		rePwd.setAttribute("name","pwd");
	} else {
		pwdcheck.setAttribute("name","pwd");
	}
	document.storeform.submit();
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

</script>
</body>
</html>