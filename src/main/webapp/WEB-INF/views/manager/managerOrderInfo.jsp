<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.hk.saeyan.dto.OrderProcess" %>
<%  
	OrderProcess orderPro = (OrderProcess)request.getAttribute("managerOrderInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>주문 상세 정보</title>
<style>
 	.tdn {cursor: pointer;}  /* 마우스 포인터가 손가락 모양으로 바꿈*/
</style>
</head>
<body>
	<c:set var="itemStr" value="${managerOrderInfo.items}"/>
	<c:set var="itemStr" value="${fn:replace(itemStr, '!@#', ':')}"/>
	<c:set var="itemStr" value="${fn:replace(itemStr, '$%^', ',')}"/>
	<c:set var="itemStr" value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
	<div id='maindiv'>
	주문번호:<input type='text' value='${managerOrderInfo.orderNum}'><br>
	ID:<input type='text' value='${managerOrderInfo.id}'><br>
	이름:<input type='text' value='${managerOrderInfo.name}'><br>
	<label>주소</label>
		<input type="text" id="sample6_postcode" placeholder="우편번호" name="storeZipCode" value="${managerOrderInfo.userZipCode}" readonly><br>
		<input type="text" id="sample6_address" placeholder="주소" name="storeFirstAddr" value="${managerOrderInfo.userFirstAddr}" readonly><br>
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="storeExtraAddr" value="${managerOrderInfo.userExtraAddr}" readonly><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="storeSecondAddr" value="${managerOrderInfo.userSecondAddr}" readonly><br>
	연락처:<input type='text' value='${managerOrderInfo.pnum}'><br>
	품목:<input type='text' class='item' value='${itemStr}'><br>
	결제금액:<input type='text' value='${managerOrderInfo.pay_price}'><br>
	결제일:<fmt:formatDate value='${managerOrderInfo.pay_date}' type='both' pattern='yyyy.MM.dd(E)(a)hh:mm:ss'/><br>
	진행 상황: <%String process="";%>
				<c:choose>
					<c:when test="${managerOrderInfo.refundDate ne null}"><%process="환불";%></c:when>
					<c:when test="${managerOrderInfo.finish ne null}"><%process="배달완료";%></c:when>
					<c:when test="${managerOrderInfo.wash ne null}"><%process="세탁중";%></c:when>
					<c:when test="${managerOrderInfo.pick ne null}"><%process="수거완료";%></c:when>
					<c:when test="${managerOrderInfo.ok ne null}"><%process="접수완료";%></c:when>
					<c:when test="${managerOrderInfo.wait ne null}"><%process="접수중";%></c:when>
				</c:choose>
				<input type='text' value='<%=process%>' class='pro'><br>
	</div>
	<button class='tdn'>전화면으로</button>
	<div id='detail'>
	</div>
<script>
console.log(document.referrer);
	//주문번호 클릭시 주문내역 상세 페이지로 이동
	$(".tdn").click(function(){
// 		var url = "orderInfo?orderNum="+$(this).html();
// 		window.location.href=url;
		
		window.location.href=document.referrer;
	});

</script>
</body>
</html>