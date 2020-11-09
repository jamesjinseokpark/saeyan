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
			<h3>업주회원 정보</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form name="addCustomer" id="addCustomer" action="managerUpdate" method="post">
				<input type="hidden" name="grade" value="1">
				<label><b>아이디</b></label>
				<input type="text" id="id" placeholder="ID" name="id" oninput="checkId()" value="${members.id}">
				<div class="validation" id="id_check"></div>
<!-- 				<label><b>비밀번호</b></label> -->
<!-- 				<input type="password" id="pwd" placeholder="PASSWORD" name="pwd" oninput="checkPwd()"> -->
<!-- 				<div class="validation" id="pwd_check"></div> -->
<!-- 				<label><b>비밀번호 재확인</b></label> -->
<!-- 				<input type="password" id="re-pwd" placeholder="Confirm Password" name="re-pwd" oninput="reCheckPwd()"> -->
<!-- 				<div class="validation" id="pwd_re_check"></div> -->
				<label><b>이름</b></label>
				<input type="text" id="name" placeholder="Name" name="name" oninput="checkName()" value="${members.name}">
				<div class="validation" id="name_check"></div>
				<label><b>이메일</b></label>
				<input type="text" id="email" placeholder="E-mail" name="email" oninput="checkEmail()" value="${members.email}"><button type="button" id="emailBtn" onclick="">이메일 발송</button><br>
				<input type="text" id="checkCode" placeholder="인증번호 입력" name="checkCode"><button type="button" id="codeBtn">인증확인</button><br>
				<div class="validation" id="email_check"></div>
				<label><b>휴대전화</b></label>
				<input type="text" id="pnum" placeholder="Phone Number" name="pnum" oninput="checkPnum()" value="${members.pnum}">
				<div class="validation" id="pnum_check"></div>
				<label><b>집주소</b></label>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="userZipCode" value="${members.userZipCode }">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="userFirstAddr" value="${members.userFirstAddr}"><br>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="userExtraAddr" value="${members.userExtraAddr}"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="userSecondAddr" value="${members.userSecondAddr}"><br>
				<input type="button" value="수정" class="signup" onclick="submitCheck()" id="subminCheck">
			</form>
		</div>
<%-- 		<c:set var="stores" value="${stores}"/> --%>
		<c:if test="${not empty stores }">
		<%int i=1; %>
		<div>
			<table>
				<tr>
					<td>번호</td>
					<td>사업자번호</td>
					<td>업체명</td>
					<td>상세정보</td>
				</tr>
			
			<c:forEach var="store" items="${stores }">
				<tr>
					<td><%=i %></td>
					<td>${store.snum }</td>
					<td>${store.sname }</td>
					<td>
						<button onclick="window.location.href='/admin/storeUpdate?snum=${store.snum }'">상세정보</button>
					</td>
				</tr>
				<%i++; %>
			</c:forEach>
			</table>
		</div>
		</c:if>
	</article>
<script>

function submitCheck(){

	document.addCustomer.submit();
}
</script>	
</body>
</html>