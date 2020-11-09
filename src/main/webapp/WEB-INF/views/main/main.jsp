<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta name="viewport" content="width=device-width, initial-scale=0">
<link rel="stylesheet" media="screen"
	href="https://static.codepen.io/assets/fullpage/fullpage-4de243a40619a967c0bf13b95e1ac6f8de89d943b7fc8710de33f681fe287604.css">
<link rel="stylesheet" media="all" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css"  href="/resources/css/mainTotal.css">
<link rel="stylesheet" media="screen"
	href="https://static.codepen.io/assets/packs/css/2-5161443c.chunk.css">
<link rel="stylesheet" media="screen"
	href="https://static.codepen.io/assets/packs/css/everypage-54952196.css">
<link rel="stylesheet" media="all"
	href="https://static.codepen.io/assets/page/page-a92fda1f98706ba066b91ebfe865cfec54db8a6caf4f2adb7e417bbe178ae06a.css">
<link rel="stylesheet" media="all"
	href="https://static.codepen.io/assets/editor/editor-1bbd85ccfd2e85f7493ff5f032c61b75dd0dca424affec1f6cd7822d429f3f37.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700,700italic,900,900italic"
	rel="stylesheet">
<link rel="alternate" type="application/json+oembed"
	href="https://codepen.io/api/oembed?url=https%3A%2F%2Fcodepen.io%2Feehayman%2Fpen%2FqdGZJr&amp;format=json"
	title="Full Page Parallax Scroll Effect">
<link rel="apple-touch-icon" type="image/png"
	href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon"
	href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type=""
	href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111">
<script async=""
	src="https://lux.speedcurve.com/lux/?v=206&amp;id=410041&amp;sid=160369196583371293&amp;uid=160369015615104829&amp;l=CodePen%20-%20Full%20Page%20Parallax%20Scroll%20Effect&amp;NT=1603691965372fs5ds5de5cs5ce5qs17bs222be225ol246oi423os423oe425oc1347ls1347le1347sr457fc742lc1003&amp;LJS=d0t0f0c1n1e4r40x6924l310s458&amp;PS=ns7bs0is2173ss7bc7ic0ia2it2dd6nd119vh937vw1362dh937dw1362ds4366ct4G_er0nt0dm8&amp;CPU=s|0,n|0,d|0,x|0,i|742&amp;HN=codepen.io&amp;CLS=0.003132&amp;UT=LUX_end|1548"></script>
<script>/* Firefox needs this to prevent FOUC. Wow. */</script>

<link rel="apple-touch-icon" type="image/png"
	href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type=""
	href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111">
<link rel="preload" href="https://static.laundrygo.com/homepage/1.1.2/_next/static/css/styles.01714919.chunk.css" as="style">

<title>새얀</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
 
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat);

html, body {
	overflow: hidden;
}

@
mixin transition( $time, $property: all, $easing: ease-in) {
	transition: $property$time$easing;
}

.background {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	overflow: hidden;
	will-change: transform;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	height: 120vh;
	position: fixed;
	width: 100%;
	-webkit-transform: translateY(30vh);
	transform: translateY(30vh);
	-webkit-transition: all 1.2s cubic-bezier(0.22, 0.44, 0, 1);
	transition: all 1.2s cubic-bezier(0.22, 0.44, 0, 1);
}

.background:before {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.1);
}

.background:first-child {
	background-image: url(/resources/images/brand_background_section.jpg);
	-webkit-transform: translateY(-15vh);
	transform: translateY(-15vh);
}

.background:first-child .content-wrapper {
	-webkit-transform: translateY(15vh);
	transform: translateY(15vh);
}

.background:nth-child(2) {
	background-image: url(/resources/images/brand_background_section1.jpg);
}

.background:nth-child(3) {
	background-image: url(/resources/images/brand_background_section2.jpg);
}

/* Set stacking context of slides */
.background:nth-child(1) {
	z-index: 3;
}

.background:nth-child(2) {
	z-index: 2;
}

.background:nth-child(3) {
	z-index: 1;
}

.content-wrapper {
	height: 100vh;
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	text-align: left;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-flow: column nowrap;
	color: #fff;
	font-family: Montserrat;
	text-transform: uppercase;
	-webkit-transform: translateY(40vh);
	transform: translateY(40vh);
	will-change: transform;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transition: all 1.7s cubic-bezier(0.22, 0.44, 0, 1);
	transition: all 1.7s cubic-bezier(0.22, 0.44, 0, 1);
	
	
}

.content-title {
	font-size: 12vh;
	line-height: 1.4;
}

.background.up-scroll {
	-webkit-transform: translate3d(0, -15vh, 0);
	transform: translate3d(0, -15vh, 0);
}

.background.up-scroll .content-wrapper {
	-webkit-transform: translateY(15vh);
	transform: translateY(15vh);
	
}

.background.up-scroll+.background {
	-webkit-transform: translate3d(0, 30vh, 0);
	transform: translate3d(0, 30vh, 0);
}

.background.up-scroll+.background .content-wrapper {
	-webkit-transform: translateY(30vh);
	transform: translateY(30vh);
}

.background.down-scroll {
	-webkit-transform: translate3d(0, -130vh, 0);
	transform: translate3d(0, -130vh, 0);
}

.background.down-scroll .content-wrapper {
	-webkit-transform: translateY(40vh);
	transform: translateY(40vh);
}

.background.down-scroll+.background:not(.down-scroll) {
	-webkit-transform: translate3d(0, -15vh, 0);
	transform: translate3d(0, -15vh, 0);
}

.background.down-scroll+.background:not(.down-scroll) .content-wrapper {
	-webkit-transform: translateY(15vh);
	transform: translateY(15vh);
}

.css-iijbjk.go-btn {
	padding-right: 5rem;
	line-height: 1 !important;
}

.css-iijbjk.black {
	color: rgb(0, 0, 0);
	border-color: rgb(0, 0, 0);
}

.btn, .go-btn, .appstore-btn, .playstore-btn, .video-btn, .fold-btn,
	.unfold-btn {
	cursor: pointer;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 1.8rem;
	line-height: 1;
	border: 2px solid;
	color: #ffffff;
	border-color: #ffffff;
	text-decoration: none;
	padding: 1.8rem 2.2rem 1.8rem 2.2rem;
	border-radius: 2.8rem;
	box-sizing: border-box;
	margin-bottom: 1px;
}

.css-nh7bfr.black {
    color: rgb(0, 0, 0);
}

.css-nh7bfr {
    position: absolute;
    left: 10%;
    right: auto;
    color: rgb(255, 255, 255);
    transform: translateY(-15%);
    
}
.section fp-section active fp-table fp-completely {
    display: block;
    
}
.css-nh7bfr div .text {
    font-size: 5.6rem;
     
}
.text-slide span {
    display: inline-block;
}
.css-nh7bfr.small div > * {
    font-size: 3rem;
}
.css-nh7bfr div > * {
    font-size: 0px;
}
.css-nh7bfr.small div {
    line-height: 1.46;
    margin-bottom: 2rem;
}
.css-nh7bfr div {
    line-height: 1.28;
}
.font-family: 'Noto Sans KR', 'Apple SD Gothic Neo', sans-serif
.css-1xnbglt .text-fade > div, .css-1xnbglt .text-fade > img, .css-1xnbglt .text-fade > span {
    will-change: opacity;
    transition-property: opacity;
    opacity: 0;
    transition-duration: 0.8s;
}

</style>

<script>
  window.console = window.console || function(t) {};
</script>



<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
<%@ include file="../include/headerReal.jsp" %>

	<div class="section fp-section active fp-table fp-completely">
		<section class="background">
	
		
			<div class="content-wrapper">
				<div class="small m_text-lines black css-nh7bfr">
					<span class="form-section">
						<div>
							<span class="text-slide" > <span class="text delay-0" >비대면
									세탁 서비스</span>
							</span>
						</div>
						<div class="sub-text">
							<span class="text-slide"> <span class="text delay-1 small">
									배달원과 약속하는 번거로움도<br> 시간을 방해받는 일도 없는 프라이빗한 일상<br>
							</span>
							</span>
						</div>
						<div class="sub-text">
							<span class="text-slide"> <span class="text delay-1 small">
									스마트 빨래 수거함 새얀에 안전하고<br> 편리하게 맡기세요.
							</span>
							</span>
						</div>
					
					</span>
					<div class="link">
						<span class="text-slide"><span class="text delay-2">
						<button class="go-btn black css-iijbjk" onclick='location.href="/main/use"'>새얀 이용방법</button>
						</span>
						</span>
					</div>
					
				</div>
			
			</div>
		</section>
		<section class="background">
			<div class="content-wrapper">
				<div class="small   css-1xnbglt">
				<span>
			<div>
				
					<span class="text delay-0">합리적인 가격</span>
				
			</div>
			<div>
				<span >
					<div class="text delay-0 small">
						라이프 스타일에 맞게 세탁을 구독하고<br>
						얽매이지 않고 자유롭게 맡기고<br>
						어떤 요금제를 선택하든 알뜰한 일상<br>
					</div>
				</span>
			</div>
			<div>
				<span >
					<div class="text delay-0 small">
						버블 충전시 10%를 더 충전 해 드립니다.
					</div>
				</span>
			</div>
		
		</span>
		<div class="link"><span class="text-slide">
		
		<button class="go-btn black css-iijbjk" onclick='location.href="/main/price"'>세탁 요금제 안내</button>
		
		</span>
		</div>
		</div>
		
			</div>
		</section>
		<section class="background">
			<div class="content-wrapper">
				<p class="content-title">Etiam consequat lectus.</p>
				<p class="content-subtitle">Nullam tristique urna sed tellus
					ornare congue. Etiam vitae erat at nibh aliquam dapibus.</p>
			</div>
			
		</section>
	</div>
	
	<script
		src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

	<script id="rendered-js">
// ------------- VARIABLES ------------- //
var ticking = false;
var isFirefox = /Firefox/i.test(navigator.userAgent);
var isIe = /MSIE/i.test(navigator.userAgent) || /Trident.*rv\:11\./i.test(navigator.userAgent);
var scrollSensitivitySetting = 30; //Increase/decrease this number to change sensitivity to trackpad gestures (up = less sensitive; down = more sensitive) 
var slideDurationSetting = 600; //Amount of time for which slide is "locked"
var currentSlideNumber = 0;
var totalSlideNumber = $(".background").length;

// ------------- DETERMINE DELTA/SCROLL DIRECTION ------------- //
function parallaxScroll(evt) {
  if (isFirefox) {
    //Set delta for Firefox
    delta = evt.detail * -120;
  } else if (isIe) {
    //Set delta for IE
    delta = -evt.deltaY;
  } else {
    //Set delta for all other browsers
    delta = evt.wheelDelta;
  }

  if (ticking != true) {
    if (delta <= -scrollSensitivitySetting) {
      //Down scroll
      ticking = true;
      if (currentSlideNumber !== totalSlideNumber - 1) {
        currentSlideNumber++;
        nextItem();
      }
      slideDurationTimeout(slideDurationSetting);
    }
    if (delta >= scrollSensitivitySetting) {
      //Up scroll
      ticking = true;
      if (currentSlideNumber !== 0) {
        currentSlideNumber--;
      }
      previousItem();
      slideDurationTimeout(slideDurationSetting);
    }
  }
}

// ------------- SET TIMEOUT TO TEMPORARILY "LOCK" SLIDES ------------- //
function slideDurationTimeout(slideDuration) {
  setTimeout(function () {
    ticking = false;
  }, slideDuration);
}

// ------------- ADD EVENT LISTENER ------------- //
var mousewheelEvent = isFirefox ? "DOMMouseScroll" : "wheel";
window.addEventListener(mousewheelEvent, _.throttle(parallaxScroll, 60), false);

// ------------- SLIDE MOTION ------------- //
function nextItem() {
  var $previousSlide = $(".background").eq(currentSlideNumber - 1);
  $previousSlide.removeClass("up-scroll").addClass("down-scroll");
}

function previousItem() {
  var $currentSlide = $(".background").eq(currentSlideNumber);
  $currentSlide.removeClass("down-scroll").addClass("up-scroll");
}
//# sourceURL=pen.js
    </script>
	<script
		src="https://static.codepen.io/assets/common/everypage-a63f0cbd5f67116206c89108a0a1da6978ab1606d953812d875b800cf8fe823e.js"></script>
	<script
		src="https://static.codepen.io/assets/common/analytics_and_notifications-538ab2710674d4676fe331ffda620410176f9ac968498eeba639b3f0d1125ff8.js"></script>
	<script>
		LUX = (function() {
			var a = ("undefined" !== typeof (LUX)
					&& "undefined" !== typeof (LUX.gaMarks) ? LUX.gaMarks : []);
			var d = ("undefined" !== typeof (LUX)
					&& "undefined" !== typeof (LUX.gaMeasures) ? LUX.gaMeasures
					: []);
			var j = "LUX_start";
			var k = window.performance;
			var l = ("undefined" !== typeof (LUX) && LUX.ns ? LUX.ns
					: (Date.now ? Date.now() : +(new Date())));
			if (k && k.timing && k.timing.navigationStart) {
				l = k.timing.navigationStart
			}
			function f() {
				if (k && k.now) {
					return k.now()
				}
				var o = Date.now ? Date.now() : +(new Date());
				return o - l
			}
			function b(n) {
				if (k) {
					if (k.mark) {
						return k.mark(n)
					} else {
						if (k.webkitMark) {
							return k.webkitMark(n)
						}
					}
				}
				a.push({
					name : n,
					entryType : "mark",
					startTime : f(),
					duration : 0
				});
				return
			}
			function m(p, t, n) {
				if ("undefined" === typeof (t) && h(j)) {
					t = j
				}
				if (k) {
					if (k.measure) {
						if (t) {
							if (n) {
								return k.measure(p, t, n)
							} else {
								return k.measure(p, t)
							}
						} else {
							return k.measure(p)
						}
					} else {
						if (k.webkitMeasure) {
							return k.webkitMeasure(p, t, n)
						}
					}
				}
				var r = 0, o = f();
				if (t) {
					var s = h(t);
					if (s) {
						r = s.startTime
					} else {
						if (k && k.timing && k.timing[t]) {
							r = k.timing[t] - k.timing.navigationStart
						} else {
							return
						}
					}
				}
				if (n) {
					var q = h(n);
					if (q) {
						o = q.startTime
					} else {
						if (k && k.timing && k.timing[n]) {
							o = k.timing[n] - k.timing.navigationStart
						} else {
							return
						}
					}
				}
				d.push({
					name : p,
					entryType : "measure",
					startTime : r,
					duration : (o - r)
				});
				return
			}
			function h(n) {
				return c(n, g())
			}
			function c(p, o) {
				for (i = o.length - 1; i >= 0; i--) {
					var n = o[i];
					if (p === n.name) {
						return n
					}
				}
				return undefined
			}
			function g() {
				if (k) {
					if (k.getEntriesByType) {
						return k.getEntriesByType("mark")
					} else {
						if (k.webkitGetEntriesByType) {
							return k.webkitGetEntriesByType("mark")
						}
					}
				}
				return a
			}
			return {
				mark : b,
				measure : m,
				gaMarks : a,
				gaMeasures : d
			}
		})();
		LUX.ns = (Date.now ? Date.now() : +(new Date()));
		LUX.ac = [];
		LUX.cmd = function(a) {
			LUX.ac.push(a)
		};
		LUX.init = function() {
			LUX.cmd([ "init" ])
		};
		LUX.send = function() {
			LUX.cmd([ "send" ])
		};
		LUX.addData = function(a, b) {
			LUX.cmd([ "addData", a, b ])
		};
		LUX_ae = [];
		window.addEventListener("error", function(a) {
			LUX_ae.push(a)
		});
		LUX_al = [];
		if ("function" === typeof (PerformanceObserver)
				&& "function" === typeof (PerformanceLongTaskTiming)) {
			var LongTaskObserver = new PerformanceObserver(function(c) {
				var b = c.getEntries();
				for (var a = 0; a < b.length; a++) {
					var d = b[a];
					LUX_al.push(d)
				}
			});
			try {
				LongTaskObserver.observe({
					type : [ "longtask" ]
				})
			} catch (e) {
			}
		};
	</script>
	<script src="https://cdn.speedcurve.com/js/lux.js?id=410041" async=""
		defer="" crossorigin="anonymous"></script>
	<script
		src="https://static.codepen.io/assets/packs/js/vendor-930eadf79ea82e004f7c.chunk.js"></script>
	<script
		src="https://static.codepen.io/assets/packs/js/2-3db0dbd2b69b82126039.chunk.js"></script>
	<script
		src="https://static.codepen.io/assets/packs/js/everypage-6173ec2dc159f8fe4730.js"></script>
	<div id="react-popups"></div>
	<script
		src="https://static.codepen.io/assets/editor/full/full_page_renderer-ef3a10b55d629db2b76ede35223a93826d54549016a012e3786cd295eaad7f16.js"></script>
</body>
</html>