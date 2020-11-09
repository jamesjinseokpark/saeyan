<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/headerReal.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/cart.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tit h2 {
	text-align: center;
	padding-top: 50px;
	font-size: 50px;
}
.box{

	margin-right: 10% !important;
    margin-left: 40% !important;
}
#contents  {
	margin: 0 auto;
	width: 1246px;
	min-height: 400px !important;
}
</style>
<div class="tit">
	<h2>결제내역</h2>

</div>


<div id="container">
	<div id="contents">

		<!-- 장바구니 모듈 Package -->
		<div class="xans-element- xans-order xans-order-basketpackage ">

			<div class="orderListArea">
				<div class="xans-element- xans-order xans-order-normtitle title ">
					<h3 style="font-size:18px">결제가 완료되었습니다</h3>
				</div>

				<!-- 일반상품 (기본배송) -->
				<table border="0" summary=""
					class="xans-element- xans-order xans-order-normnormal boardList xans-record-">

					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문품목</th>
							<th>상품금액</th>
							<th>버블사용</th>
							<th>결제수단</th>
						</tr>
					</thead>
					
					
							<tbody
						class="xans-element- xans-order xans-order-list">
						<c:forEach var="payList" items="${payChk}">
										<tr>
											<td>${payList.orderNum}</td>
											<c:set var="itemStr" value="${payList.items}" />
											<c:set var="itemStr"
												value="${fn:replace(itemStr, '!@#', ':')}" />
											<c:set var="itemStr"
												value="${fn:replace(itemStr, '$%^', ',')}" />
											<c:set var="itemStr"
												value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
											<td class='item'>${itemStr}</td>
											<td>${payList.pay_price}</td>
											<td>${payList.bubble}</td>
											<td>카카오페이</td>

										</tr>

									</c:forEach>					
						
					</tbody>
				</table>
				
			</div>
		
		</div>
	</div>
</div>
<div class="box">
		
				<span class="gRight"> <a href="/user/process"
					class="btnNormalFix sizeL">주문내역</a>
				</span> <span class="gRight"> <a href="/"
					class="btnNormalFix sizeL"   >메인페이지</a>
				</span>
			
	</div>
						

<%@ include file="../include/footer.jsp"%>