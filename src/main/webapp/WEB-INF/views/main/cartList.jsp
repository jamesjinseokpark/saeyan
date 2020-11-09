<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hk.saeyan.dto.Cart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Cart user = (Cart) request.getAttribute("user");
%>
<%@ include file="../include/headerReal.jsp"%>
<title>장바구니</title>
<style>
table {
	table-layout: fixed;
	margin: 0 0 1px;
	border-bottom: 1px solid #d7d5d5;
	border-top: 3px solid #d7d5d5;
	color: #757575;
	line-height: 1.5;
	font-size:12px
}

.xans-order-basketpackage .boardList th {
	padding: 11px 0 9px;
	border-left: 0px solid #e9e9e9;
	font-weight: normal;
	font-size: 11px;
	color: #000;
}

img {
	max-width: 17.5%;
}

.box{
		padding: 50px 0 0px 350px;
}
.tit-are h2 {
    text-align: center;
    line-height: 5;
    
    font-size: 50px;
    font-weight: normal;
    margin: 0;
    background: url(../images/icon_h2_blue.png) 50% 100% no-repeat;
}
[class^='btn'][class*='Fix'].sizeL {
	width: 130px;
	padding-left: 8px;
	padding-right: 8px;
	font-size: 13px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/cart.css">
<script type="text/javascript">
	function itemSum() {
		console.log("시작");
		var sum = 0;
		var count = $(".chkbox").length;
		var seq = $('input[name="cart_seq"]');
		console.log(seq);
		console.log(count);
		for (var i = 0; i < count; i++) {
			if ($(".chkbox")[i].checked == true) {
				sum += Number($(".chkbox").eq(i).val());
			}
		}
		console.log(sum);
		$("#total_sum").val(sum);

	}

	$(function() {
		$("#order").click(function() {
			if ($("#total_sum").val() == 0) {
				alert("품목을 선택해주세요");
			} else {
				var ok = confirm("결제 하시겠습니까?");
				if (ok) {
					var count = $(".chkbox").length;
					var seq = $('input[name="cart_seq"]');
					for (var i = 0; i < count; i++) {
						if ($(".chkbox")[i].checked == true) {
							var seq_val = seq.eq(i).val();
							seq.eq(i).prop("value", seq_val + "Y");
							console.log(seq.eq(i).val());
						} else {
							var seq_val = seq.eq(i).val();
							seq.eq(i).prop("value", seq_val + "N");
							console.log(seq.eq(i).val());
						}
					}
					$("#cartform").submit();
				} else {
					return false;
				}
			}
		});
	});
</script>
<div id="container">
	<div id="contents">


		<div class="tit-are">
				<h2>CART</h2>
				
			</div>
<form id="cartform" method="post">
		<!-- 장바구니 모듈 Package -->
		<div class="xans-element- xans-order xans-order-basketpackage ">
			
			<div class="orderListArea">
				<div class="xans-element- xans-order xans-order-normtitle title ">
					<h3>일반상품</h3>
				</div>

				<!-- 일반상품 (기본배송) -->
				<table border="0" summary=""
					class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
					
					<thead>
						<tr>
							<th scope="col" class="chk">checkbox</th>
							<th></th>
							<th></th>
							<th scope="col" class="stores">업체명</th>
							<th></th>

							<th scope="col" class="product">품목</th>
							<th></th>
							<th scope="col" class="price">가격</th>
							<th></th>
							<th>삭제</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="10">총 금액: <strong class="total"><span><input
										type="text" class="total-cart-p" id="total_sum"></span>원</strong> <span
								class="displaynone"> </span></td>
						</tr>
					</tfoot>
					<tbody class="xans-element- xans-order xans-order-list">
						<tr class="xans-record-">
						<tbody class="xans-element- xans-order xans-order-list">
						<c:forEach var="cart" items="${cartList}">
							<tr class="xans-record-">
								<!--                 	 <td><input type="checkbox" name="choice" checked="checked"></td> -->
								<td class="product-close"><input type="checkbox"
									name="chkbox" onClick="itemSum()" class="chkbox" id="id"
									value="${cart.pay_cart}" /></td>
								<td></td>
								
								<td>${cart.sname}</td>
								<td></td>
								<c:set var="itemStr" value="${cart.items}" />
								<c:set var="itemStr" value="${fn:replace(itemStr, '!@#', ':')}" />
								<c:set var="itemStr" value="${fn:replace(itemStr, '$%^', ',')}" />
								<c:set var="itemStr"
									value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
								<td class='item'>${itemStr}</td>
								<td></td>
								
								<td>${cart.pay_cart}</td>
								<td></td>
								<td></td>
								<td><a href="javascript:;" class="btnNormal"
									onclick="location.href='delete?cart_seq=${cart.cart_seq}'"><i
										class="icoDelete"></i> 삭제</a></td>
								<%-- 						<input type="button" value="삭제" onclick="location.href='delete?cart_seq=${cart.cart_seq}'"></td> --%>
							</tr>

							<input type="hidden" name="cart_seq" value="${cart.cart_seq}" />
						</c:forEach>						
						
					</tbody>
				</table>
				
			</div>
		<div class="box">
		
			
				<span class="gRight"> <a href="/stores/map"
					class="btnNormalFix sizeL">빨래계속하기</a>
				</span> <a onclick='location.href="pay"' id='order' class=" "><img
					src="/resources/images/btn_order_all.png" alt="구매하기" title=""></a>
	</div>
		</form>
	</div>
</div>
<script>
	//들오오자마자 체크박스에 체크해주기
	var ck = "${cart}";
	if (ck == 'false') {
		$("#allCheck").prop("checked", false);
	} else {
		$("#allCheck").prop("checked", true);
		$(".chkbox").prop("checked", true);
		itemSum();
	}
</script>

<%@ include file="../include/footer.jsp"%>
				



