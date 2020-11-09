<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
<h1>비정상적입 접근</h1><br>
<b>비정상적인 접근이 확인 되었습니다. 3초뒤 메인 페이지로 이동합니다.</b>
<a href="/">메인으로 이동하려면 누르세요</a>
<script>
	setTimeout( function() { window.location='/';},3000);
</script>
</body>
</html>


