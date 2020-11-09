<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerReal.jsp" %>

<title>새얀</title>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<script type="text/javascript">
    function getInternetExplorerVersion() {
   		var rv = -1;
   		if (navigator.appName == 'Microsoft Internet Explorer') {
    		var ua = navigator.userAgent;
    		var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    		if (re.exec(ua) != null)
    			rv = parseFloat(RegExp.$1);
   		}
   		return rv;
   	} 
    
   	function checkVersion() {
    	var ver = getInternetExplorerVersion();
    	var ie_flag = true; 

    	if (ver == 7 || ver == 8 || ver == 9)
   		{
    		ie_flag = false;
   		}

    	return ie_flag;
   	}
</script>    
<!-- /head -->
<script type="text/javascript">

function linkPage(page){
	$("#pageIndex").val(page);		
	var formAction = "/kr/customer/faqList.do";
	$("#frmList").attr("action", formAction).submit();
}

function goView(){
	
		$(".faq-wr dd").hide();
   		$(this).parent().next("dd").slideToggle(0)   
    		.siblings("dd:visible").slideUp(0) 
    	$(this).parent().toggleClass("active")               
          	.siblings("dt").removeClass("active")	
}

$(document).ready(function(){
	/* GNB 메뉴 마우스, 키보드 이벤트(마우스오버, 키보드 탭 버튼 이동) */
		//var selectedId = -1;
		$("#header").append("<div class='sub-bg'></div>");
		$("#gnb>li.gnb1,#gnb>li.gnb2,#gnb>li.gnb3,#gnb>li.gnb4,#gnb>li.gnb5,#gnb>li.gnb6").each(function(){
			$(this).bind({
				"mouseenter focusin":function(){
					//var id = $(this).index();
					$("#header").addClass("on");
					$("#header #gnb>li").removeClass('active');
					$(this).addClass('active');
					$('#header .subdepth').removeClass('show_menu');
					//});
					//var dt2 = $("#gnb>li").eq(idx).find(".subdepth").height();
					$('#header .sub-bg').show();
					$("#header .sub-bg").stop().slideDown(200);
					$('#header .subdepth').stop().slideUp(100);
					$(this).find(".subdepth").stop().slideDown(200, function(){
						$(this).addClass('show_menu');
					})
				}
			});
		});
		$("#gnb>li,#gnb>li.gnb7").each(function(){
			$(this).bind({
				"mouseleave focusout":function(){
					$("#header").removeClass("on");
					$("#header #gnb > li").removeClass('active');
					$("#header .sub-bg").stop().slideUp(100);
					$('#header .subdepth').stop().slideUp(100, function(){
						$(this).addClass('show_menu');
					});
					//$('.sub-bg').stop().slideUp(200);
				}
			});
		});

		$(".brna").click(function (){
			$(this).next("ul").animate({height:"toggle"},300);
			return false;
		});
		$("#fselect ul li a").click(function(){
			$("#fselect ul").css("display","none");
		});

		$("select.selectBox").chosen({disable_search_threshold: 10});
		$("select.select").chosen({
			disable_search_threshold: 10,
			inherit_select_classes:true
		});

		 //메인 slide
		var mainSlide = $('.main-slide .slide').bxSlider({
			pagerCustom: '#bx-pager',
			auto:true,
			pause:8000
		});
		$('.main-slide .stop').on('click',function(){
			mainSlide.stopAuto();
			$(this).css("display","none");
			$(".play").css("display","inline-block");
		});
		$('.main-slide .play').on('click',function(){
			mainSlide.startAuto();
			$(this).css("display","none");
			$(".stop").css("display","inline-block");
		});

	
		var selfSp = $(".self-slide .slide").owlCarousel({
			items:4,
			loop:true,
			margin:16,
			autoWidth:true,
			responsive : {
				0 : {
					center: true,
				},
				1100 : {
					center: false,
				}
			}
		});

		resizeFix = function() {
			if ($( window ).width() > 769) {
				$("#fselect ul").show();
			}
			if ($(window).width() <= 769) {
				$("#fselect ul").hide();
				//comHistory();
				//setResize = 2;
			}
		}

		
		// faq tab
		var $txTaba = $(".tab-tx .mn-bx").owlCarousel({
			margin:0,
			autoWidth:true,
			items:4
		});
		$(window).resize(function() {
			return $(window).on('resize', resizeTxTab);
		});
		resizeTxTab = function() {
			if ($( window ).width() > 1099) {
				$txTaba.trigger('destroy.owl.carousel').removeClass('owl-carousel owl-loaded');
				$txTaba.html($txTaba.find('.owl-stage-outer').html()).removeClass('owl-loaded');
				} else if ($(window).width() <= 1099) {						
					$(".tab-tx .mn-bx").owlCarousel({
						margin:0,
						autoWidth:true,
						items:4
					});
				}
		};
		if($( window ).width() > 1099 ) {				
			$txTaba.trigger('destroy.owl.carousel').removeClass('owl-carousel owl-loaded');
			$txTaba.html($txTaba.find('.owl-stage-outer').html()).removeClass('owl-loaded');
		} else if($( window ).width() <= 1099) {
			$(".tab-tx .mn-bx").owlCarousel({
				margin:0,
				autoWidth:true,
				items:4
			});
		}else {
			return $(window).on('resize', resizeTxTab);							
		}
		
		// faq
		comHistory = function() {
		$(".history-bx>div.y .inner").hide();
		$(".history-bx>div.y").click(function(){
		$(this).toggleClass("active")
			.siblings("div.y").removeClass("active");
		$(this).find(".inner").show();
		$(this).siblings().find(".inner").hide();
		}).filter(':first').click();
	}

	$(document).ready(function(){
		if($( window ).width() > 769 ) {		
		} else {
			comHistory();
		}
	});

	$(window).bind('resize', function(){
		//if (setResize == 1) {
			resizeFix();	
		//}
	});

	function getSize(){
		if(window.innerHeight){
			// Firefox, Webkit
			iW = window.innerWidth;
			//iH = window.innerHeight;
		}else{
			// Internet Explorer
			iW = document.documentElement.clientWidth;
			//iH = document.documentElement.clientHeight;
		}
		return iW;
	}
	// Document Width Variable
	var dW;
	var lm_open = false;
	var lan_open = false;
	var lo_open = false;
	var ua = window.navigator.userAgent;
	var mobileMenuAllHtml = "";
	var winW = $(window).width();

	$(window).bind('resize', function(){
		setTimeout(function(){
			if(winW != $(window).width()){
				winW = $(window).width();
			}
		}, 500);
		//resizeFix();
	});


	$(document).on("click", ".bt-menu", menuCtr);
	$(document).on("click", ".left_menu > li > a", subMenu);
	$(document).on("click", ".mdepth2 > ul > li > a", subMenu02);
	$(document).on("click", ".mdepth3 > ul > li > a", subMenu03);


	function menuCtr(e){
		e.preventDefault();
		
		$(".mdepth2").slideUp(200);
		$(".left_menu li").removeClass("on");

		$(this).toggleClass("open");
		if(ua.indexOf('MSIE 7') > -1 || ua.indexOf('MSIE 8') > -1){
			$("body").toggleClass("ovf_hdn");
		}else{
			$("html, body").toggleClass("ovf_hdn");
		}

		if(!$(this).hasClass("open")){
			$(".m_lmenu").stop().animate({left : '-100%'}, 250);
			$(".mbg").fadeOut(200);
			lm_open = false;

			if(ua.indexOf('MSIE 7') > -1 || ua.indexOf('MSIE 8') > -1){
				$("html").css({"height" : "100%"});
				$("body").css({"height" : "100%", "overflow" : "visible", "position" : "static"});
			}
		}else{
			$(".m_lmenu").stop().animate({left : 0}, 250);
			$(".mbg").fadeIn(200);
			lm_open = true;

			if(ua.indexOf('MSIE 7') > -1 || ua.indexOf('MSIE 8') > -1){
				$("html").css({"height":$(window).height() + "px"});
				$("body").css({"height":$(window).height() + "px", "overflow" : "hidden", "position" : "relative"});
			}
		}
	}


	   
	});
</script>

	<div id="container">			

		<div id="content" class="brd-wr">
			<div class="tit-area">
				<h2>자주묻는 질문</h2>
				<p class="sub-tx">고객님. 질문 전에 먼저 궁금사항을 찾아보세요.</p>
			</div><!-- /tit-area -->	

			<div class="brd-bx">

				<div class="inner">

					<form name="frmList" id="frmList" method="post">
					<input type="hidden" name="searchSeq" id="searchSeq" value="">
					
					<input type="hidden" name="pageIndex" id="pageIndex" value="1">
					<input type="hidden" name="searchCondition" id="searchCondition" value="1">

					<dl class="faq-wr">
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('1');return false;">스마트 무인세탁함은 어떻게 이용하나요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							<p>스마트 무인세탁함은 365일, 24시간 고객님이 원하시는 시간에 </p><p>세탁물을 접수하고 찾아가실 수 있으며,&nbsp;카드결제가 가능한&nbsp;시스템 입니다. </p><p>&nbsp;</p><p>단, 모든 매장에 설치 된 것이 아니기 때문에 홈페이지 &lt;매장찾기- 스마트무인세탁함&gt;에서</p><p>스마트 무인세탁함이 설치된 매장을 확인하신 후 이용해 주시기 바랍니다. </p><p>&nbsp;</p><p>스마트 무인세탁함의 이용방법은</p><p>세탁물을 접수하시면 매장 직원이 확인하고 확인문자를 보내드리며, </p><p>세탁후 세탁완료문자를 보내드립니다. </p><p>문자를 받으신 후&nbsp;무인세탁함에서 카드결제하시고, 세탁물을 찾아가시면 됩니다. &nbsp;</p>
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('2');return false;">매장 영업시간은 몇 시부터 몇 시인가요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							매장에 따라 영업시간이 다소 차이가 날 수 있습니다.<br><br>이용하실 매장에 문의하시거나 홈페이지에서 ‘매장찾기’를 하시면 해당 매장의 영업시간을 확인하실 수 있습니다.&nbsp;
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('3'); return false;">수거배달서비스를 하나요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							모든 매장에서 수거배달을 하고 있지는 않습니다. 이용하실 매장에 문의하시거나 홈페이지에서 ‘매장찾기’를 하시면 해당 매장의 수거배달서비스 여부를 확인하실 수 있습니다.
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('4'); return false;">세탁물은 며칠 이내에 찾아가야 하나요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							맡기신 세탁물은 10일 이내에 찾아가 주시고 찾아가지 않은 세탁물에 대해서는 1일 단위로 계산하여 세탁요금의 3%의 보관료를 부과할 수 있습니다. 그리고, 3개월 이내에 찾아가지 않는 세탁물에 대해서는 분실, 도난 등의 책임을 지지 않으며, 6개월이 지난 후에는 처분될 수 있습니다
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('5'); return false;">세탁물을 찾을 때 영수증(보관증)이 꼭 필요한가요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							신속하고 정확하게 세탁물을 인도해 드리기 위해서 보관증은 꼭 필요합니다. 단, 보관증을 불가피하게 분실하셨을 경우에는 매장에 방문하셔서 도착문자를 보여주시고 매장에 비치되어 있는 세탁물 인도 확인서류에 고객님 이름과 연락처를 남겨주시면 됩니다.<br> 크린토피아 앱을 이용하시면 세탁물 접수현황을 실시간으로 확인하실 수 있으며, 영수증(보관증)을 따로 보관하지 않으셔도 되기 때문에 추천드립니다.<br>
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('6'); return false;">세탁은 얼마나 오래 걸리나요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							영업일 기준으로 3박 4일의 기간이 소요됩니다. 그러나, 세탁물이 한꺼번에 몰리는 4월, 5월의 경우에는 기간이 다소 더 소요될 수 있습니다. 또한, 가죽이나 모피의 경우 보통 10~15일정도(세탁물이 많은 4,5월의 경우 20~40일정도)소요되는데, 제품 종류나 수작업 여부에 따라 더 오래 걸릴 수 있습니다.
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('7'); return false;">특급, 초특급(당일세탁서비스)은 어떤 서비스입니까?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							초특급은 당일 세탁서비스로 오전에 일찍 세탁물을 맡기면 저녁에 받아볼 수 있는 빠른 세탁서비스입니다. 요금은 해당품목의 50% 요금이 추가됩니다. 특급은 만 1일 서비스로 세탁요금에 300원이 추가되며 당일 접수하여 다음날 저녁까지 납품해 드리는 서비스입니다. 단, 매장이나 세탁 품목에 따라 특급이나 초특급이 불가한 경우가 있으며, 매장 별로 특급, 초특급 접수시간에 차이가 있으니 특급이나 초특급을 이용하시고자 하실 경우에는 해당 매장에 정확한 문의를 해주십시오.
						</dd>
						
						<dt>
							<span class="blt">Q</span>
							<button onclick="goView('8'); return false;">의류 수선도 하나요?</button>
						</dt>
						<dd>
							<span class="blt">A</span>
							모든 매장에서 의류 수선을 하고 있지는 않습니다. 이용하실 매장에 문의하시거나 홈페이지에서 ‘매장찾기’를 하시면 해당 매장의 의류 수선서비스 여부를 확인하실 수 있습니다. 
						</dd>
						
						 
					</dl>
					
					</form>
			
					<!-- /paging -->

				</div><!-- /inner -->

			</div><!-- /brd-bx -->

		</div><!-- /content -->

	</div><!-- /container -->

	
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-84091616-2', 'auto');
  ga('send', 'pageview');

</script>
	<!-- /footer -->


</body>
</html>