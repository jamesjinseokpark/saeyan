<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.hk.saeyan.dto.OrderList"%>
<%@ page import="java.util.List"%>
<%
List<OrderList> user = (List<OrderList>) request.getAttribute("order");
%>     
<%@ include file="../include/headerReal.jsp" %>
<%@ include file="../include/sbheader.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
.mg{
	margin-left: 20%;
	margin-right: 20% !important;
}

.align{
	text-align: center;
}

.ml-20{
	margin-left:45%;
	margin-top: 5%;
	margin-bottom: 5% !important;
}

.h3, h4 {
    font-size: 5rem;
}
</style>

<div id="content-wrapper" class="d-flex flex-column">
	<div id="content" >
		<div class="container-fluid">
			<h3 class="h3 mb-2 text-gray-800 ml-20" >주문내역</h3>
<!-- 			<p class="mb-4 ml-20"> -->
<!-- 				&nbsp;&nbsp;&nbsp;<a href="../">메인으로 이동</a> -->
<!-- 			</p> -->
			<div class="card shadow mb-4 mg" >
				<div class="card-body align">
					<div class="table-responsive table-width">
						<table class="table table-bordered " id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr style="font-size: 20px;">
									<th>주문번호</th>
									<th>업체명</th>
									<th>결제날짜</th>
								</tr>
							</thead>
<%-- 							<c:choose> --%>
<!-- 								<tr> -->
<%-- 								<td><c:when test = "${user.orderNum ==0}">주문내역이 없습니다.</c:when></td> --%>
<!-- 								</tr> -->
<%-- 								<c:otherwise> --%>
									<c:forEach var="order" items="${order}">
										<tr style="font-size: 17px;">
								   			<td><a href='processOne?orderNum=<c:out value="${order.orderNum }"/>'>${order. orderNum}</a></td>
								   			<td><c:out value="${order.sname }"/></td>
								   			<td><c:out value="${order.pay_date }"/></td>
							   			</tr>
								</c:forEach>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
						</table>
					</div>
				</div>
			</div>
<!-- 			<div class="btn-box"> -->
<!-- 				<a href="/" class="btn btn-blue btn-lg">MAIN</a> -->
<!-- 			</div> -->
		</div>
	</div>
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
		var url = "${url}"+"One?=order"+$(this).html();
		console.log(url);
		window.location.href=url;
	});
}
</script>
</body>
</html>