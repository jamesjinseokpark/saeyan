<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.hk.saeyan.dto.OrderProcess"%>
<%
	OrderProcess orderPro = (OrderProcess) request.getAttribute("myOrderList");
%>
<%@ include file="../include/headerReal.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script>
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		//문서영역의 크기 
		console.log("document 사이즈:" + $(document).width() + "*"
				+ $(document).height());
		//브라우저에서 문서가 보여지는 영역의 크기
		console.log("window 사이즈:" + $(window).width() + "*"
				+ $(window).height());
		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		//애니메이션 효과
		//$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("slow", 0.5);
	}
	function popupOpen() {
		$('.layerpop').css("position", "absolute");
		//영역 가운에데 레이어를 뛰우기 위해 위치 계산 
		$('.layerpop').css(
				"top",
				(($(window).height() - $('.layerpop').outerHeight()) / 2)
						+ $(window).scrollTop());
		$('.layerpop').css(
				"left",
				(($(window).width() - $('.layerpop').outerWidth()) / 2)
						+ $(window).scrollLeft());
		$('.layerpop').draggable();
		$('#layerbox').show();
	}
	function popupClose() {
		$('#layerbox').hide();
		$('#mask').hide();
	}
	function goDetail() {
		/*팝업 오픈전 별도의 작업이 있을경우 구현*/
		popupOpen(); //레이어 팝업창 오픈 
		wrapWindowByMask(); //화면 마스크 효과 
	}
	$(document).ready(function() {
		var formObj = $("form[name='reviewForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			alert("리뷰작성이 완료되었습니다.");
			formObj.attr("action", "/review/list");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	$(document).ready(function() {
		$('.starRev>span').click(function() {
			$(this).parent().children('span.on').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			var bb = $(this).attr('data-value');
			alert(bb + '점 선택!')
			$("#point").val(bb); // 히든 인풋에 값 저장.
			return false;
		});
	});
	function fn_valiChk() {
		var writeForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < writeForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	$(document).on("click", "#refund", function() {
		console.log("들어오냐");
		var re = $('#refun').val();
		var id = $('#userid').val();
		var orderNum = $('#ordernum').val();
		var i_price = $('#price').val();
		var bubble = $('#bub').val();
		console.log(re);
		if (!$('#refun').val() == false) {
			console.log("들어오냐22");
			alert("접수완료로 환불 할 수 없습니다");
		}

		if ($('.pro').val() === "환불완료") {
			alert("환불이 완료된 상태입니다");
			return false;
		}

		else {
			$.ajax({
				data : {
					id : id,
					orderNum : orderNum,
					i_price : i_price,
					bubble : bubble
				},
				url : "/order/refundCheck",
				dataType : 'json',
				method : 'POST',
				success : function(data) {

					alert("환불완료되었습니다.");
					$("#maindiv").load(window.location.href + "#maindiv");

				},
				error : function(data) {
					alert("에러가 발생했습니다.");
					return false;
				}

			});
		}
	});
</script>


<style type="text/css">
/* .tdn { */
/* 	cursor: pointer; */
/* } /* 마우스 포인터가 손가락 모양으로 바꿈*/
* /
	/*-- POPUP common style S ======================================================================================================================== --*/
	
	
	
#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 999;
	background-color: #000000;
	display: none;
}

.layerpop {
	display: none;
	z-index: 1000;
	border: 2px solid #ccc;
	background: #fff;
	align: left;
	height: 400px;
	/* 	cursor: move; */
}

.layerpop_area .title {
	padding: 10px 10px 10px 10px;
	border: 0px solid #aaaaaa;
	background: #f1f1f1;
	color: #3eb0ce;
	font-size: 1.3em;
	font-weight: bold;
	line-height: 24px;
	text-align: left;
}

.layerpop_area .layerpop_close {
	width: 25px;
	height: 25px;
	display: block;
	position: absolute;
	top: 10px;
	right: 10px;
	background: transparent url('/resources/images/btn_exit_off.png')
		no-repeat;
}

.layerpop_area .layerpop_close:hover {
	background: transparent url('/resources/images/btn_exit_on.png')
		no-repeat;
	cursor: pointer;
}

.layerpop_area .content {
	width: 80%;
	margin: 2%;
	height: 400px;
	color: #828282;
	text-align: left;
	align: left;
}

/* #target1 { */
/* 	color: #2C952C; */
/* 	text-align: center; */
/* 	padding: 15px; */
/* } */
.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.starRev span:first-child {
	margin-left: 0;
}

.starRev span.on {
	color: red;
}
/*-- POPUP common style E --*/
.btn-default2 {
	background: rgba(100, 100, 100, 0);
	color: #333;
	border: #333 1px solid;
}

#formcs {
	text-indent: 5px;
	text-align: left;
	align: left;
}

#noresize {
	resize: none;
	width: 540px;
	height: 50px
}
</style>




<div id="container">
	<div id="content" class="brd-wr">
		<div class="tit-area">
			<h2>주문 상세정보</h2>
		</div>
		<div class="brd-bx">
			<div class="inner">
				<h3 class="h3-tit fir"></h3>
				<div class="write-bx">
					<div class="rows">
						<span class="tit-tx m-4"> <b>주문번호</b>
						</span>
						<div class="con-tx m-8">
							<c:set var="itemStr" value="${myOrderList.items}" />
							<c:set var="itemStr" value="${fn:replace(itemStr, '!@#', ':')}" />
							<c:set var="itemStr" value="${fn:replace(itemStr, '$%^', '개 ')}" />
							<c:set var="itemStr"
								value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
							<span class="input p-4 m-12" style="font-size: 20px;">${myOrderList.orderNum}</span>
							<input type='hidden' id="ordernum"
								value='${myOrderList.orderNum}' readonly>
						</div>
					</div>
					<br>
					<div class="rows">
						<span class="tit-tx m-4"> <b>아이디</b>
						</span>
						<div class="con-tx m-8">
							<span class="input p-4 m-12" style="font-size: 20px;">${myOrderList.id}</span>
							<input type='hidden' id="userid" value='${myOrderList.id}'>
						</div>
					</div>
					<br>
					<div class="rows">
						<span class="tit-tx m-4"> <b>품목</b>
						</span>
						<div class="con-tx m-8">
							<span class="input p-4 m-12" style="font-size: 20px;">${itemStr}</span>
							<input type='hidden' class='item' value='${itemStr}'>
						</div>
					</div>
					<br>
					<div class="rows">
						<span class="tit-tx m-4"> <b>결제금액</b>
						</span>
						<div class="con-tx m-8">
							<span class="input p-4 m-12" style="font-size: 20px;">${myOrderList.pay_price}원</span>
							<input type='hidden' id="price" value='${myOrderList.pay_price}'>
						</div>
					</div>
					<br>
					<div class="rows">
						<span class="tit-tx m-4"> <b>결제일</b>
						</span>
						<div class="con-tx m-8">
							<span class="input p-4 m-12" style="font-size: 20px;"><fmt:formatDate
									value='${myOrderList.pay_date}' type='both'
									pattern='yyyy.MM.dd(E)(a)hh:mm:ss' /></span>
						</div>
					</div>
					<br>
					<div class="rows">
						<span class="tit-tx m-4"> <b>세탁 진행상황</b>
						</span>
						<div class="con-tx m-8">
							<%
								String process = "";
							%>
							<c:choose>

								<c:when test="${myOrderList.refundDate ne null}">
									<%
										process = "환불완료";
									%>
								</c:when>

								<c:when test="${myOrderList.finish ne null}">
									<%
										process = "배달완료";
									%>
								</c:when>
								<c:when test="${myOrderList.wash ne null}">
									<%
										process = "세탁중";
									%>
								</c:when>
								<c:when test="${myOrderList.pick ne null}">
									<%
										process = "수거완료";
									%>
								</c:when>
								<c:when test="${myOrderList.ok ne null}">
									<%
										process = "접수완료";
									%>
								</c:when>
								<c:when test="${myOrderList.wait ne null}">
									<%
										process = "접수중";
									%>
								</c:when>
							</c:choose>
							<span class="input p-4 m-12" style="font-size: 20px;"><%=process%></span>
							<input type='hidden' value='<%=process%>' class='pro' readonly><br>
							<input type="hidden" id="refun" value="${myOrderList.ok }" /> <input
								type="hidden" id="bub" value="${myOrderList.bubble }" />
						</div>
					</div>
				</div>
				<br>
				<div class="btn-box">
					<button type="button" id="refund" class="btn btn-default2 btn-lg">환불하기</button>
					<button class='tdn btn btn-default2 btn-lg'>전화면으로</button>
					<!-- 				<div id='detail'></div>	 -->
					<!--Popup Start -->
					<c:choose>
						<c:when
							test="${myOrderList.finish ne null && myOrderList.r_check eq 'N'  }">


							<button onClick="javascript:goDetail('테스트');"
								class="btn btn-blue btn-lg">리뷰 작성하기</button>

					

							<!-- 팝업뜰때 배경 -->
							<div id="mask"></div>


							<div id="layerbox" class="layerpop"
								style="width: 550px; height: 330px;">
								<article class="layerpop_area">
									<div class="title">리뷰 작성하기</div>
									<a href="javascript:popupClose();" class="layerpop_close"
										id="layerbox_close"></a> <br>


									<form name="writeForm" method="post" action="/review/rWrite"
										id="formcs">
										<table>
											<tbody>


												<tr>
													<td><b>업 체 명 :</b>
														${myOrderList.sname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>주문번호
															:</b> ${myOrderList.orderNum}</td>

												</tr>

												<tr>
													<td><label for="content"></label> <textarea
															id="noresize" name="r_content" class="chk"
															title="내용을 입력하세요." placeholder="리뷰를 남겨주세요"></textarea><br></td>
												</tr>
												
												<tr>
													<td><label for="writer"></label><input type="hidden"
														id="snum" name="snum" value='${myOrderList.snum}'
														placeholder="사업자번호 가져올예정" /></td>
												<tr>
												<tr>
													<td><label for="star">별점선택</label> <input type="hidden"
														name="star" id="point" title="별점을 선택해주세요" class="chk" />
														<div class="starRev" title="별점을 선택해주세요">
															<span class="star1 on" id="star1" data-value="1">★</span>
															<span class="star2 on" id="star2" data-value="2">★</span>
															<span class="star3 on" id="star3" data-value="3">★</span>
															<span class="star4 on" id="star4" data-value="4">★</span>
															<span class="star5 on" id="star5" data-value="5">★</span>

														</div>
														
														<tr>
													<td><br><label for="writer">작성자</label><input
														type="text" id="writer" name="w_id" placeholder="ID가져올 예정"
														value="${loginMember.id}" readOnly /><br></td>
												<tr>
												<tr>
													<td>
														<br><button type="submit" class="write_btn">작성완료</button>
													</td>
												</tr>



											</tbody>
										</table>
									</form>

								</article>
							</div>

							<!--Popup End -->

						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	console.log(document.referrer);
	//주문번호 클릭시 주문내역 상세 페이지로 이동
	$(".tdn").click(function() {
		// 		var url = "orderInfo?orderNum="+$(this).html();
		// 		window.location.href=url;
		window.location.href = document.referrer;
	});
	$(".sel").change(function() {
		//var pwdch = document.getElementById('pwdcheck').value;
		console.log($(this).attr("id"));
		console.log($(this).val());
		var num = parseInt($(this).attr("id"));
		$.ajax({
			url : '/member/rest/process',
			data : {
				orderNum : num,
				process : $(this).val()
			},
			dataType : 'text', /*html, text, json, xml, script*/
			method : 'get',
			success : function(data) {
				if (data == 1) {
					alert("변경이 잘됨");
					// 						$("#result").text("비밀번호가 일치 하지 않습니다.");
				} else {
					alert("변경이 안됨");
					// 						$("#result").text("비밀번호가 일치합니다.");
				}
			}
		})
	});
</script>

</body>
</html>