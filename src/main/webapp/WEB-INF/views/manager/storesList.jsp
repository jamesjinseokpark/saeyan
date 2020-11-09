<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>업체 목록</title>
<style>
 	.tdn {cursor: pointer;}  /* 마우스 포인터가 손가락 모양으로 바꿈*/
</style>
</head>
<body>
	<div id='maindiv'>
	<table border='1'>
		<tr>
			<td>업체명</td><td>사업자 번호</td>
		</tr>
		<c:forEach items="${storeslist}" var="store"> <!-- 반복문으로 tr,td생성 -->
			<tr>
				<td>${store.sname}</td>
<%-- 				<td><a href='update?mno=<c:out value="${member.mno}" />'><c:out value="${member.mname}" /></a></td> --%>
				<td class='tdn'>${store.snum}</td>
<%-- 				<td><c:out value="${member.email}" /></td> --%>
<%-- 				<td><a href='delete?mno=<c:out value="${member.mno}" />'>삭제</a></td> --%>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id='detail'>
	</div>
<script>

window.onload = function(){	
	var abc = document.getElementById('abc');
	$(".tdn").mouseover(function(){  //마우스가 올라왔을때 색깔 빨간색으로
		$(this).css("color","red");
	});

	$(".tdn").mouseout(function(){  //마우스가 벗어났을때 색깔 검은색으로
		$(this).css("color","black");
	});
	
	$(".tdn").click(function(){ //클릭됬을때 get방식으로 페이지 이동
		console.log(this.innerText);
		console.log($(this).html());
		var url = "${url}"+"One?snum="+$(this).html();
		console.log(url);
		window.location.href=url;
	});
}
</script>
</body>
</html>