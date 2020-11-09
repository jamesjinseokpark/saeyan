<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업주 탈퇴 결과</title>
</head>
<body>
<h1>업주 탈퇴 결과</h1><br>
<b>정상적으로 탈퇴되었습니다.</b>
<a href="/auth/logout">메인으로 이동하려면 누르세요</a>
<script>
	setTimeout( function() { window.location='/auth/logout';},1000);
</script>
</body>
</html>


