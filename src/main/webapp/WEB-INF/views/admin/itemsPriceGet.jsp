<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.hk.saeyan.dto.Product" %>
<%@ page import="java.util.List" %>
<%
	List<Product> pri = (List<Product>)request.getAttribute("itp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>가격 정보 수정</title>
</head>
<body>
<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
			<h3>가격 정보 수정</h3>
			</div>
		</div>
		<div id='maindiv'>
				<input type='text' value='품목명' readonly>:<input type='text' value='품목코드' readonly>
				<input type='text' value='가격' readonly>
				<br>
			<c:forEach var='item' items='${itp}' >
				<form action='price' method='post'>
					<input type='hidden' name='pno' value='${item.pno }' readonly>
					<input type='text' name='pname' value='${item.pname }'>:<input type='text' name='pcode' value='${item.pcode }'>
					<input type='text' name='pprice' value='${item.pprice }'>
					<button onclick='updatePrice()'>수정</button>
					<button onclick='deleteItem(${item.pno})'>삭제</button>
				</form>		
			</c:forEach>
	</div>
		<label>품목 추가</label><br>
		품목명 :<input type='text' id='pname' name='pname' value=""><br>
		코드명 :<input type='text' id='pcode' name='pcode' value=""><br>
		가격    :<input type='text' id='pprice' name='pprice' value=""><br>
		<button onclick='insertItem()'>추가</button>
	</article>
<script>

function updatePrice(){

	$("form").submit();
}

function deleteItem(pno){
	$.ajax({
		url : '/admin/rest/deleteItem',
		data : { 
			pno : pno
		},
		dataType : 'text', /*html, text, json, xml, script*/
		method : 'get',
		success : function(data) {
			location.reload();
		}
	})
}




function insertItem(){
	var pname = $('#pname').val();
	var pcode = $('#pcode').val();
	var pprice = $('#pprice').val();

	$.ajax({
		url : '/admin/rest/insertItem',
		data : { 
			pname : pname,
			pcode : pcode,
			pprice : pprice
		},
		dataType : 'text', /*html, text, json, xml, script*/
		method : 'get',
		success : function(data) {
			location.reload();
		}
	})
}

</script>	
</body>
</html>