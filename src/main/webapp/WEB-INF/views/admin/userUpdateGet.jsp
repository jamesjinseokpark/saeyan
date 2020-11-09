<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>일반회원 정보</title>
</head>
<body>
<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
			<h3>일반회원 정보</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form name="addCustomer" id="addCustomer" action="userUpdate" method="post">
				<input type="hidden" name="grade" value="1">
				<label><b>아이디</b></label>
				<input type="text" id="id" placeholder="ID" name="id" oninput="checkId()" value="${userInfo.id}">
				<div class="validation" id="id_check"></div>
<!-- 				<label><b>비밀번호</b></label> -->
<!-- 				<input type="password" id="pwd" placeholder="PASSWORD" name="pwd" oninput="checkPwd()"> -->
<!-- 				<div class="validation" id="pwd_check"></div> -->
<!-- 				<label><b>비밀번호 재확인</b></label> -->
<!-- 				<input type="password" id="re-pwd" placeholder="Confirm Password" name="re-pwd" oninput="reCheckPwd()"> -->
<!-- 				<div class="validation" id="pwd_re_check"></div> -->
				<label><b>이름</b></label>
				<input type="text" id="name" placeholder="Name" name="name" oninput="checkName()" value="${userInfo.name}">
				<div class="validation" id="name_check"></div>
				<label><b>이메일</b></label>
				<input type="text" id="email" placeholder="E-mail" name="email" oninput="checkEmail()" value="${userInfo.email}"><button type="button" id="emailBtn" onclick="">이메일 발송</button><br>
				<input type="text" id="checkCode" placeholder="인증번호 입력" name="checkCode"><button type="button" id="codeBtn">인증확인</button><br>
				<div class="validation" id="email_check"></div>
				<label><b>휴대전화</b></label>
				<input type="text" id="pnum" placeholder="Phone Number" name="pnum" oninput="checkPnum()" value="${userInfo.pnum}">
				<div class="validation" id="pnum_check"></div>
				<label><b>집주소</b></label>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="userZipCode" value="${userInfo.userZipCode }">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="userFirstAddr" value="${userInfo.userFirstAddr}"><br>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="userExtraAddr" value="${userInfo.userExtraAddr}"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="userSecondAddr" value="${userInfo.userSecondAddr}"><br>
				<label><b>버블</b></label>
				<input type="text" id="bubble" placeholder="0" name="bubble" value="${userInfo.bubble}" readonly><br>
				<label><b>관심점포1</b></label>
				<input type="text" value="${userInfo.likeStore1}" readonly>
				<label><b>관심점포2</b></label>
				<input type="text" value="${userInfo.likeStore2}" readonly>
				<label><b>관심점포3</b></label>
				<input type="text" value="${userInfo.likeStore3}" readonly>
				
				<h3>결제 카드 정보</h3>
				<input type='hidden' name='cardCheck' value="${userInfo.cardCheck}">
				<label for="cardCom"><b>카드회사</b></label>
				<input type='hidden' id="com" value="${userInfo.cardCom}">
				<select id="cardCom" name="cardCom" form="addCustomer">
<!-- 					<option value="" selected>-카드사를 선택해 주세요-</option> -->
					<option value="KB국민카드">KB국민카드</option>
					<option value="신한카드">신한카드</option>
					<option value="하나카드">하나카드</option>
					<option value="롯데카드">롯데카드</option>
					<option value="BC카드">BC카드</option>
					<option value="농협카드">NH농협카드</option>
					<option value="삼성카드">삼성카드</option>
					<option value="현대카드">현대카드</option>
				</select>
				<label><b>카드번호</b></label>
				<input type="text" size="20" id="cardNum" name="cardNum" maxlength="12" oninput="checkCardNum(this.value)" value="${userInfo.cardNum}"><br>
				<label><b>유효기간</b></label>
				<c:set var="exp" value="${userInfo.cardExp}"/>
				<c:set var="expMM" value="${fn:substring(exp,0,2)}"/>
				<c:set var="expYY" value="${fn:substring(exp,2,4)}"/>
				<label><b>월</b></label>
				<input type="text" size="20" id="expMM" maxlength="4" oninput="" value="${expMM}">
				<label><b>년</b></label>
				<input type="text" size="20" id="expYY" maxlength="4" oninput="" value="${expYY}"><br>
				<input type='hidden' id="cardExp" name="cardExp" value="">
				<label><b>Cvc</b></label>
				<input type="text" size="20" id="cardCvc" name="cardCvc" maxlength="12" oninput="" value="${userInfo.cardCvc}"><br>
				<div class="validation" id="cardNum_check"></div>
				<input type="button" value="수정" class="signup" onclick="submitCheck()" id="subminCheck">
			</form>
		</div>
	</article>
<script>
window.onload=function(){
	var str1 = $("#com").val();
	$("#cardCom").val(str1);
	
}
function submitCheck(){
	var str2 = ($("#expMM").val() + $("#expYY").val());
	$("#cardExp").val(str2);
	document.addCustomer.submit();
}
</script>	
</body>
</html>