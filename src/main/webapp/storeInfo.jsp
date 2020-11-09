<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한경세탁 | 카카오맵</title>

<style type="text/css">

#target1 {
	color: #2C952C;
	text-align: center;
	padding: 15px;
}


</style>
</head>
<body onload="init();">
<script language="JavaScript">

var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add (num) {
	if(num==1){
		hm = document.form.amount;
	} else if(num==2){
		hm = document.form2.amount;
	}

	sum = document.form.sum;
	hm.value ++ ;

	

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
	
}  



</script>



<h1 id='target1'>한경 컴퓨터 크리닝</h1>

<form  id="n1" name="form" method="get">
수량 : <input type=hidden name="sell_price" value="5500">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add(1);"><input type="button" value=" - " onclick="del(1);"><br>

</form>

<form id="n2" name="form2" method="get">
수량 : <input type=hidden name="sell_price" value="5500">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add(2);"><input type="button" value=" - " onclick="del(2);"><br>

</form>

<form action="cart" method="post">

<input type='submit' value='주문하기' >
<input type='button' onclick='location.href="list"' value='계쇽쇼핑하기'>

</form>

</body>
</html>