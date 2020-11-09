<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.saeyan.dto.Members" %>
<%@ page import="com.hk.saeyan.dto.Bubble" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="../include/headerReal.jsp"%>

<%@ include file="../include/sbheader.jsp"%>


<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<div class="container-fluid">
			<h1 class="h3 mb-2 text-gray-800">버블 관리</h1>
			<p class="mb-4">
				&nbsp;&nbsp;&nbsp;<a href="../">메인으로 이동</a>
			</p>
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>충전금액</th>
									<th>충전버블</th>
									<th>버블사용</th>
									<th>버블잔량</th>
									<th>날짜</th>
								</tr>
							</thead>
							<c:forEach items="${bub}" var="bubble"> <!-- 반복문으로 tr,td생성 -->
								<tr>
									<td>${bubble.b_price}</td>
									<td>${bubble.b_bubble}</td>
									<td>${bubble.bubble}</td>
									<td>${bubble.p_bubble}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bubble.b_date}"/></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>