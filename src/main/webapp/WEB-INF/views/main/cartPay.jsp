<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.hk.saeyan.dto.Cart"%>

<%@ page import="java.util.List"%>
<%
	List<Cart> cart = (List<Cart>) request.getAttribute("cartpay");
%>
<%@ include file="../include/headerReal.jsp"%>
<title>결재</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/pay.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.tit h2 {
	text-align: center;
	padding-top: 50px;
	font-size: 50px;
}

#btn {
    margin-right: 40% !important;
    margin-left: 40% !important;
}


</style>

<script type="text/javascript">
      function itemSum() {
         console.log("시작");
         var sum = 0;
         var count = $(".chkbox").length;
         for (var i = 0; i < count; i++) {
            if ($(".chkbox")[i].checked === true) {
               sum += Number($(".chkbox").eq(i).val());
            }
            console.log(sum);
            $("#total_sum").val(sum);
            $("#pricepay").val(sum);
            $("#finalprice").val(sum);
            
         }
      }
      //주문자 정보 동일
	$(function(){
		$('#useraddr').click(function(){
			var user = this.checked;
			$('#username').val(user ? $('#orderName').val():'');
			$('#userpnum').val(user ? $('#orderpnum').val():'');
			$('#postcode').val(user ? $('#sample6_postcode').val():'');
			$('#address').val(user ? $('#sample6_address').val():'');
			$('#extraAddress').val(user ? $('#sample6_extraAddress').val():'');
			$('#detailAddress').val(user ? $('#sample6_detailAddress').val():'');
		});
	
	});


       //카드정보 나오기 
		//?는 삼항연산자 (true면 왼쪽 false면 오른쪽)
      $(function(){
   	   $("#user").click(function () {
       	   var chk=$("input[name='cardchk']").val()
       	   if(chk=="Y"){
   		    $('.card').css('display', ($(this).val() === 'a') ? 'block':'none');
       	   }else{
						alert("등록된 카드정보가 없습니다");
						$("#user").prop('checked', false);
           	   }
   		});
		});

      $(function(){
   	   $("#userkakao").click(function () {
       	  
   		    $('.card').css('display', ($(this).val() === 'b') ? 'none':'block');
       	  
   		});
		});
       
		//버블충전 금액 chk
		$(document).ready(function(){
			console.log("들어오냐")
			$('#paybubble').focus(function() {
			checkBubble();
			});
		});

		function checkBubble(){
// 			console.log("여기도 들어오냐")
			var paybub=$('#paybubble').val();
			var bub=Number(${finalPay.bubble});
			var total_sum = $('#total_sum').val();	
			

			if(paybub>bub){
// 			$('#bubble_check').text('버블이 부족합니다,버블을 충전해주세요');
// 			$('#bubble_check').css('color', 'red');
				$('#paybubble').val(${finalPay.bubble});
// <input type="text" name="pp_bubble" id="paybubble" value="0" oninput="checkBubble()">원(사용가능 버블:<a>${finalPay.bubble}
			
// 			}else {
// 				$('#bubble_check').text('버블사용 가능합니다' );
// 				$('#bubble_check').css('color', 'black');
// 				console.log("최대치 들어간다");
			}
			
			paybub = Number($('#paybubble').val());
// 			console.log('total',total_sum);
// 			console.log('paybub',paybub);
			
			if(paybub>total_sum){
// 				console.log("버블 고만넣어");
				$('#paybubble').val(total_sum);
			}
	
		}
       
         //버블충전
         $(function(){
         $('#bubbleBut').click(function () {
            //var id=$('input[name="id"]').val()
            //console.log("id=",id);
            var b_price =$('input[name="b_price"]:checked').val()
            var email=$('input[name="email"]').val()
            var name=$('input[name="name"]').val()
//             var pnum=$('input[name="orderpnum"]').val()
               
             
             var IMP = window.IMP;
             IMP.init('imp75580600'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                 //var msg;
                 
                 IMP.request_pay({
                     pg : 'kakaopay',
                     pay_method : 'card',
                     merchant_uid : 'merchant_' + new Date().getTime(),
                     name : '버블충전',
                     amount : b_price,
                     buyer_email : email,
                     buyer_name : name,
                     buyer_tel : '01026954959',
                     //m_redirect_url : '/'
                 }, function(rsp) {
                     console.log(rsp);
                     if (rsp.success) {
                          var msg = '결제가 완료되었습니다.';
                          msg += '고유ID : ' + rsp.imp_uid;
                          msg += '상점 거래ID : ' + rsp.merchant_uid;
                          msg += '결제 금액 : ' + rsp.paid_amount;
                          msg += '카드 승인번호 : ' + rsp.apply_num;
                          $.ajax({
                              type: "POST", 
                              url: "/order/bubblePay", //충전 금액값을 보낼 url 설정
                              data: {
                                 //amount : money
                                  b_price : rsp.paid_amount
                                 
                              },
                          });
                          alert(msg);
                          document.location.href="/stores/pay";
                          
                             } else {
                                 var msg = '결제에 실패하였습니다.';
                                 msg += '에러내용 : ' + rsp.error_msg;
                                 document.location.href="/stores/pay";
                             }
                             //alert창 확인 후 이동할 url 설정
                         });
                     });
         });

            //결제금액
               $(function(){
             $("#paybubble").change(function(){

                var finalbubble= $(this).val();
                $('#p_bubble').val(finalbubble);
            var pay=$("#pricepay").val()-$('#p_bubble').val();
                   $("#finalprice").val(pay);
             
                });
         });

         //최종결제 
           var ret;  
                function kakaopay(){
                    //var payData = $("#payform").serialize();
                    
                     if ( ! jQuery('input[name="usercard"]:checked').val() ) {
                            alert('결제수단을 선택해주세요.');
                         jQuery('input[name="usercard"]').focus();  
                         return false;
                     }
                      if( ! $('#check_agree_policy:checked').val()){
                         alert('동의하셔야 결제가 가능합니다.');
                          $('#check_agree_policy').focus();
                          return false;
                      }
					if( ! $('#useraddr:checked').val()){
                        alert('배송지정보를 입력하셔야 결제가 가능합니다.');
                        $('#useraddr').focus();
                        return false;
                    }
                 	console.log("안들어오지?")
                   var id=$('input[name="id"]').val();
                   var bub=$('input[name="bubble"]').val();
                   
                   var items=$('input[name="items"]');
                   var sname=$('input[name="sname"]');
                   var snum=$('input[name="snum"]');
                   var paycart=$('input[name="paycart"]');//상품별 가격
                   console.log(items.length);
                   var bubb=Math.floor(bub/items.length);
                   console.log(bubb);
                       var ttt = new Array();
                       var sss = new Array();
                       var snn = new Array();
                       var ccc = new Array();
                       
                       for(var i=0;i<items.length;i++){
                          ttt.push(items.eq(i).val());
                          sss.push(sname.eq(i).val());
                          snn.push(snum.eq(i).val());
                          ccc.push(paycart.eq(i).val());
                                                 
                       }
                  
                      var pay_price =$('input[name="pay_price"]').val()
                      var email=$('input[name="email"]').val()
                      var name=$('input[name="name"]').val()
                      var pnum=$('input[name="orderpnum"]').val()
                      
                      console.log(Number($('#pricepay').val()));
                      console.log(Number($('#p_bubble').val()));
                      console.log(Number($('#finalprice').val()));
                      
						//버블로 전액 결제 됬을때                      
                      if(Number($('#pricepay').val())==Number($('#p_bubble').val()) && Number($('#finalprice').val()==0)){
						alert("버블로 몽땅 결제됬다");
						var check = 'Y';
						$.ajax({
                            type: "POST", 
                            url: "/order/finalPay", //충전 금액값을 보낼 url 설정 
                            async: false,                               
                            dataType: "json",
                            data: {
                               //amount : money
                                pay_price : ccc,
                                sname : sss,
                                snum : snn,
                                items : ttt,
                               	bubble : bubb,
                               	id : id,
                               	check : check
                            },
                            success: function(data){
							  ret =data/2;
                          	  $('input[name="ret"]').val(ret);
                              console.log($('input[name="ret"]').val());
                             
                            }
                        });
						var msg = '결제가 완료되었습니다.';
                        alert(msg);
                        document.location.href="/stores/payCheck?ret="+ret;
                      }
                      
                      
                      
                      
                       var IMP = window.IMP;
                       IMP.init('imp75580600'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                           //var msg;
                           
                           IMP.request_pay({
                               pg : 'kakaopay',
                               pay_method : 'card',
                               merchant_uid : 'merchant_' + new Date().getTime(),
                               name : '최종상품결제',
                               amount : pay_price,
                               buyer_email : email,
                               buyer_name : name,
                               buyer_tel : pnum,
                               //m_redirect_url : '/'
                           }, function(rsp) {
                               console.log(rsp);
                               if (rsp.success) {
                                    var msg = '결제가 완료되었습니다.';
                                    msg += '고유ID : ' + rsp.imp_uid;
                                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                                    msg += '결제 금액 : ' + rsp.paid_amount;
                                    msg += '카드 승인번호 : ' + rsp.apply_num;
                                    var check = 'N';
                                    $.ajax({
                                        type: "POST", 
                                        url: "/order/finalPay", //충전 금액값을 보낼 url 설정 
                                        async: false,                               
                                        dataType: "json",
                                        data: {
                                           //amount : money
                                            pay_price : ccc,
                                            sname : sss,
                                            snum : snn,
                                            items : ttt,
                                           	bubble : bubb,
                                           	id : id,
                                           	check : check
                                        },
                                        success: function(data){
										  ret =data/2;
                                      	  $('input[name="ret"]').val(ret);
                                          console.log($('input[name="ret"]').val());
                                         
                                        }
                                    });
                                    alert(msg);
                                    document.location.href="/stores/payCheck?ret="+ret; //alert창 확인 후 이동할 url 설정
                                    } else {
                                           var msg = '결제에 실패하였습니다.';
                                           msg += '에러내용 : ' + rsp.error_msg;
                                           document.location.href="/stores/pay";
                                       }
                                     
                                   });
                               };
                             
   </script>
<div class="tit">
	<h2>Order</h2>

</div>
<form id="payform" method="post">
	<div class="payOrder">
		<h2>주문내역</h2>
		<table class="table table-bordered" id="tbl-product">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 20%" />
				<col style="width: 20%" />
				<col style="width: 20%" />
				<col style="width: 20%" />
			</colgroup>
			<tr>
				<th></th>
				<th>세탁소</th>
				<th>품목</th>
				<th>가격</th>
			</tr>

			<c:forEach var="cart" items="${cartpay}">
				<input type="hidden" name="items" value="${cart.items}" />
				<input type="hidden" name="ret" value="" />
				<input type="hidden" name="sname" value="${cart.sname}" />
				<input type="hidden" name="snum" value="${cart.snum}" />
				<input type="hidden" name="paycart" value="${cart.pay_cart}" />
				<tr>
					<td class="product-close"><input type="checkbox" name="chkbox"
						onClick="itemSum()" class="chkbox" value="${cart.pay_cart}"
						disabled /></td>
					<td>${cart.sname}</td>
					<c:set var="itemStr" value="${cart.items}" />
					<c:set var="itemStr" value="${fn:replace(itemStr, '!@#', ':')}" />
					<c:set var="itemStr" value="${fn:replace(itemStr, '$%^', ',')}" />
					<c:set var="itemStr"
						value="${fn:substring(itemStr, 0, fn:length(itemStr)-1)}" />
					<td class='item'>${itemStr}</td>
					<td>${cart.pay_cart}</td>
				</tr>
			</c:forEach>
		</table>

		<input type="hidden" name="cart_seq" value="${cart.cart_seq}" /> 합계:<input
			type="text" class="total-cart-p" id="total_sum" name="pay_cart"
			value="" />

	</div>


	<div class="orderArea  ec-shop-ordererForm">
		<div class="title">
			<h3>주문 정보</h3>
			<p class="required">
				<img
					src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
					alt="필수"> 필수입력사항
			</p>
		</div>
		<div class="ec-base-table typeWrite">
			<table border="1" summary="">
				<caption>주문 정보 입력</caption>
				<colgroup>
					<col style="width: 139px;">
					<col style="width: auto;">
				</colgroup>
				<!-- 국내 쇼핑몰 -->
				<tbody class="address_form  ">
					<tr>
						<th scope="row">주문하시는 분 <img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"></th>
						<td><input type="hidden" name="id" value="${finalPay.id}" />
							<input type="text" id="orderName" name="name"
							value="${finalPay.name}" readonly /></td>
					</tr>
					<tr class="">
						<th scope="row">주소 <img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"></th>
						<td><input type="text" id="sample6_postcode"
							placeholder="${finalPay.userZipCode}" name="userZipCode"
							value="${finalPay.userZipCode}"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소"
							name="userFirstAddr" value="${finalPay.userFirstAddr}"><br>
							<input type="text" id="sample6_extraAddress" placeholder="참고항목"
							name="userExtraAddr" value="${finalPay.userExtraAddr}"> <input
							type="text" id="sample6_detailAddress" placeholder="상세주소"
							name="userSecondAddr" value="${finalPay.userSecondAddr}"></td>
					</tr>
					<tr class="">
						<th scope="row">휴대전화 <span class=""><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
								alt="필수"></span>
						</th>
						<td><input type="text" id="orderpnum" name="orderpnum"
							value="${finalPay.pnum}" /></td>
					</tr>
				</tbody>
				<!-- 해외 쇼핑몰 -->
				<tbody class="email ec-orderform-emailRow">
					<tr>
						<th scope="row">이메일 <img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"></th>
						<td><input type="text" name="email" value="${finalPay.email}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 배송정보 -->
	<div class="orderArea">
		<div class="title">
			<h3>배송 정보</h3>
			<p class="required">
				<img
					src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
					alt="필수"> 필수입력사항
			</p>
		</div>
		<div class="ec-base-table typeWrite">
			<table border="1" summary="">
				<caption>배송 정보 입력</caption>
				<colgroup>
					<col style="width: 139px;">
					<col style="width: auto;">
				</colgroup>
				<!-- 비회원 결제 -->
				<!-- 국내 배송지 정보 -->
				<tbody class="">
					<tr class="">
						<th scope="row">배송지 선택</th>
						<td>
							<div class="address">
								<input id="useraddr" fw-filter="" fw-label="1" fw-msg=""
									value="T" type="radio">&nbsp;주문자 정보와 동일
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">받으시는 분 <img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"></th>
						<td><input type="text" id="username" /></td>
					</tr>
					<tr>
						<th scope="row">주소 <img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"></th>
						<td><input type="text" id="postcode"><br> <input
							type="text" id="address" placeholder="주소"><br> <input
							type="text" id="extraAddress" placeholder="참고항목"><input
							type="text" id="detailAddress" placeholder="상세주소"></td>
					</tr>

					<tr class="">
						<th scope="row">휴대전화 <span class=""><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
								alt="필수"></span>
						</th>
						<td><input type="text" id="userpnum"></td>
					</tr>

				</tbody>

			</table>
		</div>
	</div>

	<!-- 포인트결제 -->
	<div class="orderArea">
		<div class="title">
			<h3>포인트사용</h3>
		</div>
	</div>
	<div class="ec-base-table typeWrite">
		<table border="1" summary="">
			<colgroup>
				<col style="width: 139px;">
				<col style="width: auto;">
			</colgroup>
			<!-- 비회원 결제 -->
			<!-- 국내 배송지 정보 -->
			<tbody class="">
				<tr class="">
					<th scope="row">버블사용</th>
					<td><input type="text" name="pp_bubble" id="paybubble"
						value="0" onchange="checkBubble()">원(사용가능 버블:<a>${finalPay.bubble}</a>)
					</td>
				</tr>
				<tr class="">
					<th scope="row">버블충전 <span class=""></th>
					<td><input tyPe="radio" value="10000" name="b_price" />10000버블
						<input tyPe="radio" value="30000" name="b_price" />30000버블 <input
						tyPe="radio" value="50000" name="b_price" />50000버블
						<button type="button" id="bubbleBut">충전하기</button></td>
				</tr>

			</tbody>

		</table>
	</div>

	<div class="title">
		<h3>결제 예정 금액</h3>
	</div>
	<div class="totalArea">
		<div class="ec-base-table typeList gBorder total">
			<table border="1" summary="">
				<caption>결제 예정 금액</caption>
				<colgroup>
					<col style="width: 33.33%">
					<col style="width: 33.33%" class="">
					<col style="width: 33.33%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><strong>총 주문 금액</strong></th>
						<th scope="col" class=""><strong>총 </strong><strong
							id="total_addsale_text" class="">할인</strong><strong
							id="plus_mark" class=""> 금액</strong></th>
						<th scope="col"><strong>총 결제예정 금액</strong></th>
					</tr>
				</thead>
				<tbody class="center">
					<tr>
						<td class="price"><div class="box txt16">
								<strong><span id="total_order_price_view" class="txt23"><input
										type="text" id="pricepay" name="orderprice" value="" /></span>원</strong> <span
									class="displaynone"><span
									id="total_order_price_ref_view"></span></span>
							</div></td>
						<td class="option "><div class="box txt16">
								<strong>-</strong> <strong><span
									id="total_sale_price_view" class="txt23"><input
										type="text" id="p_bubble" name="bubble" value="0" readonly /></span>원</strong>
								<span class="displaynone"><span
									id="total_sale_price_ref_view"></span></span>
							</div></td>
						<td><div class="box txtBlack txt16">
								<strong>=</strong> <strong><span
									id="total_order_sale_price_view" class="txt23"><input
										type="text" id="finalprice" name="pay_price" value="" readonly /></span>원</strong>
								<span class="displaynone"><span
									id="total_order_sale_price_ref_view"></span></span>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="title">
		<h3>결제수단</h3>
		<span class="txtBlack gIndent20 displaynone"> <input
			type="checkbox" id="save_paymethod" name="save_paymethod" value=""
			disabled=""><label for="save_paymethod">결제수단과 입력정보를
				다음에도 사용</label>
		</span>
	</div>

	<div class="payArea">
		<div class="payment">
			<div class="method">
				<span class="ec-base-label"><input tyPe="radio"
					name="usercard" id="user" value='a' /> <label>등록 카드</label></span>
				<div class="card" style='display: none'>
					<input type="hidden" name="cardchk" value="${finalPay.cardCheck}" />
					<input type="text" name="com" value="${finalPay.cardCom}" /> <input
						type="text" name="com" value="${finalPay.cardNum}" />
				</div>

				<span class="ec-base-label"><input tyPe="radio"
					name="usercard" id="userkakao" value='b' /> <label>카카오페이</label></span> 
			</div>

		<div class="form-check check_agree_policy">
			<label class="form-check-label" for="check_agree_policy"> <input
				type="checkbox" id="check_agree_policy" class="form-check"
				autocomplete="off"> <span class="check-img"></span> 결제 진행
				필수사항 동의
			</label>
		</div>
		<div class="all_policy">
			<div class="title">개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>
			<div class="opener">보기</div>
		</div>
		<div class="ec-base-button gColumn">
			<a href="#none" id="btn" class="btnSubmit sizeXL"
				onclick="kakaopay();"><span class="">결제하기</span></a>
		</div>
		
		<!--      <input type="button" value="결제하기" onclick="kakao()"/>   -->
</form>

<script>
      //들오오자마자 체크박스에 체크해주기
      var ck = "${cart}";
      if (ck == 'false') {
         $("#allCheck").prop("checked", false);
      } else {
         $("#allCheck").prop("checked", true);
         $(".chkbox").prop("checked", true);
         itemSum();
      }


</script>
</body>
</html>