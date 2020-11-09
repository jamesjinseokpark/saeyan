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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" /> -->
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<!-- Global site tag (gtag.js) - AdWords: 872802322 -->
<link rel="stylesheet" type="text/css" href="/resources/css/usePage.css">
<link rel="stylesheet" href="/resources/css/saeyan.css" type="text/css">

<script async src="https://www.googletagmanager.com/gtag/js?id=AW-872802322"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-872802322');
</script>
<title>새 얀</title>

<!-- head -->
<link rel="stylesheet" type="text/css" href="/resources/css/usePage.css">

<link rel="stylesheet"
	href="https://static.laundrygo.com/homepage/1.1.2/_next/static/css/styles.01714919.chunk.css"
	data-n-g="">
<link href="https://fonts.googleapis.com/css?family=Caudex%7CLato%3A400%2C700%7CNoto+Sans%3A700%2C400&amp;subset=latin&amp;ver=1589409769" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/plugins/jetpack/css/jetpack.css?ver=7.1.1" rel="stylesheet">
<link href="https://www.moduparking.com/wp-includes/css/dist/block-library/style.min.css?ver=5.1.1" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/plugins/appbanners/lib/smartbanner/jquery.smartbanner.min.css?ver=5.1.1" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/themes/virtue/assets/css/skins/default.css" rel="stylesheet">
<link href="https://www.moduparking.com/wp-content/plugins/jetpack/css/jetpack.css?ver=7.1.1" rel="stylesheet">
<script type="text/javascript" src="https://www.moduparking.com/wp-includes/js/jquery/jquery.js?ver=1.12.4"></script>
<script type="text/javascript" src="https://www.moduparking.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1"></script>
<link rel="https://api.w.org/" href="https://www.moduparking.com/wp-json/">
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://www.moduparking.com/xmlrpc.php?rsd">
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://www.moduparking.com/wp-includes/wlwmanifest.xml"> 
<link rel="shortlink" href="https://wp.me/9UVxG">
<style type="text/css">img#wpstats{display:none}</style><style type="text/css">#logo{padding-top:17px}#logo{padding-bottom:20px}#logo{margin-left:0}#logo{margin-right:0}#nav-main{margin-top:13px}#nav-main{margin-bottom:5px}.headerfont,.tp-caption{font-family:Lato}.topbarmenu ul li{font-family:Noto\ Sans}.home-message:hover{background-color:#09f;background-color:rgba(0,153,255,.6)}nav.woocommerce-pagination ul li a:hover,.wp-pagenavi a:hover,.panel-heading .accordion-toggle,.variations .kad_radio_variations label:hover,.variations .kad_radio_variations label.selectedValue{border-color:#09f}a,#nav-main ul.sf-menu ul li a:hover,.product_price ins .amount,.price ins .amount,.color_primary,.primary-color,#logo a.brand,#nav-main ul.sf-menu a:hover,.woocommerce-message:before,.woocommerce-info:before,#nav-second ul.sf-menu a:hover,.footerclass a:hover,.posttags a:hover,.subhead a:hover,.nav-trigger-case:hover .kad-menu-name,.nav-trigger-case:hover .kad-navbtn,#kadbreadcrumbs a:hover,#wp-calendar a,.star-rating{color:#09f}.widget_price_filter .ui-slider .ui-slider-handle,.product_item .kad_add_to_cart:hover,.product_item:hover a.button:hover,.product_item:hover .kad_add_to_cart:hover,.kad-btn-primary,html .woocommerce-page .widget_layered_nav ul.yith-wcan-label li a:hover,html .woocommerce-page .widget_layered_nav ul.yith-wcan-label li.chosen a,.product-category.grid_item a:hover h5,.woocommerce-message .button,.widget_layered_nav_filters ul li a,.widget_layered_nav ul li.chosen a,.wpcf7 input.wpcf7-submit,.yith-wcan .yith-wcan-reset-navigation,#containerfooter .menu li a:hover,.bg_primary,.portfolionav a:hover,.home-iconmenu a:hover,p.demo_store,.topclass,#commentform .form-submit #submit,.kad-hover-bg-primary:hover,.widget_shopping_cart_content .checkout,.login .form-row .button,.variations .kad_radio_variations label.selectedValue,#payment #place_order,.wpcf7 input.wpcf7-back,.shop_table .actions input[type="submit"].checkout-button,.cart_totals .checkout-button,input[type="submit"].button,.order-actions .button{background:#09f}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{-webkit-appearance:none;margin:0}input[type="number"]{-moz-appearance:textfield}.quantity input::-webkit-outer-spin-button,.quantity input::-webkit-inner-spin-button{display:none}.topclass{background:#09f}.kad-hidepostauthortop,.postauthortop{display:none}@media (-webkit-min-device-pixel-ratio:2),(min-resolution:192dpi){#logo .kad-standard-logo{display:none}#logo .kad-retina-logo{display:block}}.product_item .product_details h5{min-height:40px}[class*="wp-image"]{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border:none}[class*="wp-image"]:hover{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border:none}.light-dropshaddow{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}@media (max-width:767px){.kad-desktop-slider{display:none}}#nav-main .sf-menu>li:hover,#nav-main .sf-menu>li.current-menu-item{border-bottom:2px solid #2d5c88}#nav-main .sf-menu>li.current-menu-item>a{color:#2d5c88}@media (min-width:1200px){img.automobile-next-line{display:inline-block}#info-video{padding:27px}}@media (max-width:640px){.portfolio_item_wrapper{width:100%!important}.portfolio_content{padding:0 10px!important}}.motive-page-row{margin-top:100px}.motive-page-left{text-align:center}.motive-page-left img{vertical-align:middle}.motive-page-right p{font-size:16px}.motive-post{background:#f5f5f5;width:345px;margin:5px;border:0!important;padding:30px!important}.portfolio_item .portfoliolink{opacity:1!important}.portfolio_item{width:100%}.portfolio_item_wrapper{background:#fff;margin-bottom:10px;margin-top:10px;!important;text-align:center;width:300px}.portfolio_content{background:#f5f5f5;padding:0 30px}#portfoliowrapper{text-align:center}.piteminfo p{color:#515151!important}.post_newmark{position:absolute;top:10px;right:10px;background:#d9534f;padding:3px;color:#fff;border-radius:3px}#smartbanner.android{border-top:none;background:-webkit-linear-gradient(top,#f4f4f4 0%,#cdcdcd 100%)}.tac{text-align:center!important}.dib{display:inline-block!important}.w270{width:270px}.vam{vertical-align:middle!important}.mb10{margin-bottom:10px!important}.mb15{margin-bottom:15px!important}#main_down_full_btn{display:none;width:100%;height:100%;position:absolute}.main_down_btn{width:150px;height:50px;display:block;position:absolute;bottom:24px}#android_btn{left:405px;top:363px}#iphone_btn{left:600px;top:363px}@media (max-width:1200px){.main_down_btn{width:120px;height:40px;bottom:22px}#android_btn{left:334px;top:295px}#iphone_btn{left:490px;top:295px}}@media (max-width:992px){.main_down_btn{width:90px;height:30px;bottom:17px}#android_btn{left:257px;top:227px}#iphone_btn{left:377px;top:227px}}@media (max-width:770px){.main_down_btn{display:none}#main_down_full_btn{display:block}}</style>
<style type="text/css" class="options-output">header #logo a.brand,.logofont{font-family:Caudex;line-height:0;font-weight:normal;font-style:normal;font-size:0}.kad_tagline{font-family:Lato;line-height:20px;font-weight:400;font-style:normal;color:#444;font-size:14px}.product_item .product_details h5{font-family:Lato;line-height:20px;font-weight:700;font-style:normal;color:#39f;font-size:16px}h1{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:38px}h2{font-family:Lato;line-height:40px;font-weight:normal;font-style:normal;font-size:32px}h3{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:28px}h4{font-family:Lato;line-height:40px;font-weight:400;font-style:normal;font-size:24px}h5{font-family:Lato;line-height:24px;font-weight:700;font-style:normal;font-size:18px}body{font-family:Verdana,Geneva,sans-serif;font-weight:400;font-style:normal;font-size:14px}#nav-main ul.sf-menu a{font-family:"Noto Sans";line-height:50px;font-weight:700;font-style:normal;color:#09f;font-size:15px}#nav-second ul.sf-menu a{font-family:"Noto Sans";line-height:22px;font-weight:400;font-style:normal;font-size:15px}.kad-nav-inner .kad-mnav,.kad-mobile-nav .kad-nav-inner li a,.nav-trigger-case{font-family:"Noto Sans";line-height:20px;font-weight:400;font-style:normal;color:#09f;font-size:16px}</style>
<style
	data-emotion-css="16bg3tf o6u9i2 74fcy9 dgpx7z 6r3cj8 f8ekah 1i47p3m 1r77pb4 v4dd2o uwxpv7 hwub7o 1xnbglt 1y305jj 1l5pei5 s03pgx rq4ghi 9h29rd 7ifmdv n3wicg 2pcxek mmw0y9 1xndws3 bszw9a 1eu41lv z8xk67 135gp4d 9nx3s0">
.css-16bg3tf {
	position: fixed;
	z-index: 3;
	top: 0;
	left: 0;
	width: 100%;
	padding: 4rem 4rem 0;
	box-sizing: border-box;
	font-size: 0;
}

.css-1ue4enk {
	position: absolute;
	width: 16rem;
	height: 0.4rem;
	left: 0rem;
	transition: left 0.3s ease 0s;
	bottom: 0px;
	background-color: rgb(0, 0, 0);
}

.css-16bg3tf.gradation {
	min-height: 12rem;
	width: calc(100% - 10px);
	padding-right: calc(4rem - 10px);
}

.css-16bg3tf:not(.loading) .gradation-bg {
	opacity: 1;
	-webkit-transition: opacity 1s;
	transition: opacity 1s;
}

@media screen and (max-width:750px) {
	.css-16bg3tf {
		left: 0;
		top: 0;
		padding: 8vw 8vw 0;
		width: 100%;
	}
}

.css-o6u9i2 {
	position: relative;
}

.css-o6u9i2 svg {
	width: 22rem;
	height: 5.2rem;
}

.css-74fcy9 {
	float: right;
	margin: 0;
	padding: 0;
	padding-inline-start: 0;
	list-style-type: none;
}

.css-74fcy9:hover li.active:not(:hover) .bottom-border {
	width: 0;
}

@media screen and (max-width:750px) {
	.css-74fcy9 {
		display: none;
	}
}

.css-dgpx7z {
	float: left;
	position: relative;
	display: block;
	width: calc(100vw/ 8 - 4rem);
	max-width: calc(1920px/ 8 - 4rem);
	min-width: 100px;
	padding-bottom: 3px;
	height: 33px;
	margin-right: 4rem;
	box-sizing: border-box;
}

.css-dgpx7z:nth-last-of-type(1) {
	margin-right: 0;
}

.css-dgpx7z .bottom-border {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	background-color: #ffffff;
	height: 4px;
	-webkit-transition: width 0.3s;
	transition: width 0.3s;
}

.css-dgpx7z:hover .bottom-border, .css-dgpx7z.active .bottom-border {
	width: 100%;
}

.css-dgpx7z a {
	display: block;
	font-size: 2rem;
	font-weight: bold;
	color: #ffffff;
	-webkit-text-decoration: none;
	text-decoration: none;
	cursor: pointer;
}

.css-dgpx7z span {
	width: 6px;
	height: 6px;
	background-color: #ec5f5f;
	border-radius: 50%;
	position: absolute;
	top: 6px;
	left: 58px;
}

@media screen and (max-width:750px) {
	.css-6r3cj8 {
		position: absolute;
		right: 0;
		top: 0;
		cursor: pointer;
	}
	.css-6r3cj8 svg {
		width: 5.33333vw;
		height: auto;
	}
	.css-6r3cj8.white svg path {
		fill: #ffffff;
	}
	.css-6r3cj8 svg path {
		fill: #000000;
	}
}

@media ( min-width :751px) {
	.css-6r3cj8 {
		display: none;
	}
}

.css-f8ekah {
	position: fixed;
	top: 50%;
	left: 4rem;
	z-index: 1;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
}

.css-f8ekah a {
	display: block;
	margin-bottom: 16px;
}

.css-f8ekah a:nth-last-of-type(1) {
	margin-bottom: 0px;
}

.css-f8ekah a img {
	display: block;
}

@media screen and (min-width:751px) and (max-height:850px) {
	.css-f8ekah {
		top: auto;
		bottom: 350px;
	}
}

@media screen and (max-width:750px) {
	.css-f8ekah {
		display: none;
	}
}

.css-1i47p3m {
	position: fixed;
	bottom: 40px;
	-webkit-transition: bottom 0.6s;
	transition: bottom 0.6s;
	will-change: bottom;
	left: 4rem;
	z-index: 1;
}

.css-1i47p3m.up {
	bottom: 200px;
}

.css-1i47p3m a {
	display: block;
	margin-bottom: 8px;
}

.css-1i47p3m a:nth-last-of-type(1) {
	margin-bottom: 0;
}

@media screen and (max-width:750px) {
	.css-1i47p3m {
		display: none;
	}
}

.css-1r77pb4 {
	display: block;
	width: 32px;
	height: 32px;
	background-position: center;
	background-size: contain;
}

.css-1r77pb4.youtube {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_youtube_W_%402x.png);
}

.css-1r77pb4.facebook {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_facebook_W_%402x.png);
}

.css-1r77pb4.instagram {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_instagram_W_%402x.png);
}

.css-1r77pb4.kakaotalk {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_kakaotalk_W_%402x.png);
}

.css-v4dd2o {
	position: fixed;
	cursor: pointer;
	z-index: 1;
	bottom: 4rem;
	right: 4rem;
	width: 32px;
	height: 48px;
	box-sizing: border-box;
	border: 2px solid;
	border-radius: 16px;
	border-color: #ffffff;
	-webkit-transition: height 0.6s, bottom 0.6s;
	transition: height 0.6s, bottom 0.6s;
	will-change: bottom, height;
}

.css-v4dd2o .arrow {
	position: absolute;
	left: calc(50% - 1px);
	top: 50%;
	width: 2px;
	height: 16px;
	background-color: #ffffff;
	border-top: 1px solid;
	border-top-color: #c3c3c3;
	box-sizing: border-box;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	-webkit-transition: height 0.6s, bottom 0.6s, -webkit-transform 0.6s;
	-webkit-transition: height 0.6s, bottom 0.6s, transform 0.6s;
	transition: height 0.6s, bottom 0.6s, transform 0.6s;
}

.css-v4dd2o .arrow::after {
	content: '';
	position: absolute;
	bottom: 0;
	width: 10px;
	left: -4px;
	height: 6px;
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAAUUlEQVQImV3OwQmAMAwF0GygIN1/GPHkydI1nOF5aSQ0kMvP45PAhRMbYtmGB29MBPeCG8a89cA+UeKEiQZahhXXGbM56j8r/tEKAwde9IoQH5IKzNduOxsjAAAAAElFTkSuQmCC');
}

.css-v4dd2o.up {
	bottom: 20rem;
	height: 32px;
}

.css-v4dd2o.up .arrow {
	height: 12px;
	-webkit-transform: translateY(-50%) rotate(180deg);
	-ms-transform: translateY(-50%) rotate(180deg);
	transform: translateY(-50%) rotate(180deg);
}

.css-v4dd2o:hover {
	background-color: #ffffff;
}

.css-v4dd2o:hover .arrow {
	background-color: #000000;
	border-top-color: #c3c3c3;
}

.css-v4dd2o:hover .arrow::after {
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAAZ0lEQVQImW3KsQkEMQxFwV+D2jBypMi4/2KEwergXXB48cIGk43GGMw5qSoAJCEJgMyk946ZoTknkogIquqJmUlrDUm4O9p7ExFPPvGk1hqZiQDufDsJ+MevfKdXBFhrYWa4+ysB/AAut5CFtr7jawAAAABJRU5ErkJggg==');
}

.css-v4dd2o.dark {
	border-color: #000000;
}

.css-v4dd2o.dark .arrow {
	background-color: #000000;
	border-top-color: #000000;
}

.css-v4dd2o.dark .arrow::after {
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFHGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE5LTA3LTE0VDA0OjA3OjQxKzA5OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOS0wNy0xNFQwNDowODo0NCswOTowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOS0wNy0xNFQwNDowODo0NCswOTowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3ZGMxOTZjMi0wMmNmLTY1NDgtOTgyMC1jZWI0MWY5ODdkZjEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6N2RjMTk2YzItMDJjZi02NTQ4LTk4MjAtY2ViNDFmOTg3ZGYxIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6N2RjMTk2YzItMDJjZi02NTQ4LTk4MjAtY2ViNDFmOTg3ZGYxIj4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo3ZGMxOTZjMi0wMmNmLTY1NDgtOTgyMC1jZWI0MWY5ODdkZjEiIHN0RXZ0OndoZW49IjIwMTktMDctMTRUMDQ6MDc6NDErMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz43xFqhAAAASklEQVQI13XOwQmAMAxA0beBgnT/YcRTT5au4Qx6SUCrfsgpLxDYsGLyrmDHIdCJOuCCHrsGc6DEWaIeR0Z8nwf6w58oW+LxNqILDdYZi+9rZrkAAAAASUVORK5CYII=');
}

@media screen and (max-width:750px) {
	.css-v4dd2o {
		display: none;
	}
}

.css-uwxpv7 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-uwxpv7 {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section_m.jpg);
		background-position: center bottom;
	}
	.css-uwxpv7.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-hwub7o {
	width: 100%;
	height: 100%;
	background-color: #000000;
	opacity: 0.5;
	-webkit-transition: opacity 0.6s;
	transition: opacity 0.6s;
	will-change: opacity;
}

.css-1xnbglt {
	position: absolute;
	left: 50%;
	right: auto;
	color: #ffffff;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-size: 0;
}

.css-1xnbglt.section3 {
	color: #000000;
	width: 50%;
	left: 50%;
	right: auto;
	margin: auto;
	min-width: 96rem;
	-webkit-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	padding-bottom: 25rem;
}

.css-1xnbglt.section3 .desc {
	margin-top: 2rem;
}

.css-1xnbglt.small div {
	line-height: 1.46;
	margin-bottom: 2rem;
}

.css-1xnbglt.small div>* {
	font-size: 3rem;
}

.css-1xnbglt div .text.small {
	font-size: 2.4rem;
	line-height: 1.5;
}

.css-1xnbglt.black {
	color: #000000;
}

.css-1xnbglt.left {
	left: 12.5%;
}

.css-1xnbglt div {
	line-height: 1.28;
}

.css-1xnbglt div>* {
	font-size: 0;
}

.css-1xnbglt div .text {
	font-size: 5.6rem;
}

.css-1xnbglt div .text.regular {
	font-size: 3rem;
	line-height: 1.46;
}

.css-1xnbglt div .text.regular.sub_text {
	font-size: 5.6rem;
}

.css-1xnbglt div .text.regular.sub_description {
	margin-bottom: 3rem;
	font-size: 2.4rem;
	line-height: 1.333;
}

.css-1xnbglt div .text.regular.sub_description:last-child {
	margin-bottom: 0;
}

.css-1xnbglt div.sub-text {
	margin-top: 0.6rem;
}

.css-1xnbglt div.link {
	margin-top: 4rem;
}

.css-1xnbglt div.link>* {
	font-size: 0;
}

.css-1xnbglt div:nth-last-of-type(1) {
	margin-bottom: 0;
}

.css-1xnbglt .text-fade {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.css-1xnbglt .text-fade>span {
	display: inline-block;
}

.css-1xnbglt .text-fade>div, .css-1xnbglt .text-fade>img, .css-1xnbglt .text-fade>span
	{
	will-change: opacity;
	-webkit-transition-property: opacity;
	transition-property: opacity;
	opacity: 0;
	-webkit-transition-duration: 0.8s;
	transition-duration: 0.8s;
}

@
-webkit-keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@
keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@media screen and (max-width:750px) {
	.css-1xnbglt {
		left: 8vw;
	}
	.css-1xnbglt div .text {
		font-size: 8.26667vw;
	}
	.css-1xnbglt.m_text-lines {
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
	}
	.css-1xnbglt div .text.m_text, .css-1xnbglt div .text.regular.sub_text.m_text
		{
		font-size: 7.33333vw;
		white-space: nowrap;
	}
	.css-1xnbglt div .text.regular.sub_regular {
		font-size: 8.26667vw;
		line-height: 1.29;
	}
	.css-1xnbglt .mobile-only span .text.regular.sub_description {
		font-size: 4vw;
		margin-top: 2.66667vw;
	}
	.css-1xnbglt div .text.small {
		font-size: 3.73333vw;
		line-height: 1.42;
	}
	.css-1xnbglt.section3 {
		left: 8vw;
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
		top: 25%;
	}
}

.css-1y305jj {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section2.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-1y305jj {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section2_m.jpg);
		background-position: center bottom;
	}
	.css-1y305jj.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-1l5pei5 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section3.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-1l5pei5 {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section3_m.jpg);
		background-position: center bottom;
	}
	.css-1l5pei5.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-s03pgx {
	position: absolute;
	left: 12.5%;
	right: auto;
	color: #ffffff;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-size: 0;
}

.css-s03pgx.section3 {
	color: #000000;
	width: 50%;
	left: 50%;
	right: auto;
	margin: auto;
	min-width: 96rem;
	-webkit-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	padding-bottom: 25rem;
}

.css-s03pgx.section3 .desc {
	margin-top: 2rem;
}

.css-s03pgx.small div {
	line-height: 1.46;
	margin-bottom: 2rem;
}

.css-s03pgx.small div>* {
	font-size: 3rem;
}

.css-s03pgx div .text.small {
	font-size: 2.4rem;
	line-height: 1.5;
}

.css-s03pgx.black {
	color: #000000;
}

.css-s03pgx.left {
	left: 12.5%;
}

.css-s03pgx div {
	line-height: 1.28;
}

.css-s03pgx div>* {
	font-size: 0;
}

.css-s03pgx div .text {
	font-size: 5.6rem;
}

.css-s03pgx div .text.regular {
	font-size: 3rem;
	line-height: 1.46;
}

.css-s03pgx div .text.regular.sub_text {
	font-size: 5.6rem;
}

.css-s03pgx div .text.regular.sub_description {
	margin-bottom: 3rem;
	font-size: 2.4rem;
	line-height: 1.333;
}

.css-s03pgx div .text.regular.sub_description:last-child {
	margin-bottom: 0;
}

.css-s03pgx div.sub-text {
	margin-top: 0.6rem;
}

.css-s03pgx div.link {
	margin-top: 4rem;
}

.css-s03pgx div.link>* {
	font-size: 0;
}

.css-s03pgx div:nth-last-of-type(1) {
	margin-bottom: 0;
}

.css-s03pgx .text-fade {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.css-s03pgx .text-fade>span {
	display: inline-block;
}

.css-s03pgx .text-fade>div, .css-s03pgx .text-fade>img, .css-s03pgx .text-fade>span
	{
	will-change: opacity;
	-webkit-transition-property: opacity;
	transition-property: opacity;
	opacity: 0;
	-webkit-transition-duration: 0.8s;
	transition-duration: 0.8s;
}

@
-webkit-keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@
keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@media screen and (max-width:750px) {
	.css-s03pgx {
		left: 8vw;
	}
	.css-s03pgx div .text {
		font-size: 8.26667vw;
	}
	.css-s03pgx.m_text-lines {
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
	}
	.css-s03pgx div .text.m_text, .css-s03pgx div .text.regular.sub_text.m_text
		{
		font-size: 7.33333vw;
		white-space: nowrap;
	}
	.css-s03pgx div .text.regular.sub_regular {
		font-size: 8.26667vw;
		line-height: 1.29;
	}
	.css-s03pgx .mobile-only span .text.regular.sub_description {
		font-size: 4vw;
		margin-top: 2.66667vw;
	}
	.css-s03pgx div .text.small {
		font-size: 3.73333vw;
		line-height: 1.42;
	}
	.css-s03pgx.section3 {
		left: 8vw;
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
		top: 25%;
	}
}

.css-rq4ghi {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section4.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-rq4ghi {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section4_m.jpg);
		background-position: center bottom;
	}
	.css-rq4ghi.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-9h29rd {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section5.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-9h29rd {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section5_m.jpg);
		background-position: center bottom;
	}
	.css-9h29rd.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-7ifmdv {
	background-image:
		url(https://static.laundrygo.com/images/homepage/main/main_background_section6.jpg);
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-7ifmdv {
		background-image:
			url(https://static.laundrygo.com/images/homepage/main/main_background_section6_m.jpg);
		background-position: center bottom;
	}
	.css-7ifmdv.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-n3wicg {
	position: absolute;
	left: auto;
	right: calc(12.5% - 50px);
	color: #ffffff;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-size: 0;
}

.css-n3wicg.section3 {
	color: #000000;
	width: 50%;
	left: 50%;
	right: auto;
	margin: auto;
	min-width: 96rem;
	-webkit-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	padding-bottom: 25rem;
}

.css-n3wicg.section3 .desc {
	margin-top: 2rem;
}

.css-n3wicg.small div {
	line-height: 1.46;
	margin-bottom: 2rem;
}

.css-n3wicg.small div>* {
	font-size: 3rem;
}

.css-n3wicg div .text.small {
	font-size: 2.4rem;
	line-height: 1.5;
}

.css-n3wicg.black {
	color: #000000;
}

.css-n3wicg.left {
	left: 12.5%;
}

.css-n3wicg div {
	line-height: 1.28;
}

.css-n3wicg div>* {
	font-size: 0;
}

.css-n3wicg div .text {
	font-size: 5.6rem;
}

.css-n3wicg div .text.regular {
	font-size: 3rem;
	line-height: 1.46;
}

.css-n3wicg div .text.regular.sub_text {
	font-size: 5.6rem;
}

.css-n3wicg div .text.regular.sub_description {
	margin-bottom: 3rem;
	font-size: 2.4rem;
	line-height: 1.333;
}

.css-n3wicg div .text.regular.sub_description:last-child {
	margin-bottom: 0;
}

.css-n3wicg div.sub-text {
	margin-top: 0.6rem;
}

.css-n3wicg div.link {
	margin-top: 4rem;
}

.css-n3wicg div.link>* {
	font-size: 0;
}

.css-n3wicg div:nth-last-of-type(1) {
	margin-bottom: 0;
}

.css-n3wicg .text-fade {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.css-n3wicg .text-fade>span {
	display: inline-block;
}

.css-n3wicg .text-fade>div, .css-n3wicg .text-fade>img, .css-n3wicg .text-fade>span
	{
	will-change: opacity;
	-webkit-transition-property: opacity;
	transition-property: opacity;
	opacity: 0;
	-webkit-transition-duration: 0.8s;
	transition-duration: 0.8s;
}

@
-webkit-keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@
keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100








%
{
opacity








:








0






.5






;
}
}
@media screen and (max-width:750px) {
	.css-n3wicg {
		left: 8vw;
	}
	.css-n3wicg div .text {
		font-size: 8.26667vw;
	}
	.css-n3wicg.m_text-lines {
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
	}
	.css-n3wicg div .text.m_text, .css-n3wicg div .text.regular.sub_text.m_text
		{
		font-size: 7.33333vw;
		white-space: nowrap;
	}
	.css-n3wicg div .text.regular.sub_regular {
		font-size: 8.26667vw;
		line-height: 1.29;
	}
	.css-n3wicg .mobile-only span .text.regular.sub_description {
		font-size: 4vw;
		margin-top: 2.66667vw;
	}
	.css-n3wicg div .text.small {
		font-size: 3.73333vw;
		line-height: 1.42;
	}
	.css-n3wicg.section3 {
		left: 8vw;
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
		top: 25%;
	}
}

.css-2pcxek {
	margin-top: 52px;
	text-align: right;
}

.css-mmw0y9 {
	font-size: 1.8rem !important;
	margin-right: 20px !important;
	color: #ffffff;
	border-color: #ffffff;
	margin-right: 20px;
}

.css-mmw0y9.go-btn {
	padding-right: 5rem;
}

.css-mmw0y9.go-btn::after {
	position: absolute;
	top: 50%;
	right: 1rem;
	width: 3.2rem;
	height: 3.2rem;
	display: block;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/go.png);
	background-size: contain;
}

.css-mmw0y9.appstore-btn {
	padding-left: 4.8rem;
}

.css-mmw0y9.appstore-btn::after {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 2.2rem;
	width: 1.9rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_white.svg);
	background-size: contain;
}

.css-mmw0y9.appstore-btn:hover::after {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_black.svg);
}

.css-mmw0y9.playstore-btn {
	margin-right: 0 !important;
	padding-left: 5.1rem;
}

.css-mmw0y9.playstore-btn::after {
	position: absolute;
	top: 1.6rem;
	left: 2.2rem;
	width: 2.2rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_playstore.png);
	background-size: contain;
}

@media ( min-width :751px) {
	.css-mmw0y9:hover {
		color: #000000;
		background-color: #ffffff;
	}
}

@media screen and (max-width:750px) {
	.css-mmw0y9.go-btn {
		padding-right: 12vw;
		margin-right: 0 !important;
		font-size: 3.73333vw !important;
		border-width: 0.26667vw;
		padding: 3.33333vw 12vw 3.6vw 5.33333vw;
		border-radius: 5.66667vw;
	}
	.css-mmw0y9.go-btn::after {
		right: 2.53333vw;
		width: 6.93333vw;
		height: 6.93333vw;
	}
}

.css-1xndws3 {
	margin-top: 4rem !important;
}

.css-bszw9a {
	font-size: 1.8rem !important;
	margin-right: 20px !important;
	color: #000000;
	border-color: #000000;
	margin-right: 20px;
}

.css-bszw9a.go-btn {
	padding-right: 5rem;
}

.css-bszw9a.go-btn::after {
	position: absolute;
	top: 50%;
	right: 1rem;
	width: 3.2rem;
	height: 3.2rem;
	display: block;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/go.png);
	background-size: contain;
}

.css-bszw9a.appstore-btn {
	padding-left: 4.8rem;
}

.css-bszw9a.appstore-btn::after {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 2.2rem;
	width: 1.9rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_black.svg);
	background-size: contain;
}

.css-bszw9a.appstore-btn:hover::after {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_white.svg);
}

.css-bszw9a.playstore-btn {
	margin-right: 0 !important;
	padding-left: 5.1rem;
}

.css-bszw9a.playstore-btn::after {
	position: absolute;
	top: 1.6rem;
	left: 2.2rem;
	width: 2.2rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_playstore.png);
	background-size: contain;
}

@media ( min-width :751px) {
	.css-bszw9a:hover {
		color: #ffffff;
		background-color: #000000;
	}
}

@media screen and (max-width:750px) {
	.css-bszw9a.go-btn {
		padding-right: 12vw;
		margin-right: 0 !important;
		font-size: 3.73333vw !important;
		border-width: 0.26667vw;
		padding: 3.33333vw 12vw 3.6vw 5.33333vw;
		border-radius: 5.66667vw;
	}
	.css-bszw9a.go-btn::after {
		right: 2.53333vw;
		width: 6.93333vw;
		height: 6.93333vw;
	}
}

.css-1eu41lv {
	position: absolute;
	bottom: 0;
	height: 160px;
	padding: 40px;
	box-sizing: border-box;
	background-color: rgba(0, 0, 0, 0.2);
	width: 100vw;
	color: #ffffff;
}

.css-1eu41lv>div.col-1-width {
	min-width: 24rem;
}

.css-1eu41lv>div.col-2-width {
	min-width: 40rem;
}

.css-1eu41lv>div {
	float: left;
	display: block;
	font-size: 1.4rem;
	line-height: 20px;
}

.css-1eu41lv svg.logo {
	width: 78px;
	height: 78px;
	fill: #ffffff;
}

.css-1eu41lv>div h1 {
	display: block;
	font-size: 2rem;
	font-weight: normal;
	margin: 0 0 12px;
}

.css-1eu41lv p {
	position: absolute;
	right: 4rem;
	bottom: 3.5rem;
	margin: 0;
	font-size: 1.6rem;
}

.css-1eu41lv.dark {
	background-color: #252525;
	color: #999999;
}

.css-1eu41lv.dark svg.logo {
	fill: #636363;
}

.css-1eu41lv.dark a {
	color: #999999;
}

.css-1eu41lv.dark>p.corp {
	color: #666666;
}

.css-z8xk67 {
	cursor: pointer;
	position: absolute;
	-webkit-transition: opacity 0.3s, visibility 0s;
	transition: opacity 0.3s, visibility 0s;
	right: 5.33333vw;
	bottom: 21.33333vw;
	width: 8.53333vw;
	height: 8.53333vw;
}

.css-z8xk67 svg path {
	fill: #000000;
}

.css-z8xk67.white svg path {
	fill: #ffffff;
}

.css-135gp4d {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #b7b7b7;
	opacity: 1;
	z-index: 2;
}

.css-135gp4d.hide {
	-webkit-animation: loading-dim-fadeout 0.8s linear forwards;
	animation: loading-dim-fadeout 0.8s linear forwards;
}

@
-webkit-keyframes loading-dim-fadeout { 0%{
	display: block;
	opacity: 1;
}

80








%
{
display








:








block






;
opacity








:








0






;
}
100








%
{
opacity








:








0






;
z-index








:








-1






;
}
}
@
keyframes loading-dim-fadeout { 0%{
	display: block;
	opacity: 1;
}

80








%
{
display








:








block






;
opacity








:








0






;
}
100








%
{
opacity








:








0






;
z-index








:








-1






;
}
}
@media screen and (max-width:750px) {
	.css-9nx3s0 {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		background-color: #212121;
		font-size: 4.8vw;
		color: #d1fe5c;
		text-align: center;
		line-height: 16vw;
		font-weight: bold;
		-webkit-text-decoration: none;
		text-decoration: none;
	}
}

@media ( min-width :751px) {
	.css-9nx3s0 {
		display: none;
	}
}
</style>
<style data-emotion="css">
.css-1qshxy8 .text {
	font-size: 5.6rem;
}

.text-slide span {
	display: inline-block;
}

.css-1qshxy8 {
	position: relative;
	left: auto;
	right: auto;
	top: auto;
	transform: none;
	width: auto;
	color: rgb(0, 0, 0);
}

.css-17tfiu5>span.active {
	font-weight: bold;
}

.css-17tfiu5>span {
	cursor: pointer;
	padding-top: 2.2rem;
	display: inline-block;
	padding-bottom: 2.2rem;
	width: 16rem;
	font-size: 1.6rem;
	line-height: 1;
	text-align: center;
}

.css-17tfiu5 {
	position: relative;
	overflow: hidden;
	font-size: 0px;
}

.css-1njn69r {
	position: relative;
	width: 96rem;
	text-align: center;
	margin: 18.8rem auto;
	background: white;
}

.jumboslider-item {
	position: relative;
	font-size: 20px;
	text-align: left;
	width: 100%;
	height: 100%;
	display: inline-block;
	vertical-align: top;
	background-size: auto 7.1rem;
	background-repeat: no-repeat;
	background-position: left top;
}

.jumboslider-item>h1 span.step {
	display: inline-block;
	font-size: 6.4rem;
	font-family: "Times New Roman", Times, serif;
	color: rgb(183, 183, 183);
	font-style: italic;
	font-weight: normal;
	margin-right: 0.8rem;
}

.jumboslider-item>h1 span {
	display: inline-block;
}

.jumboslider-item>h1 {
	font-size: 2rem;
	line-height: 1.3;
	margin: 0px;
}

.flexslider kt-flexslider {
	position: relative;
	left: 0%;
	height: 100%;
	white-space: nowrap;
	font-size: 0px;
	transition: left 0.3s ease-out 0s;
	will-change: left;
}

.jumboslider-item .phone {
	position: absolute;
	right: 1.5rem;
	bottom: 0px;
	width: 29.1rem;
	height: 55.5rem;
	background-image: url(/resources/images/phone.png);
	background-size: cover;
}

.css-1xtd7ov {
	transform: scale(1.3);
	transform-origin: center center;
	position: absolute;
	top: 40rem;
	width: 5rem;
	height: 10rem;
	background-size: 2.8rem 2.8rem;
	background-position: center center;
	background-repeat: no-repeat;
	cursor: pointer;
}

.css-1xtd7ov.left {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_arrow_left.svg);
	right: 100%;
}
</style>
<style type="text/css" id="fp-parallax-stylesheet">
.fp-bg {
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

.fp-section, .fp-slide, .fp-section.fp-table, .fp-slide.fp-table,
	.fp-section .fp-tableCell, .fp-slide .fp-tableCell {
	position: relative;
	overflow: hidden;
}
</style>
<style type="text/css" id="fp-parallax-transitions">
.fp-bg {
	transition: transform 700ms ease;
}

.fp-slide, .fp-section {
	transition: background-position 700ms ease;
}
</style>
<style type="text/css" id="fp-parallax-transition-class">
.fp-bg-animate {
	transition: all 700ms ease
}
</style>
<style
	data-emotion-css="16bg3tf o6u9i2 74fcy9 6r3cj8 f8ekah 1i47p3m v4dd2o hwub7o 1eu41lv z8xk67 135gp4d 9nx3s0 1x2bk7d zxxa32 14l8f39 akhs91 1p247do r9ws3z 1njn69r 1xtd7ov 1qshxy8 13r13t5 17tfiu5 1ue4enk 1rw6dgr 1phspbf 3ikub4 1d130ua 11o8ahh 1w3i3ov 1wsc1ux">
.css-16bg3tf {
	position: fixed;
	z-index: 3;
	top: 0;
	left: 0;
	width: 100%;
	padding: 4rem 4rem 0;
	box-sizing: border-box;
	font-size: 0;
}

.css-16bg3tf.gradation {
	min-height: 12rem;
	width: calc(100% - 10px);
	padding-right: calc(4rem - 10px);
}

.css-16bg3tf:not(.loading) .gradation-bg {
	opacity: 1;
	-webkit-transition: opacity 1s;
	transition: opacity 1s;
}

@media screen and (max-width:750px) {
	.css-16bg3tf {
		left: 0;
		top: 0;
		padding: 8vw 8vw 0;
		width: 100%;
	}
}

.css-o6u9i2 {
	position: relative;
}

.css-o6u9i2 svg {
	width: 22rem;
	height: 5.2rem;
}

.css-74fcy9 {
	float: right;
	margin: 0;
	padding: 0;
	padding-inline-start: 0;
	list-style-type: none;
}

.css-74fcy9:hover li.active:not(:hover) .bottom-border {
	width: 0;
}

@media screen and (max-width:750px) {
	.css-74fcy9 {
		display: none;
	}
}

@media screen and (max-width:750px) {
	.css-6r3cj8 {
		position: absolute;
		right: 0;
		top: 0;
		cursor: pointer;
	}
	.css-6r3cj8 svg {
		width: 5.33333vw;
		height: auto;
	}
	.css-6r3cj8.white svg path {
		fill: #ffffff;
	}
	.css-6r3cj8 svg path {
		fill: #000000;
	}
}

@media ( min-width :751px) {
	.css-6r3cj8 {
		display: none;
	}
}

.css-f8ekah {
	position: fixed;
	top: 50%;
	left: 4rem;
	z-index: 1;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
}

.css-f8ekah a {
	display: block;
	margin-bottom: 16px;
}

.css-f8ekah a:nth-last-of-type(1) {
	margin-bottom: 0px;
}

.css-f8ekah a img {
	display: block;
}

@media screen and (min-width:751px) and (max-height:850px) {
	.css-f8ekah {
		top: auto;
		bottom: 350px;
	}
}

@media screen and (max-width:750px) {
	.css-f8ekah {
		display: none;
	}
}

.css-1i47p3m {
	position: fixed;
	bottom: 40px;
	-webkit-transition: bottom 0.6s;
	transition: bottom 0.6s;
	will-change: bottom;
	left: 4rem;
	z-index: 1;
}

.css-1i47p3m.up {
	bottom: 200px;
}

.css-1i47p3m a {
	display: block;
	margin-bottom: 8px;
}

.css-1i47p3m a:nth-last-of-type(1) {
	margin-bottom: 0;
}

@media screen and (max-width:750px) {
	.css-1i47p3m {
		display: none;
	}
}

.css-v4dd2o {
	position: fixed;
	cursor: pointer;
	z-index: 1;
	bottom: 4rem;
	right: 4rem;
	width: 32px;
	height: 48px;
	box-sizing: border-box;
	border: 2px solid;
	border-radius: 16px;
	border-color: #ffffff;
	-webkit-transition: height 0.6s, bottom 0.6s;
	transition: height 0.6s, bottom 0.6s;
	will-change: bottom, height;
}

.css-v4dd2o .arrow {
	position: absolute;
	left: calc(50% - 1px);
	top: 50%;
	width: 2px;
	height: 16px;
	background-color: #ffffff;
	border-top: 1px solid;
	border-top-color: #c3c3c3;
	box-sizing: border-box;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	-webkit-transition: height 0.6s, bottom 0.6s, -webkit-transform 0.6s;
	-webkit-transition: height 0.6s, bottom 0.6s, transform 0.6s;
	transition: height 0.6s, bottom 0.6s, transform 0.6s;
}

.css-v4dd2o .arrow::after {
	content: '';
	position: absolute;
	bottom: 0;
	width: 10px;
	left: -4px;
	height: 6px;
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAAUUlEQVQImV3OwQmAMAwF0GygIN1/GPHkydI1nOF5aSQ0kMvP45PAhRMbYtmGB29MBPeCG8a89cA+UeKEiQZahhXXGbM56j8r/tEKAwde9IoQH5IKzNduOxsjAAAAAElFTkSuQmCC');
}

.css-v4dd2o.up {
	bottom: 20rem;
	height: 32px;
}

.css-v4dd2o.up .arrow {
	height: 12px;
	-webkit-transform: translateY(-50%) rotate(180deg);
	-ms-transform: translateY(-50%) rotate(180deg);
	transform: translateY(-50%) rotate(180deg);
}

.css-v4dd2o:hover {
	background-color: #ffffff;
}

.css-v4dd2o:hover .arrow {
	background-color: #000000;
	border-top-color: #c3c3c3;
}

.css-v4dd2o:hover .arrow::after {
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAAZ0lEQVQImW3KsQkEMQxFwV+D2jBypMi4/2KEwergXXB48cIGk43GGMw5qSoAJCEJgMyk946ZoTknkogIquqJmUlrDUm4O9p7ExFPPvGk1hqZiQDufDsJ+MevfKdXBFhrYWa4+ysB/AAut5CFtr7jawAAAABJRU5ErkJggg==');
}

.css-v4dd2o.dark {
	border-color: #000000;
}

.css-v4dd2o.dark .arrow {
	background-color: #000000;
	border-top-color: #000000;
}

.css-v4dd2o.dark .arrow::after {
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAYAAAD68A/GAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFHGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE5LTA3LTE0VDA0OjA3OjQxKzA5OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOS0wNy0xNFQwNDowODo0NCswOTowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOS0wNy0xNFQwNDowODo0NCswOTowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3ZGMxOTZjMi0wMmNmLTY1NDgtOTgyMC1jZWI0MWY5ODdkZjEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6N2RjMTk2YzItMDJjZi02NTQ4LTk4MjAtY2ViNDFmOTg3ZGYxIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6N2RjMTk2YzItMDJjZi02NTQ4LTk4MjAtY2ViNDFmOTg3ZGYxIj4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo3ZGMxOTZjMi0wMmNmLTY1NDgtOTgyMC1jZWI0MWY5ODdkZjEiIHN0RXZ0OndoZW49IjIwMTktMDctMTRUMDQ6MDc6NDErMDk6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz43xFqhAAAASklEQVQI13XOwQmAMAxA0beBgnT/YcRTT5au4Qx6SUCrfsgpLxDYsGLyrmDHIdCJOuCCHrsGc6DEWaIeR0Z8nwf6w58oW+LxNqILDdYZi+9rZrkAAAAASUVORK5CYII=');
}

@media screen and (max-width:750px) {
	.css-v4dd2o {
		display: none;
	}
}

.css-hwub7o {
	width: 100%;
	height: 100%;
	background-color: #000000;
	opacity: 0.5;
	-webkit-transition: opacity 0.6s;
	transition: opacity 0.6s;
	will-change: opacity;
}

.css-1eu41lv {
	position: absolute;
	bottom: 0;
	height: 160px;
	padding: 40px;
	box-sizing: border-box;
	background-color: rgba(0, 0, 0, 0.2);
	width: 100vw;
	color: #ffffff;
}

.css-1eu41lv>div.col-1-width {
	min-width: 24rem;
}

.css-1eu41lv>div.col-2-width {
	min-width: 40rem;
}

.css-1eu41lv>div {
	float: left;
	display: block;
	font-size: 1.4rem;
	line-height: 20px;
}

.css-1eu41lv svg.logo {
	width: 78px;
	height: 78px;
	fill: #ffffff;
}

.css-1eu41lv>div h1 {
	display: block;
	font-size: 2rem;
	font-weight: normal;
	margin: 0 0 12px;
}

.css-1eu41lv p {
	position: absolute;
	right: 4rem;
	bottom: 3.5rem;
	margin: 0;
	font-size: 1.6rem;
}

.css-1eu41lv.dark {
	background-color: #252525;
	color: #999999;
}

.css-1eu41lv.dark svg.logo {
	fill: #636363;
}

.css-1eu41lv.dark a {
	color: #999999;
}

.css-1eu41lv.dark>p.corp {
	color: #666666;
}

.css-z8xk67 {
	cursor: pointer;
	position: absolute;
	-webkit-transition: opacity 0.3s, visibility 0s;
	transition: opacity 0.3s, visibility 0s;
	right: 5.33333vw;
	bottom: 21.33333vw;
	width: 8.53333vw;
	height: 8.53333vw;
}

.css-z8xk67 svg path {
	fill: #000000;
}

.css-z8xk67.white svg path {
	fill: #ffffff;
}

.css-135gp4d {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #b7b7b7;
	opacity: 1;
	z-index: 2;
}

.css-135gp4d.hide {
	-webkit-animation: loading-dim-fadeout 0.8s linear forwards;
	animation: loading-dim-fadeout 0.8s linear forwards;
}

@
-webkit-keyframes loading-dim-fadeout { 0%{
	display: block;
	opacity: 1;
}

80


%
{
display


:


block
;


opacity


:


0
;


}
100


%
{
opacity


:


0
;


z-index


:


-1
;


}
}
@
keyframes loading-dim-fadeout { 0%{
	display: block;
	opacity: 1;
}

80


%
{
display


:


block
;


opacity


:


0
;


}
100


%
{
opacity


:


0
;


z-index


:


-1
;


}
}
@media screen and (max-width:750px) {
	.css-9nx3s0 {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		background-color: #212121;
		font-size: 4.8vw;
		color: #d1fe5c;
		text-align: center;
		line-height: 16vw;
		font-weight: bold;
		-webkit-text-decoration: none;
		text-decoration: none;
	}
}

@media ( min-width :751px) {
	.css-9nx3s0 {
		display: none;
	}
}

.css-1x2bk7d {
	float: left;
	position: relative;
	display: block;
	width: calc(100vw/ 8 - 4rem);
	max-width: calc(1920px/ 8 - 4rem);
	min-width: 100px;
	padding-bottom: 3px;
	height: 33px;
	margin-right: 4rem;
	box-sizing: border-box;
}

.css-1x2bk7d:nth-last-of-type(1) {
	margin-right: 0;
}

.css-1x2bk7d .bottom-border {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	background-color: #000000;
	height: 4px;
	-webkit-transition: width 0.3s;
	transition: width 0.3s;
}

.css-1x2bk7d:hover .bottom-border, .css-1x2bk7d.active .bottom-border {
	width: 100%;
}

.css-1x2bk7d a {
	display: block;
	font-size: 2rem;
	font-weight: bold;
	color: #000000;
	-webkit-text-decoration: none;
	text-decoration: none;
	cursor: pointer;
}

.css-1x2bk7d span {
	width: 6px;
	height: 6px;
	background-color: #ec5f5f;
	border-radius: 50%;
	position: absolute;
	top: 6px;
	left: 58px;
}

.css-zxxa32 {
	display: block;
	width: 32px;
	height: 32px;
	background-position: center;
	background-size: contain;
}

.css-zxxa32.youtube {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_youtube_%402x.png);
}

.css-zxxa32.facebook {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_facebook_%402x.png);
}

.css-zxxa32.instagram {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_instagram_%402x.png);
}

.css-zxxa32.kakaotalk {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/icon_kakaotalk_%402x.png);
}

.css-14l8f39 {
	position: absolute;
	right: 40px;
	top: 50%;
	-webkit-transform: translateY(-50%) rotate(90deg);
	-ms-transform: translateY(-50%) rotate(90deg);
	transform: translateY(-50%) rotate(90deg);
	-webkit-transform-origin: right center;
	-ms-transform-origin: right center;
	transform-origin: right center;
	z-index: 5;
	font-size: 1.6rem;
	line-height: 72px;
	font-weight: bold;
	color: #ffffff;
	cursor: pointer;
}

.css-14l8f39.black {
	color: #000000;
}

@media screen and (max-width:750px) {
	.css-14l8f39 {
		display: none;
	}
}

.css-akhs91 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/header/GNB_whiteBg.png);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position: center top;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	-webkit-transition: opacity 1s;
	transition: opacity 1s;
	opacity: 0;
}

.css-akhs91.ivory {
	background-image:
		url(https://static.laundrygo.com/images/homepage/header/GNB_IvoryBg.png);
}

.css-1p247do {
	right: auto;
	margin: 12rem auto 6rem;
	width: 96rem;
	-webkit-transform: none;
	-ms-transform: none;
	transform: none;
	left: auto;
	position: relative;
	color: #000000;
	font-size: 0;
}

.css-1p247do div {
	line-height: 1.28;
}

.css-1p247do .text-slide .text {
	font-size: 5.6rem;
}

.css-1p247do .sub-text {
	margin-top: 3.3rem;
}

.css-1p247do div .text.small {
	font-size: 2.4rem;
	line-height: 1.5;
}

.css-1p247do .link {
	margin-top: 4rem;
}

.css-1p247do .phone {
	position: absolute;
	right: 1.55rem;
	top: 0px;
	opacity: 0;
	will-change: opacity, transform;
	-webkit-transition-property: opacity, -webkit-transform;
	-webkit-transition-property: opacity, transform;
	transition-property: opacity, transform;
	-webkit-transition-duration: 2s;
	transition-duration: 2s;
	-webkit-transition-timing-function: cubic-bezier(0.39, 0.85, 0.53, 0.93);
	transition-timing-function: cubic-bezier(0.39, 0.85, 0.53, 0.93);
	width: 39.1rem;
	height: 75.1rem;
	background-image:
		url('https://static.laundrygo.com/images/homepage/use/phone_big.png');
	background-size: cover;
}

.css-1p247do .phone video {
	position: absolute;
	width: 29.2rem;
	top: 11rem;
	left: 4.2rem;
	border-radius: 0.4rem;
	border: solid 1px #cacaca;
	box-shadow: inset 0 0 1rem 0 rgba(0, 0, 0, 0.05);
}

.css-1p247do .video {
	margin-top: 8.4rem;
}

.css-1p247do .video-player {
	width: 48rem;
	height: 27rem;
	margin-bottom: 0;
	position: relative;
	cursor: pointer;
}

.css-1p247do .video-player iframe {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.css-1p247do .video-player img {
	width: 100%;
}

@media screen and (max-width:750px) {
	.css-1p247do {
		width: auto;
		position: relative;
		left: auto;
		top: auto;
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
		margin-top: 20rem;
		text-align: center;
	}
	.css-1p247do .text-slide .text {
		font-size: 8.26667vw;
	}
	.css-1p247do .sub-text {
		margin-top: 4.66667vw;
	}
	.css-1p247do div .text.small {
		font-size: 3.73333vw;
		line-height: 1.42;
	}
	.css-1p247do .phone {
		position: relative;
		margin-top: 6.66667vw;
		margin-left: auto;
		margin-right: auto;
		top: auto;
		-webkit-transform: none !important;
		-ms-transform: none !important;
		transform: none !important;
		left: 1.06667vw;
		background-size: contain;
		width: 52.13333vw;
		height: 100.13333vw;
	}
	.css-1p247do .video {
		margin-top: 6.66667vw;
		margin-bottom: 8vw;
	}
	.css-1p247do .video-player {
		width: 84vw;
		height: 47.25vw;
	}
	.css-1p247do .video .text-slide {
		font-size: 0;
	}
}

.css-r9ws3z {
	color: #000000;
	border-color: #000000;
	margin-right: 20px;
}

.css-r9ws3z.go-btn {
	padding-right: 5rem;
}

.css-r9ws3z.go-btn::after {
	position: absolute;
	top: 50%;
	right: 1rem;
	width: 3.2rem;
	height: 3.2rem;
	display: block;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/go.png);
	background-size: contain;
}

.css-r9ws3z.appstore-btn {
	padding-left: 4.8rem;
}

.css-r9ws3z.appstore-btn::after {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 2.2rem;
	width: 1.9rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_black.svg);
	background-size: contain;
}

.css-r9ws3z.appstore-btn:hover::after {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_apple_white.svg);
}

.css-r9ws3z.playstore-btn {
	margin-right: 0 !important;
	padding-left: 5.1rem;
}

.css-r9ws3z.playstore-btn::after {
	position: absolute;
	top: 1.6rem;
	left: 2.2rem;
	width: 2.2rem;
	height: 2.4rem;
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_playstore.png);
	background-size: contain;
}

@media ( min-width :751px) {
	.css-r9ws3z:hover {
		color: #ffffff;
		background-color: #000000;
	}
}

@media screen and (max-width:750px) {
	.css-r9ws3z.go-btn {
		padding-right: 12vw;
		margin-right: 0 !important;
		font-size: 3.73333vw !important;
		border-width: 0.26667vw;
		padding: 3.33333vw 12vw 3.6vw 5.33333vw;
		border-radius: 5.66667vw;
	}
	.css-r9ws3z.go-btn::after {
		right: 2.53333vw;
		width: 6.93333vw;
		height: 6.93333vw;
	}
}

.css-1njn69r {
	position: relative;
	width: 96rem;
	text-align: center;
	margin: 18.8rem auto;
	background: white;
}

.css-1njn69r::before {
	content: '';
	position: absolute;
	width: 100%;
	left: 0;
	z-index: -1;
	-webkit-transform: scale(0.8);
	-ms-transform: scale(0.8);
	transform: scale(0.8);
	box-shadow: 0px 0px 8rem 6rem rgba(0, 0, 0, 0.03);
	background-color: white;
}

@media screen and (max-width:750px) {
	.css-1njn69r {
		width: auto;
		margin: 26.66667vw auto 25.33333vw;
	}
	.css-1njn69r::before {
		box-shadow: 0px 0px 10.66667vw 8vw rgba(0, 0, 0, 0.03);
	}
}

.css-1xtd7ov {
	-webkit-transform: scale(1.3);
	-ms-transform: scale(1.3);
	transform: scale(1.3);
	-webkit-transform-origin: center;
	-ms-transform-origin: center;
	transform-origin: center;
	position: absolute;
	top: 40rem;
	width: 5rem;
	height: 10rem;
	background-size: 2.8rem 2.8rem;
	background-position: center;
	background-repeat: no-repeat;
	cursor: pointer;
}

.css-1xtd7ov.hide {
	display: none;
}

.css-1xtd7ov.left {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_arrow_left.svg);
	right: 100%;
}

.css-1xtd7ov.left:hover {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_arrow_left_hover.svg);
}

.css-1xtd7ov.right {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_arrow_right.svg);
	left: 100%;
}

.css-1xtd7ov.right:hover {
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_arrow_right_hover.svg);
}

.css-1qshxy8 {
	position: relative;
	left: auto;
	right: auto;
	top: auto;
	-webkit-transform: none;
	-ms-transform: none;
	transform: none;
	width: auto;
	color: #000000;
}

.css-1qshxy8 .text {
	font-size: 5.6rem;
}

@media screen and (max-width:750px) {
	.css-1qshxy8 .text {
		font-size: 8.26667vw;
	}
}

.css-13r13t5 {
	opacity: 0;
	-webkit-transform: translateY(2rem);
	-ms-transform: translateY(2rem);
	transform: translateY(2rem);
	-webkit-transition-property: opacity, -webkit-transform;
	-webkit-transition-property: opacity, transform;
	transition-property: opacity, transform;
	will-change: opacity, transform;
	-webkit-transition-duration: 1s;
	transition-duration: 1s;
	-webkit-transition-timing-function: cubic-bezier(0.39, 0.85, 0.53, 0.93);
	transition-timing-function: cubic-bezier(0.39, 0.85, 0.53, 0.93);
	margin-top: 5.3rem;
}

@media screen and (max-width:750px) {
	.css-13r13t5 {
		margin-top: 5.33333vw;
		margin-bottom: 21.33333vw;
		white-space: nowrap;
	}
}

.css-17tfiu5 {
	position: relative;
	overflow-x: hidden;
	overflow-y: hidden;
	font-size: 0;
}

.css-17tfiu5>span {
	cursor: pointer;
	padding-top: 2.2rem;
	display: inline-block;
	padding-bottom: 2.2rem;
	width: 16rem;
	font-size: 1.6rem;
	line-height: 1;
	text-align: center;
}

.css-17tfiu5>span.active {
	font-weight: bold;
}

.css-17tfiu5>span>.num {
	font-family: 'Times New Roman', Times, serif;
	font-style: italic;
}

.css-17tfiu5 hr {
	position: absolute;
	width: 100%;
	left: 0;
	height: 1px;
	bottom: calc(0.4rem - 1px);
	background-color: #b7b7b7;
	border: none;
	margin: 0;
	padding: 0;
}

@media screen and (max-width:750px) {
	.css-17tfiu5 {
		overflow-x: auto;
		width: 100vw;
	}
	.css-17tfiu5>span {
		font-size: 3.2vw;
		text-align: left;
		width: 28vw;
		padding: 3.6vw 0;
		box-sizing: border-box;
	}
	.css-17tfiu5>span.menu-item:nth-child(1) {
		margin-left: 8vw;
	}
	.css-17tfiu5 hr {
		margin-left: 8vw;
		width: 168vw;
		bottom: calc(0.8vw - 1px);
	}
}

.css-1ue4enk {
	position: absolute;
	width: 16rem;
	height: 0.4rem;
	left: 0rem;
	-webkit-transition: left 0.3s;
	transition: left 0.3s;
	bottom: 0;
	background-color: #000000;
}

@media screen and (max-width:750px) {
	.css-1ue4enk {
		left: 0vw;
		margin-left: 8vw;
		width: 28vw;
		height: 0.8vw;
	}
}

.css-1rw6dgr {
	position: absolute;
	width: 100%;
	bottom: -9.6rem;
	height: 55.5rem;
	left: 0;
	overflow-x: hidden;
	overflow-y: hidden;
}

@media screen and (max-width:750px) {
	.css-1rw6dgr {
		margin-left: 0;
		width: 100%;
		bottom: -12.8vw;
		height: 74vw;
		left: 0;
	}
}

.flexslider kt-flexslider {
	position: relative;
	left: 0%;
	height: 100%;
	white-space: nowrap;
	font-size: 0;
	-webkit-transition: left 0.3s;
	transition: left 0.3s;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
	will-change: left;
}

.jumboslider-item {
	position: relative;
	font-size: 20px;
	text-align: left;
	width: 100%;
	height: 100%;
	display: inline-block;
	vertical-align: top;
	background-size: auto 7.1rem;
	background-repeat: no-repeat;
	background-position: left top;
}

.jumboslider-item>h1 {
	font-size: 2rem;
	line-height: 1.3;
	margin: 0;
}

.jumboslider-item>h1 span {
	display: inline-block;
}

.jumboslider-item>h1 span.step {
	display: inline-block;
	font-size: 6.4rem;
	font-family: 'Times New Roman', Times, serif;
	color: #b7b7b7;
	font-style: italic;
	font-weight: normal;
	margin-right: 0.8rem;
}

.css-3ikub4>p {
	margin-top: 2rem;
	font-size: 1.8rem;
	line-height: 1.44;
}

.css-3ikub4>p:nth-of-type(1) {
	margin-top: 2.5rem;
}

.css-3ikub4>p:nth-of-type(2) {
	margin-top: 3rem;
}

.css-3ikub4 .phone {
	position: absolute;
	right: 1.5rem;
	bottom: 0;
	width: 29.1rem;
	height: 55.5rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/phone.png);
	background-size: cover;
}

.css-3ikub4 .video-btn {
	font-size: 1.2rem;
	padding: 1.2rem 2rem 1.2rem 3.3rem;
	border-radius: 1.9rem;
	margin-top: 2rem;
	color: black;
	border-color: black;
	line-height: 1;
}

.css-3ikub4 .video-btn::after {
	position: absolute;
	left: 1.6rem;
	width: 1rem;
	height: 1rem;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	display: block;
	content: '';
	background-image:
		url(https://static.laundrygo.com/images/homepage/icons/ic_triangle_right_black.svg);
	background-size: contain;
}

.css-3ikub4 .screen {
	position: absolute;
	width: 21.8rem;
	height: 39rem;
	background-size: cover;
	border: 1px solid #e3ddd8;
	left: 2.8rem;
	top: 7rem;
}

.css-3ikub4 .screen>* {
	top: 0;
	right: 0;
	position: absolute;
	opacity: 0;
	background-size: contain;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
}

.css-3ikub4 .screen>.bt {
	width: 8.8rem;
	height: 10.4rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/3_1_1.png);
}

.css-3ikub4 .screen>.circle {
	width: 8.8rem;
	height: 8.8rem;
}

.css-3ikub4 .screen.screen1_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/1_1.png);
}

.css-3ikub4 .screen.screen1_2 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/1_2.png);
}

.css-3ikub4 .screen.screen1_3 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/1_3.png);
}

.css-3ikub4 .screen.screen2_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/2_1.png);
}

.css-3ikub4 .screen.screen3_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/3_1.png);
}

.css-3ikub4 .screen.screen3_1>.bt {
	right: -4.3rem;
	top: -7rem;
}

.css-3ikub4 .screen.screen3_1>.cursor {
	right: -2rem;
	top: 6.7rem;
}

.css-3ikub4 .screen.screen3_2 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/3_2.png);
}

.css-3ikub4 .screen.screen3_2>.circle {
	right: -4.3rem;
	top: 7.5rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/3_2_1.png);
}

.css-3ikub4 .screen.screen1_2>.cursor {
	top: 33rem;
	right: -2rem;
}

.css-3ikub4 .screen.screen4_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/4_1.png);
}

.css-3ikub4 .screen.screen4_1>.cursor {
	right: -1.8rem;
	top: 33rem;
}

.css-3ikub4 .screen.screen4_2 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/4_2.png);
}

.css-3ikub4 .screen.screen4_2>.circle {
	right: -3rem;
	top: 2.5rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/4_2_1.png);
}

.css-3ikub4 .screen.screen4_3 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/4_3.png);
}

.css-3ikub4 .screen.screen5_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/5_1.png);
}

.css-3ikub4 .screen.screen6_1 {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/6_1.png);
}

.css-3ikub4 .screen.screen6_2 {
	opacity: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/6_2.png);
}

.css-3ikub4 .screen>.cursor {
	width: 4.9rem;
	height: 5.4rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/touch.png);
}

.css-3ikub4>.scene {
	height: 100%;
	overflow: hidden;
	position: absolute;
	left: 0;
	width: 57.7rem;
}

.css-3ikub4>.scene * {
	background-size: contain;
	background-repeat: no-repeat;
	position: absolute;
	bottom: 0;
}

.css-3ikub4>.scene>.door {
	right: 0;
	bottom: 9.3rem;
	width: 10.9rem;
	height: 21.7rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/door.png);
}

.css-3ikub4>.scene>.door>.locker {
	z-index: 1;
	right: 1rem;
	top: 12.8rem;
	width: 2.9rem;
	bottom: auto;
	height: 2.7rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/safelock.png);
}

.css-3ikub4>.scene>.door>.locker.locked {
	width: 13rem;
	height: 4.2rem;
	right: 1.71rem;
	top: 12.4rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/safelock_locked.png);
}

.css-3ikub4>.scene>.door>.locker.hide {
	opacity: 0;
}

.css-3ikub4>.scene>.road {
	z-index: 1;
	position: absolute;
	width: 39rem;
	height: 14.1rem;
	left: 0;
	bottom: 8.4rem;
}

.css-3ikub4>.scene>.road>.truck {
	position: absolute;
	bottom: 0;
	right: 0%;
	will-change: transform, right, opacity;
	width: 28.7rem;
	height: 14.1rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/truck.png);
}

.css-3ikub4>.scene>.road>.truck.hide {
	opacity: 0;
	right: 100%;
}

.css-3ikub4>.scene>.road>.truck.out {
	opacity: 1;
	width: 28.8rem;
	right: 0;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/truck_out.png);
}

.css-3ikub4>.scene>.road>.truck.out.small {
	right: -50%;
	width: 19.5rem;
	height: 8.4rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/truck_out_small.png);
}

.css-3ikub4>.scene>.road>.truck.out.hide {
	opacity: 0;
}

.css-3ikub4>.scene>.road>.truck.out>.truck-door {
	position: absolute;
	display: block;
	right: -4.5rem;
	top: 0;
	width: 4.6rem;
	height: 9.8rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/truck_door.png);
}

.css-3ikub4>.scene>.factory {
	left: 0;
	bottom: 9.3rem;
	width: 26rem;
	height: 17.9rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/factory.png);
}

.css-3ikub4>.scene>.balloon {
	left: 23.5rem;
	bottom: 22rem;
	width: 25.6rem;
	height: 8.9rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/balloon.png);
}

.css-3ikub4>.scene>.balloon.hide {
	opacity: 0;
}

.css-3ikub4>.scene>.laundlet {
	right: 5.5rem;
	bottom: 7.9rem;
	width: 10.1rem;
	height: 19.1rem;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/laundlet.png);
}

.css-3ikub4>.scene>.laundlet.complete {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/laundlet_open_complete.png);
}

.css-3ikub4>.scene>.laundlet.open {
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/laundlet_open.png);
}

.css-3ikub4>.scene>.laundlet.hide {
	opacity: 0;
}

@media screen and (max-width:750px) {
	.css-3ikub4 {
		font-size: 0;
	}
	.css-3ikub4 .phone {
		right: 2.66667vw;
		width: 38.8vw;
		height: 74vw;
	}
	.css-3ikub4 .screen {
		width: 29.06667vw;
		height: 52vw;
		border: 1px solid #e3ddd8;
		left: 3.73333vw;
		top: 9.33333vw;
	}
	.css-3ikub4 .screen>.cursor {
		top: 44vw;
		right: -2.66667vw;
	}
	.css-3ikub4>h1 {
		font-size: 4vw;
	}
	.css-3ikub4>p {
		font-size: 3.2vw;
		margin-top: 4vw;
	}
	.css-3ikub4>p:nth-of-type(1) {
		margin-top: 3.33333vw;
	}
	.css-3ikub4>p:nth-of-type(2) {
		margin-top: 4vw;
	}
	.css-3ikub4 .video-btn {
		font-size: 2.4vw;
		border-width: 0.26667vw;
		padding: 2.26667vw 3.6vw 2.26667vw 6.66667vw;
		margin-top: 3.33333vw;
		border-radius: 3.73333vw;
	}
}

.sliderclass kad-desktop-slider {
	margin-top: 6rem;
	width: 100%;
	height: 41.5rem;
	overflow-x: hidden;
}

@media screen and (max-width:750px) {
	.sliderclass kad-desktop-slider {
		margin-left: 8vw;
		width: calc(100% - 8vw);
		margin-top: 12vw;
		height: 106.66667vw;
	}
}

.css-11o8ahh {
	background-image: url();
	background-size: cover;
	background-position: center 80%;
	top: 0;
	bottom: 0;
	width: 100%;
	position: absolute;
	z-index: -1;
}

@media screen and (max-width:750px) {
	.css-11o8ahh {
		background-image: url();
		background-position: center bottom;
	}
	.css-11o8ahh.mobile-align-top {
		background-position-y: top !important;
	}
}

.css-1w3i3ov {
	top: 0;
	left: 0;
	position: absolute;
	width: 100%;
	height: calc(100% - 16rem);
	background-position-y: 0%;
	background-image:
		url(https://static.laundrygo.com/images/homepage/use/bg3.jpg);
	background-position: center bottom;
	background-size: cover;
}

@media screen and (max-width:750px) {
	.css-1w3i3ov {
		background-image:
			url(https://static.laundrygo.com/images/homepage/use/bg3_mobile.jpg);
		height: 100%;
		background-size: cover;
		background-position: center 80%;
	}
}

.css-1wsc1ux {
	position: absolute;
	left: 50%;
	right: 50%;
	color: #ffffff;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-size: 0;
}

.css-1wsc1ux.section3 {
	color: #000000;
	width: 50%;
	left: 50%;
	right: auto;
	margin: auto;
	min-width: 96rem;
	-webkit-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	padding-bottom: 25rem;
}

.css-1wsc1ux.section3 .desc {
	margin-top: 2rem;
}

.css-1wsc1ux.small div {
	line-height: 1.46;
	margin-bottom: 2rem;
}

.css-1wsc1ux.small div>* {
	font-size: 3rem;
}

.css-1wsc1ux div .text.small {
	font-size: 2.4rem;
	line-height: 1.5;
}

.css-1wsc1ux.black {
	color: #000000;
}

.css-1wsc1ux.left {
	left: 12.5%;
}

.css-1wsc1ux div {
	line-height: 1.28;
}

.css-1wsc1ux div>* {
	font-size: 0;
}

.css-1wsc1ux div .text {
	font-size: 5.6rem;
}

.css-1wsc1ux div .text.regular {
	font-size: 3rem;
	line-height: 1.46;
}

.css-1wsc1ux div .text.regular.sub_text {
	font-size: 5.6rem;
}

.css-1wsc1ux div .text.regular.sub_description {
	margin-bottom: 3rem;
	font-size: 2.4rem;
	line-height: 1.333;
}

.css-1wsc1ux div .text.regular.sub_description:last-child {
	margin-bottom: 0;
}

.css-1wsc1ux div.sub-text {
	margin-top: 0.6rem;
}

.css-1wsc1ux div.link {
	margin-top: 4rem;
}

.css-1wsc1ux div.link>* {
	font-size: 0;
}

.css-1wsc1ux div:nth-last-of-type(1) {
	margin-bottom: 0;
}

.css-1wsc1ux .text-fade {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.css-1wsc1ux .text-fade>span {
	display: inline-block;
}

.css-1wsc1ux .text-fade>div, .css-1wsc1ux .text-fade>img, .css-1wsc1ux .text-fade>span
	{
	will-change: opacity;
	-webkit-transition-property: opacity;
	transition-property: opacity;
	opacity: 0;
	-webkit-transition-duration: 0.8s;
	transition-duration: 0.8s;
}

@
-webkit-keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100


%
{
opacity


:


0
.5
;


}
}
@
keyframes section-dim-fadeout { 0%{
	opacity: 0;
}

100


%
{
opacity


:


0
.5
;


}
}
@media screen and (max-width:750px) {
	.css-1wsc1ux {
		left: 8vw;
	}
	.css-1wsc1ux div .text {
		font-size: 8.26667vw;
	}
	.css-1wsc1ux.m_text-lines {
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
	}
	.css-1wsc1ux div .text.m_text, .css-1wsc1ux div .text.regular.sub_text.m_text
		{
		font-size: 7.33333vw;
		white-space: nowrap;
	}
	.css-1wsc1ux div .text.regular.sub_regular {
		font-size: 8.26667vw;
		line-height: 1.29;
	}
	.css-1wsc1ux .mobile-only span .text.regular.sub_description {
		font-size: 4vw;
		margin-top: 2.66667vw;
	}
	.css-1wsc1ux div .text.small {
		font-size: 3.73333vw;
		line-height: 1.42;
	}
	.css-1wsc1ux.section3 {
		left: 8vw;
		-webkit-transform: none;
		-ms-transform: none;
		transform: none;
		top: 25%;
	}
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="/kr/css/customer.css"> -->
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
		<h1 class="logo"><a href="/"></a></h1>
	<div id="gnb-wrap">
		<ul id="gnb">
			<li class="gnb1"><a href="#">새 얀</a>
				<div class="subdepth">
					<div class="tit-tx">
						<strong>새얀 서비스</strong>
						새얀의 서비스를 <br>소개합니다.
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
				</div>
			</li>
			<li class="gnb2"><a href="#">세탁소찾기</a>
				<div class="subdepth">
					<div class="tit-tx">
						<strong>세탁소찾기</strong>
						가까운 세탁소를<br>찾아보세요.
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
				</div>
			</li>
			<li class="gnb3"><a href="#">고객지원</a>
				<div class="subdepth">
					<div class="tit-tx">
						<strong>고객지원</strong>
						새얀은 고객만족을 위해<br>항상 노력합니다.
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
				</div>
			</li>
			<li class="gnb3"><a href="#">회원가입</a>
				<div class="subdepth">
					<div class="tit-tx">
						<strong>회원가입</strong>
						세탁을 맡기는 회원뿐만 아니라<br>세탁 서비스를 제공하는 업주님도 <br>모두 새얀의 회원입니다.
					</div>
					<div class="inner">
						<ul>
							<li><a href="/auth/addOwner">업주회원</a></li>
						</ul>
						<ul>
							<li><a href="/auth/addCustomer">일반회원</a></li>
						</ul>
					</div>
				</div>
			</li>
		<c:choose>
		<c:when test="${loginMember.grade eq '0'}">
			<li class="gnb3"><a href="#"><c:out value="${loginMember.name}"></c:out></a>
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
							<li><a href="/admin/account">자산 관리</a>	</li>
							<li><a href="/auth/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</li>
		</c:when>
		<c:when test="${loginMember.grade eq '1'}">
			<li class="gnb3"><a href="#"><c:out value="${loginMember.name}"></c:out></a>
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
							<li><a href="/user/cChat">문의글 관리</a></li>
							<li><a href="/auth/logout">로그아웃</a></li>
							<li><a href="/user/delet">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</li>
		</c:when>
		<c:when test="${loginMember.grade eq '2'}">
			<li class="gnb3"><a href="#"><c:out value="${loginMember.name}"></c:out></a>
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
				</div>
			</li>
		</c:when>
		<c:otherwise><a href="/auth/login">로그인</a></c:otherwise>
		</c:choose>
		</ul>
	</div>	
	<button class="bt-menu"><span>메뉴</span></button>
	</div>
</div>
