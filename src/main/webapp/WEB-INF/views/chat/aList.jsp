<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ include file="../include/sbheader.jsp"%>


<%-- <c:forEach var="member" items="${members}">
	${member.mno } , ${member.email } , ${member.pwd } , ${member.mname } , ${member.cre_date } , ${member.mod_date } <br>
</c:forEach> --%>

<title>1:1 문의게시판(관리자에게)</title>


<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">문의글 게시판</h1>
			<p class="mb-4">
				&nbsp;&nbsp;&nbsp;<a href="../admin/aChatW">새글작성</a>
				&nbsp;&nbsp;&nbsp;<a href="../">메인으로 이동</a>
			</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">

				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>게시글 번호</th>
									<th>게시글 제목</th>
									<th>게시글 작성자</th>
									<th>등록일</th>
									<th>회원등급</th>
								</tr>
							</thead>
						<c:forEach items="${list}" var="list">
						<c:set var="actor" value="${list.g_check}" />
						<c:set var="actor" value="${fn:replace(actor, '0', '관리자')}" />
						<c:set var="actor" value="${fn:replace(actor, '1', '일반회원')}" />
						<c:set var="actor" value="${fn:replace(actor, '2', '업주회원')}" />

						<tr>
							<td><c:out value="${list.c_no}" /></td>
							<td><a href="/admin/aChatR?c_no=${list.c_no}"><c:out
										value="${list.c_title}" />&nbsp; 
										<c:if test="${list.c_cnt ne null }">
										<small><b>[&nbsp;<c:out value="${list.c_cnt}"/>&nbsp;]
										</b></small>
									</c:if></a></td>
							<td><c:out value="${list.w_id}" /></td>
							<td><fmt:formatDate value="${list.c_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${actor}" /></td>

						</tr>
					</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2020</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->


<%@include file="../include/sbfooter.jsp"%>