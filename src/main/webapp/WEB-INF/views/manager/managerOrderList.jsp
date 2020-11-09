<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.hk.saeyan.dto.OrderProcess" %>
<%@ page import="java.util.List" %>
<%  
	List<OrderProcess> orderPro = (List<OrderProcess>)request.getAttribute("managerOrderList");
%>
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
			<td>주문번호</td>
			<td>ID</td>
			<td>주문자명</td>
			<td>주소</td>
			<td>품목</td>
			<td>진행상태</td>
		</tr>
		<c:forEach items="${managerOrderList}" var="list"> <!-- 반복문으로 tr,td생성 -->
			<tr>
				<td class='tdn'>${list.orderNum}</td>
				<td>${list.id}</td>
				<td>${list.name }</td>
				<td>${list.userFirstAddr}&nbsp;${list.userSecondAddr}&nbsp;${list.userExtraAddr}</td>
				<c:set var="itemStr" value="${list.items}"/>
      			<c:set var="itemStr" value="${fn:replace(itemStr, '!@#', ':')}"/>
      			<c:set var="itemStr" value="${fn:replace(itemStr, '$%^', ',')}"/>
				<c:set var="itemStr" value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
      			<td class='item'>${itemStr}</td>
				<%String process="";%>
				<c:choose>
					<c:when test="${list.refundDate ne null}"><%process="환불";%></c:when>
					<c:when test="${list.finish ne null}"><%process="배달완료";%></c:when>
					<c:when test="${list.wash ne null}"><%process="세탁중";%></c:when>
					<c:when test="${list.pick ne null}"><%process="수거완료";%></c:when>
					<c:when test="${list.ok ne null}"><%process="접수완료";%></c:when>
					<c:when test="${list.wait ne null}"><%process="접수중";%></c:when>
				</c:choose>
				<td class='process'>
				<input type='hidden' value='<%=process%>' class='pro'>
					<select id="${list.orderNum}" class="sel"> 
  						<option value="접수중">접수중</option>
  						<option value="접수완료">접수완료</option>
  						<option value="수거완료">수거완료</option>
  						<option value="세탁중">세탁중</option>
  						<option value="배달완료">배달완료</option>
  						<option value="환불" disabled>환불</option>
  			  		</select>
  			  	</tr>
		</c:forEach>
	</table>
	</div>
	<div id='detail'>
	</div>
<script>

window.onload = function(){	
	$(".tdn").mouseover(function(){  //마우스가 올라왔을때 색깔 빨간색으로
		$(this).css("color","red");
	});

	$(".tdn").mouseout(function(){  //마우스가 벗어났을때 색깔 검은색으로
		$(this).css("color","black");
	});

	//진행상태값을 DB에서 가져와서 Select의 기본선택된 값을 바꿔줌
	var sel = document.getElementsByClassName('sel');
	var pro = document.getElementsByClassName('pro');

	for(var i=0;i<pro.length;i++){
		if(pro[i].value==="접수중"){
			sel[i].value = "접수중";
		} else if(pro[i].value==="접수완료"){
			sel[i].value = "접수완료";
		} else if(pro[i].value==="수거완료"){
			sel[i].value = "수거완료";
		}else if(pro[i].value==="세탁중"){
			sel[i].value = "세탁중";
		}else if(pro[i].value==="배달완료"){
			sel[i].value = "배달완료";
		}else if(pro[i].value==="환불"){
			sel[i].value = "환불";
			sel[i].disabled=true;
		}
	}
	
	//전화면으로 클릭시 전 화면으로 돌아가기
	$(".tdn").click(function(){
		var url = "orderInfo?orderNum="+$(this).html();
		window.location.href=url;
	});

	// 진행 상황 변경시 바로 디비에 적용하는 ajax
	$(".sel").change(function() {
		//var pwdch = document.getElementById('pwdcheck').value;
		console.log($(this).attr("id"));
		console.log($(this).val());
		var num = parseInt($(this).attr("id"));
			$.ajax({
				url : '/manager/rest/process',
				data : { 
					orderNum : num,
					process : $(this).val()
				},
				dataType : 'text', /*html, text, json, xml, script*/
				method : 'get',
				success : function(data) {
					if(data==1){
						alert("변경이 잘됨");
// 						$("#result").text("비밀번호가 일치 하지 않습니다.");
					} else {
						alert("변경이 안됨");
// 						$("#result").text("비밀번호가 일치합니다.");
					}
				}
			})
	});
}	
</script>
</body>
</html>