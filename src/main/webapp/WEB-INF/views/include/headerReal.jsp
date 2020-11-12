<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.hk.saeyan.dto.Members"%>
<%
	Members loginMember = (Members) session.getAttribute("loginMember");
%>
<%
	String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" /> -->
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<!-- Global site tag (gtag.js) - AdWords: 872802322 -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=AW-872802322"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'AW-872802322');
</script>
<title>새 얀</title>

<!-- head -->
<link rel="stylesheet" href="/resources/css/saeyan.css" type="text/css">
<link rel="stylesheet" href="/resources/css/customer.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/css/usePage.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700"
	rel="stylesheet">
<link rel="stylesheet" href="/kr/css/customer.css">
<script src="https://www.cleantopia.com/kr/js/jquery-2.2.3.min.js"></script>
<script src="https://www.cleantopia.com/kr/js/jquery-ui.js"></script>
<script src="https://www.cleantopia.com/kr/js/jquery.validate.js"></script>
<script src="https://www.cleantopia.com/kr/js/jquery.bpopup.min.js"></script>
<script src="https://www.cleantopia.com/kr/js/jquery.bxslider.min.js"></script>
<script src="https://www.cleantopia.com/kr/js/chosen/chosen.jquery.js"></script>
<script src="https://www.cleantopia.com/kr/js/owl.carousel.js"></script>
<script src="https://www.cleantopia.com/kr/js/custom.js"></script>
<script src="https://www.cleantopia.com/kr/js/menulink.js"></script>

</head>
<body>
	<div id="wrap">

		<div id="header">
			<h1 class="logo">
				<a href="/"></a>
			</h1>
			<div id="gnb-wrap">
				<ul id="gnb">
					<li class="gnb1"><a href="#">새 얀</a>
						<div class="subdepth">
							<div class="tit-tx">
								<strong>새얀 서비스</strong> 새얀의 서비스를 <br>소개합니다.
							</div>
							<div class="inner">
								<ul>
									<li><a href="/main/company">회사소개</a></li>
								</ul>
								<ul>
									<li><a href="/main/price">가격표</a></li>
								</ul>
								<ul>
									<li><a href="/main/use">이용방법</a></li>
								</ul>
							</div>
						</div></li>
					<li class="gnb2"><a href="#">세탁소찾기</a>
						<div class="subdepth">
							<div class="tit-tx">
								<strong>세탁소찾기</strong> 가까운 세탁소를<br>찾아보세요.
							</div>
							<div class="inner">
								<ul>
									<li><a href="/stores/noUserMap">통합검색</a></li>
								</ul>
								<ul>
									<li><a href="/stores/map">인근세탁소</a></li>
								</ul>
								<ul>
									<li><a href="stores/like">관심점포</a></li>
								</ul>
							</div>
						</div></li>
					<li class="gnb3"><a href="#">고객지원</a>
						<div class="subdepth">
							<div class="tit-tx">
								<strong>고객지원</strong> 새얀은 고객만족을 위해<br>항상 노력합니다.
							</div>
							<div class="inner">
								<ul>
									<li><a href="/support/notice">공지사항</a></li>
								</ul>
								<ul>
									<li><a href="/support/faq">FAQ</a></li>
								</ul>
								<ul>
									<li><a href="/support/tip">세탁팁</a></li>
								</ul>
							</div>
						</div></li>

					<c:choose>

						<c:when test="${loginMember.grade eq '0'}">
							<li class="gnb3"><a href="#"><c:out
										value="${loginMember.name}"></c:out></a>
								<div class="subdepth">
									<div class="tit-tx">
										<strong><c:out value="${loginMember.name}"></c:out>님</strong>
										일반 회원과 점주들의 정보를<br>확인 및 수정할 수 있습니다.
									</div>
									<div class="inner">
										<ul>
											<li><a href="/admin/memberList">회원 관리</a></li>
											<li><a href="/admin/storeList">점포 관리</a></li>
											<li><a href="/admin/price">가격 관리</a></li>
										</ul>
										<ul>
											<li><a href="/admin/aChat">게시글 관리</a></li>
											<li><a href="/admin/stat">통계 관리</a></li>
											<li><a href="/admin/assets">정산 관리</a></li>
										</ul>
										<ul>
											<li><a href="/admin/account">자산 관리</a></li>
											<li><a href="/auth/logout">로그아웃</a></li>
										</ul>
									</div>
								</div></li>
						</c:when>
						<c:when test="${loginMember.grade eq '1'}">
							<li class="gnb3"><a href="#"><c:out
										value="${loginMember.name}"></c:out></a>
								<div class="subdepth">
									<div class="tit-tx">
										<strong><c:out value="${loginMember.name}"></c:out>님</strong>
										새얀에 오신걸 환영합니다.<br>정보수정 및 세탁진행 상황을 <br>확인할 수 있습니다.
									</div>
									<div class="inner">
										<ul>
											<li><a href="/user/update">회원정보 수정</a></li>
											<li><a href="/user/creditCard">등록된 카드 관리</a></li>
											<li><a href="/user/bubbleList">버블 관리</a></li>
										</ul>
										<ul>
											<li><a href="/stores/cart">장바구니</a></li>
											<li><a href="/user/process">세탁 진행상황</a></li>
											<li><a href="/user/review">리뷰 관리</a></li>
										</ul>
										<ul>
											<li><a href="/user/cChatL">관리자 문의</a></li>
											<li><a href="/user/schat">업체 문의</a></li>
											<li><a href="/auth/logout">로그아웃</a></li>
											<li><a href="/user/delet">회원탈퇴</a></li>
										</ul>
									</div>
								</div></li>
						</c:when>
						<c:when test="${loginMember.grade eq '2'}">
							<li class="gnb3"><a href="#"><c:out
										value="${loginMember.name}"></c:out></a>
								<div class="subdepth">
									<div class="tit-tx">
										<strong><c:out value="${loginMember.name}"></c:out>님</strong>
										세얀에 오신걸 환영합니다.<br>개인정보 및 업체의 정보를 <br>수정할 수 있습니다.
									</div>
									<div class="inner">
										<ul>
											<li><a href="/manager/ownerUpdate">개인정보 수정</a></li>
											<li><a href="/manager/add">점포 추가등록</a></li>
											<li><a href="/manager/update">점포 수정</a></li>
											<li><a href="/manager/delete">점포 삭제</a></li>
										</ul>
										<ul>
											<li><a href="/manager/process">세탁 진행 상황</a></li>
											<li><a href="/manager/review">리뷰 관리</a></li>
											<li><a href="/manager/aChat">문의글 관리</a></li>
											<li><a href="/manager/stat">통계 관리</a></li>
										</ul>
										<ul>
											<li><a href="/manager/assets">정산 관리</a></li>
											<li><a href="/auth/logout">로그아웃</a></li>
											<li><a href="/manager/ownerDelete">회원탈퇴</a></li>
										</ul>
									</div>
								</div></li>
						</c:when>
						<c:otherwise>
							<a href="#"><c:out
										value="${loginMember.name}"></c:out></a>
							<li class="gnb3"><a href="#">회원가입</a>
								<div class="subdepth">
									<div class="tit-tx">
										<strong>회원가입</strong> 세탁을 맡기는 회원뿐만 아니라<br>세탁 서비스를 제공하는
										업주님도 <br>모두 새얀의 회원입니다.
									</div>
									<div class="inner">
										<ul>
											<li><a href="/auth/addOwner">업주회원</a></li>
										</ul>
										<ul>
											<li><a href="/auth/addCustomer">일반회원</a></li>
										</ul>
									</div>
								</div></li>

							<li class="gnb3"><a href="/auth/login">로그인</a>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<button class="bt-menu">
				<span>메뉴</span>
			</button>
		</div>
	</div>