<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerReal.jsp" %>
<title>회원 탈퇴 결과</title>
<div id="container">
	<div id="content" class="brd-wr">
		<div class="tit-area">
			<h1>회원탈퇴결과</h1>
		</div>
		<div class="brd-bx">
			<div class="inner">
				<h3 class="h3-tit fir">회원탈퇴가 완료되었습니다.</h3><br>
				<h3 class="h3-tit fir">언제든 다시 와주세요.</h3>
			</div>
		</div>
	</div>
</div>
<script>
	setTimeout( function() { window.location='/auth/logout';},500);
</script>
</body>
</html>

