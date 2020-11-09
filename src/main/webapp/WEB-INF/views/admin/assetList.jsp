<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.fasterxml.jackson.annotation.JsonFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>업체 리스트</title>
</head>
<body>
<h1>업체 리스트</h1>
<button onclick='list()'>업체 리스트</button>&nbsp;&nbsp;&nbsp;
<button onclick='acheck()'>미정산 리스트</button>
<div id='list'>
<table border="1">
	<tr>
		<td>번호</td>
		<td>사업자번호</td>
		<td>업체명</td>
		<td>업주ID</td>
		<td>업체주소</td>
		<td>업체번호</td>
		<td>통계보기</td>
	</tr>
	<%int i=1; %>
	<c:forEach items="${stores}" var="store"> <!-- 반복문으로 tr,td생성 -->
		<tr>
		<td><%=i %></td>
		<td>${store.snum }</td>
		<td>${store.sname }</td>
		<td>${store.id }</td>
		<td>${store.storeFirstAddr }&nbsp;${store.storeSecondAddr}&nbsp;${store.storeExtraAddr}</td>
		<td>${store.scontact }</td>
		<td><button onclick="window.location.href='assetOne?snum=${store.snum}'">보기</button></td>
		<%i++; %>
		</tr>
	</c:forEach>
</table>
</div>
</body>
<script>


function acheck(){
	$('#list').children().remove();
	
	$.ajax({
		url : '/admin/rest/assetAcheck',
		dataType : 'json', /*html, text, json, xml, script*/
		method : 'get',
		async : false,
		success : function(data){
		var str = "";
		str += '<table border="1">';
		str += '<tr><td>번호</td>	<td>사업자번호</td>	<td>업체명</td><td>정산시작기간</td><td>정산끝기간</td><td>정산금액</td><td>정산여부</td></tr>';
		for(var i in data){
		str += '<tr><td>'+data[i].asset_seq+'</td>';
		str += '<td>'+data[i].snum+'</td>';
		str += '<td>'+data[i].sname+'</td>';
		str += '<td>'+data[i].periodStart+'</td>';
		str += '<td>'+data[i].periodEnd+'</td>';
		str += '<td>'+data[i].a_price+'</td>';
		
// 			if(data[i].a_date==null){
// 				str += '<td></td>';
// 			} else {
// 				str += '<td>'+data[i].a_date+'</td>';
// 			}
		str += '<td><select  name="'+data[i].asset_seq+'">';
		str += '<option value="N">N</option><option value="Y">Y</option></select></td>';
		}
		str += '</table>';
		
		$('#list').html(str);	
		}
	
	
	});

	$('select').change(function(){
		var asset_seq = $(this).attr("name");
		var aa_check = $(this).find('option:selected').val();
		$.ajax({
			url : '/admin/rest/assetAcheckPost',
			dataType : 'json', /*html, text, json, xml, script*/
			data : {
				asset_seq : asset_seq,
	 			a_check : aa_check
			},
			method : 'get',
			async : false,
			success : function(data){
			}
		});	
	});

	
}


function list(){
	window.location.href='assets';
}


window.onload=function(){
	
// 	$('select').change(function(){
// 		var snum = $(this).attr("name");
// 		var aa_check = $(this).find('option:selected').val();
// 		console.log(aa_check);
// 		console.log(snum);
//	 	$.ajax({
//	 		url : '/admin/rest/assetAcheckPost',
//	 		dataType : 'json', /*html, text, json, xml, script*/
//	 		method : 'get',
//	 		data : {
//	 			snum : snum,
//	 			a_check : 
//	 		},
//	 		success : function(data){
				
//	 		}
//	 	});
// 	});
}
</script>
</html>