<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="all" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css"  href="/resources/css/mainTotal.css">
<link href="https://www.moduparking.com/wp-includes/css/dist/block-library/style.min.css?ver=5.1.1" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/plugins/appbanners/lib/smartbanner/jquery.smartbanner.min.css?ver=5.1.1" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/themes/virtue/assets/css/virtue.css?ver=321" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/themes/virtue/assets/css/skins/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Caudex%7CLato%3A400%2C700%7CNoto+Sans%3A700%2C400&subset=latin&ver=1589409769" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/plugins/jetpack/css/jetpack.css?ver=7.1.1" rel="stylesheet">
<script type='text/javascript' src='https://www.moduparking.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://www.moduparking.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<link rel='https://api.w.org/' href='https://www.moduparking.com/wp-json/'/>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://www.moduparking.com/xmlrpc.php?rsd"/>
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://www.moduparking.com/wp-includes/wlwmanifest.xml"/> 
<meta name="generator" content="WordPress 5.1.1"/>
<link rel='shortlink' href='https://wp.me/9UVxG'/>
<meta name="apple-itunes-app" content="app-id=780174422">
<meta name="google-play-app" content="app-id=com.parkingshare.mobile">
<meta name="author" content="Modu Company Inc.">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel='dns-prefetch' href='//v0.wordpress.com'/>
<link rel='dns-prefetch' href='//i0.wp.com'/>
<link rel='dns-prefetch' href='//i1.wp.com'/>
<link rel='dns-prefetch' href='//i2.wp.com'/>
<style type='text/css'>img#wpstats{display:none}</style><style type="text/css">#logo{padding-top:17px}#logo{padding-bottom:20px}#logo{margin-left:0}#logo{margin-right:0}#nav-main{margin-top:13px}#nav-main{margin-bottom:5px}.headerfont,.tp-caption{font-family:Lato}.topbarmenu ul li{font-family:Noto\ Sans}.home-message:hover{background-color:#09f;background-color:rgba(0,153,255,.6)}nav.woocommerce-pagination ul li a:hover,.wp-pagenavi a:hover,.panel-heading .accordion-toggle,.variations .kad_radio_variations label:hover,.variations .kad_radio_variations label.selectedValue{border-color:#09f}a,#nav-main ul.sf-menu ul li a:hover,.product_price ins .amount,.price ins .amount,.color_primary,.primary-color,#logo a.brand,#nav-main ul.sf-menu a:hover,.woocommerce-message:before,.woocommerce-info:before,#nav-second ul.sf-menu a:hover,.footerclass a:hover,.posttags a:hover,.subhead a:hover,.nav-trigger-case:hover .kad-menu-name,.nav-trigger-case:hover .kad-navbtn,#kadbreadcrumbs a:hover,#wp-calendar a,.star-rating{color:#09f}.widget_price_filter .ui-slider .ui-slider-handle,.product_item .kad_add_to_cart:hover,.product_item:hover a.button:hover,.product_item:hover .kad_add_to_cart:hover,.kad-btn-primary,html .woocommerce-page .widget_layered_nav ul.yith-wcan-label li a:hover,html .woocommerce-page .widget_layered_nav ul.yith-wcan-label li.chosen a,.product-category.grid_item a:hover h5,.woocommerce-message .button,.widget_layered_nav_filters ul li a,.widget_layered_nav ul li.chosen a,.wpcf7 input.wpcf7-submit,.yith-wcan .yith-wcan-reset-navigation,#containerfooter .menu li a:hover,.bg_primary,.portfolionav a:hover,.home-iconmenu a:hover,p.demo_store,.topclass,#commentform .form-submit #submit,.kad-hover-bg-primary:hover,.widget_shopping_cart_content .checkout,.login .form-row .button,.variations .kad_radio_variations label.selectedValue,#payment #place_order,.wpcf7 input.wpcf7-back,.shop_table .actions input[type="submit"].checkout-button,.cart_totals .checkout-button,input[type="submit"].button,.order-actions .button{background:#09f}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{-webkit-appearance:none;margin:0}input[type="number"]{-moz-appearance:textfield}.quantity input::-webkit-outer-spin-button,.quantity input::-webkit-inner-spin-button{display:none}.topclass{background:#09f}.kad-hidepostauthortop,.postauthortop{display:none}@media (-webkit-min-device-pixel-ratio:2),(min-resolution:192dpi){#logo .kad-standard-logo{display:none}#logo .kad-retina-logo{display:block}}.product_item .product_details h5{min-height:40px}[class*="wp-image"]{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border:none}[class*="wp-image"]:hover{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border:none}.light-dropshaddow{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}@media (max-width:767px){.kad-desktop-slider{display:none}}#nav-main .sf-menu>li:hover,#nav-main .sf-menu>li.current-menu-item{border-bottom:2px solid #2d5c88}#nav-main .sf-menu>li.current-menu-item>a{color:#2d5c88}@media (min-width:1200px){img.automobile-next-line{display:inline-block}#info-video{padding:27px}}@media (max-width:640px){.portfolio_item_wrapper{width:100%!important}.portfolio_content{padding:0 10px!important}}.motive-page-row{margin-top:100px}.motive-page-left{text-align:center}.motive-page-left img{vertical-align:middle}.motive-page-right p{font-size:16px}.motive-post{background:#f5f5f5;width:345px;margin:5px;border:0!important;padding:30px!important}.portfolio_item .portfoliolink{opacity:1!important}.portfolio_item{width:100%}.portfolio_item_wrapper{background:#fff;margin-bottom:10px;margin-top:10px;!important;text-align:center;width:300px}.portfolio_content{background:#f5f5f5;padding:0 30px}#portfoliowrapper{text-align:center}.piteminfo p{color:#515151!important}.post_newmark{position:absolute;top:10px;right:10px;background:#d9534f;padding:3px;color:#fff;border-radius:3px}#smartbanner.android{border-top:none;background:-webkit-linear-gradient(top,#f4f4f4 0%,#cdcdcd 100%)}.tac{text-align:center!important}.dib{display:inline-block!important}.w270{width:270px}.vam{vertical-align:middle!important}.mb10{margin-bottom:10px!important}.mb15{margin-bottom:15px!important}#main_down_full_btn{display:none;width:100%;height:100%;position:absolute}.main_down_btn{width:150px;height:50px;display:block;position:absolute;bottom:24px}#android_btn{left:405px;top:363px}#iphone_btn{left:600px;top:363px}@media (max-width:1200px){.main_down_btn{width:120px;height:40px;bottom:22px}#android_btn{left:334px;top:295px}#iphone_btn{left:490px;top:295px}}@media (max-width:992px){.main_down_btn{width:90px;height:30px;bottom:17px}#android_btn{left:257px;top:227px}#iphone_btn{left:377px;top:227px}}@media (max-width:770px){.main_down_btn{display:none}#main_down_full_btn{display:block}}</style>
<style type="text/css" class="options-output">header #logo a.brand,.logofont{font-family:Caudex;line-height:0;font-weight:normal;font-style:normal;font-size:0}.kad_tagline{font-family:Lato;line-height:20px;font-weight:400;font-style:normal;color:#444;font-size:14px}.product_item .product_details h5{font-family:Lato;line-height:20px;font-weight:700;font-style:normal;color:#39f;font-size:16px}h1{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:38px}h2{font-family:Lato;line-height:40px;font-weight:normal;font-style:normal;font-size:32px}h3{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:28px}h4{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:24px}h5{font-family:Lato;line-height:24px;font-weight:700;font-style:normal;font-size:18px}body{font-family:Verdana,Geneva,sans-serif;line-height:20px;font-weight:400;font-style:normal;font-size:14px}#nav-main ul.sf-menu a{font-family:"Noto Sans";line-height:50px;font-weight:700;font-style:normal;color:#09f;font-size:15px}#nav-second ul.sf-menu a{font-family:"Noto Sans";line-height:22px;font-weight:400;font-style:normal;font-size:15px}.kad-nav-inner .kad-mnav,.kad-mobile-nav .kad-nav-inner li a,.nav-trigger-case{font-family:"Noto Sans";line-height:20px;font-weight:400;font-style:normal;color:#09f;font-size:16px}</style>
</head>
<body>
	<div id="wrapper">
		<header class="banner headerclass">
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix kad-header-left">
						<div id="logo" class="logocase">
							<a class="brand logofont" href="https://www.moduparking.com/">
                            	<div id="thelogo">
                   					<img src="https://www.moduparking.com/wp-content/uploads/2016/01/logo_s060118.png" alt="쉽고 편리한 주차 플랫폼 모두의주차장" width="257" height="47" class="kad-standard-logo">
                                    <img src="https://www.moduparking.com/wp-content/uploads/2016/01/logo_l060118.png" alt="쉽고 편리한 주차 플랫폼 모두의주차장" width="519" height="94" class="kad-retina-logo" style="max-height:47px">                   
                                </div>
                            </a>
						</div>
					</div>
					<div class="col-md-8 clearfix kad-header-right">
						<nav id="nav-main" class="clearfix" itemscope="" itemtype="http://schema.org/SiteNavigationElement">
              				<ul id="menu-%ea%b8%b0%eb%b3%b8%eb%a9%94%eb%89%b4" class="sf-menu sf-js-enabled">
              					<li class="menu-%ec%84%9c%eb%b9%84%ec%8a%a4%ec%86%8c%ea%b0%9c sf-dropdown menu-item-1303">
              						<a href="https://www.moduparking.com/service/" class="sf-with-ul">새  얀<span class="sf-sub-indicator"> »</span></a>
									<ul class="sf-dropdown-menu" style="display: none;">
										<li class="menu-%ec%84%9c%eb%b9%84%ec%8a%a4-%ec%86%8c%ea%b0%9c-%ec%98%81%ec%83%81 menu-item-1256">
											<a href="/main/company">회사소개</a>
											<a href="/main/price">가격표</a>
											<a href="/main/use">이용방법</a>
										</li>
									</ul>
								</li>
								<li class="menu-%eb%aa%a8%eb%b0%94%ec%9d%bc-%ec%95%b1-%ec%9d%b4%ec%9a%a9%ec%95%88%eb%82%b4 sf-dropdown menu-item-1741"><a href="/stores/noUserMap" class="sf-with-ul">점포찾기<span class="sf-sub-indicator"> »</span></a>
									<ul class="sf-dropdown-menu" style="display: none;">
										<li class="menu-%eb%aa%a8%eb%b0%94%ec%9d%bc-%ec%95%b1-%ec%84%a4%ec%b9%98-%eb%b0%8f-%ea%b0%80%ec%9e%85%ec%95%88%eb%82%b4 menu-item-1731"><a href="/stores/map">인근점포</a></li>
										<li class="menu-%eb%aa%a8%eb%b0%94%ec%9d%bc-%ec%a3%bc%ec%b0%a8%ea%b6%8c-%ec%95%88%eb%82%b4 menu-item-1022"><a href="stores/like">관심점포</a></li>
									</ul>
								</li>
								<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/support" class="sf-with-ul">고객지원<span class="sf-sub-indicator"> »</span></a>
									<ul class="sf-dropdown-menu" style="display: none;">
										<li class="menu-%ea%b3%b5%ec%9c%a0%ec%a3%bc%ec%b0%a8%ec%9e%a5-%ec%9d%b4%ec%9a%a9%ed%95%98%ea%b8%b0 menu-item-1382"><a href="/support/notice">공지사항</a></li>
										<li class="menu-%ea%b1%b0%ec%a3%bc%ec%9e%90%ec%9a%b0%ec%84%a0%ec%a3%bc%ea%b1%b0%ec%a7%80%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0 menu-item-1021"><a href="/support/faq">FAQ</a></li>
										<li class="menu-%ec%82%ac%ec%9c%a0%ec%a7%80-%ec%a3%bc%ec%b0%a8%ea%b3%b5%ea%b0%84-%ea%b3%b5%ec%9c%a0 menu-item-1144"><a href="/support/tip">세탁팁</a></li>
									</ul>
								<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/auth/registration" class="sf-with-ul">회원가입<span class="sf-sub-indicator"> »</span></a>
									<ul class="sf-dropdown-menu" style="display: none;"></ul>
								</li>
								<c:choose>
									<c:when test="${loginMember.grade eq '0'}">
										<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/main/main" class="sf-with-ul"><c:out value="${loginMember.name}"></c:out><span class="sf-sub-indicator"> »</span></a>
											<ul class="sf-dropdown-menu" style="display: none;">
												<li class="menu-%ec%84%9c%eb%b9%84%ec%8a%a4-%ec%86%8c%ea%b0%9c-%ec%98%81%ec%83%81 menu-item-1256">
													<a href="/admin/memberList">회원 관리</a>
													<a href="/admin/storeList">점포 관리</a>
													<a href="/admin/price">가격 관리</a>
													<a href="/admin/aChat">게시글 관리</a>
													<a href="/admin/stat">통계 관리</a>
													<a href="/admin/assets">정산 관리</a>
													<a href="/admin/account">자산 관리</a>	
													<a href="/auth/logout">로그아웃</a>
												</li>
											</ul>
										</li>
									</c:when>
									<c:when test="${loginMember.grade eq '1'}">
										<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/support" class="sf-with-ul"><c:out value="${name}"></c:out><span class="sf-sub-indicator"> »</span></a>
											<ul class="sf-dropdown-menu" style="display: none;">
												<li class="menu-%ec%84%9c%eb%b9%84%ec%8a%a4-%ec%86%8c%ea%b0%9c-%ec%98%81%ec%83%81 menu-item-1256">
													<a href="/user/update">회원정보 수정</a>
													<a href="/user/creditCard">등록된 카드 관리</a>
													<a href="/user/bubbleList">버블 관리</a>
													<a href="/stores/cart">장바구니</a>
													<a href="/user/process">세탁 진행 상황</a>
													<a href="/user/review">리뷰 관리</a>
													<a href="/user/cChat">문의글 관리</a>
													<a href="/auth/logout">로그아웃</a>
													<a href="/user/delet">회원탈퇴</a>
												</li>
											</ul>	
										</li>
									</c:when>
									<c:when test="${loginMember.grade eq '2'}">
										<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/support" class="sf-with-ul"><c:out value="${name}"></c:out><span class="sf-sub-indicator"> »</span></a>
											<ul class="sf-dropdown-menu" style="display: none;">
												<li class="menu-%ec%84%9c%eb%b9%84%ec%8a%a4-%ec%86%8c%ea%b0%9c-%ec%98%81%ec%83%81 menu-item-1256">
													<a href="/manager/ownerUpdate">회원정보 수정</a>
													<a href="/manager/add">점포 추가등록</a>
													<a href="/manager/update">점포 수정</a>
													<a href="/manager/delete">점포 삭제</a>
													<a href="/manager/process">세탁 진행 상황</a>
													<a href="/manager/review">리뷰 관리</a>
													<a href="/manager/aChat">문의글 관리</a>
													<a href="/manager/stat">통계 관리</a>
													<a href="/manager/assets">정산 관리</a>
													<a href="/auth/logout">로그아웃</a>
													<a href="/manager/ownerDelete">회원탈퇴</a>
												</li>
											</ul>
										</li>
									</c:when>
									<c:otherwise>
										<li class="menu-%ec%a3%bc%ec%b0%a8-%ea%b3%b5%ec%9c%a0-%ec%95%88%eb%82%b4 sf-dropdown menu-item-1163"><a href="/auth/login" class="sf-with-ul">로그인<span class="sf-sub-indicator"> »</span></a>
											<ul class="sf-dropdown-menu" style="display: none;">
											</ul>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>           
						</nav>
					</div>
				</div>
			</div>
		</header>