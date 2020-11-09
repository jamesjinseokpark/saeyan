<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/headerReal.jsp" %>
<div id="content" class="brd-wr">
	<div class="tit-area">
		<h2>로그인</h2>
		<p class="sub-tx">새얀 로그인 페이지 입니다.</p>
	</div>
	<div class="brd-bx">
		<div class="inner">
			<div class="login-bx">
				<div class="left">
					<h3>로그인</h3>
					<ul class="log-tab">
						<li class="active"><a href="#tc1" id="hom" name="hom">새얀 로그인</a></li>
					</ul>
					<form method="post" name="wform" >
					<div class="tc" id="tc1" style="display:block;">
					<input type="hidden" name="searchType" id="searchType">
						<p class="inp"><input type="text" name="id" id="m_id" value="" class="input id" placeholder="아이디를 입력하세요"></p>
						<p class="inp"><input type="password" name="pwd" id="m_passwd" class="input pw" placeholder="비밀번호를 입력하세요"></p>
						<c:if test="${msg==false }">
							<p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 비밀번호를 다시 입력해주세요</p>
						</c:if>
						<c:if test="${deleted==false }">
							<p style="color:#f00;">이미 탈퇴한 계정입니다. 새로운 아이디로 회원가입 해주시기 바랍니다.</p>
						</c:if>
						<div class="btn-box">
								<a href="javascript:void(0);" class="btn btn-blue btn-lg" onclick="onLogin('W');">로그인</a>
						</div>
					</div>
					</form>
				</div>
				<div class="right">
					<p class="tx01">안녕하세요</p>
					<dl>
						<dt>회원가입</dt>
						<dd>
							가입 후 이벤트 참여 및 다양한 정보를 제공 받으실 수 있습니다.
							<span class="btnz">
								<a href="/auth/addCustomer" class="btlogin">일반 회원가입</a>
								<a href="/auth/addOwner" class="btlogin">업주 회원가입</a>
							</span>
						</dd>
					</dl>
					<dl>
						<dt>아이디/비밀번호 찾기</dt>
						<dd>
							아이디 또는 비밀번호 정보를 찾으실 수 있습니다.
							<span class="btnz">
								<a href="/auth/findId" class="btlogin">아이디 찾기</a>
								<a href="/auth/findPwd" class="btlogin">비밀번호 찾기</a>
							</span>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function onLogin(type){
		
		if(type == "W"){
			if(document.wform.m_id.value == ""){
				alert('아이디를 입력 하세요');
				document.wform.m_id.focus();
				return;
			}
			if(document.wform.m_passwd.value == ""){
				alert('비밀번호를 입력 하세요');
				document.wform.m_passwd.focus();
				return;
			}
			document.wform.searchType.value = "W";
			document.wform.method = "post";
			document.wform.action = "/auth/login";
	    	document.wform.submit();
		}else{
			if(document.aform.m_id.value == ""){
				alert('아이디를 입력 하세요');
				document.aform.m_id.focus();
				return;
			}
			if(document.aform.m_passwd.value == ""){
				alert('비밀번호를 입력 하세요');
				document.aform.m_passwd.focus();
				return;
			}
			document.aform.searchType.value = "A";
			document.aform.method = "post";
			document.aform.action = "/auth/login";
	    	document.aform.submit();
		}
	}

</script>
</body>
</html>