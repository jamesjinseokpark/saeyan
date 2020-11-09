<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.saeyan.dto.Members" %>
<%@ page import="com.hk.saeyan.dto.PersonalPay" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% Members user = (Members) request.getAttribute("user");%>
<% PersonalPay pay = (PersonalPay) request.getAttribute("pay");%>
<%@ include file="../include/headerReal.jsp" %>
<title>카드정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//카드 번호 정규식 
var cardNumR = /([0-9]{12})/;
//카드 유효기간 무조건 2자리 넣게 하는 정규식
var expR = /[0-9]{2}/;
//카드 cvc 무조건 3자리 넣게 하는 정규식
var cvcR = /[0-9]{3}/;

$(document).on("click", "#deleteBtn", function(){
	var id = $("#id").val();
	$.ajax({
		data:{id:id},
		method: "post",
		dataType: "json",
		url: "/auth1/cardDelete",
		success:function(data){
			if(data==0){
				alert("등록된 카드정보가 삭제되었습니다.");
				window.location.reload();
			}
		},
		error:function(error){
			alert("에러 발생!!!");
		}
	});
});

$(document).ready(function(){
	$('#cardNum').focus(function(){
		checkCardNum();
	});
	$("#expMM").focus(function(){
		checkMM();
	});
	$('#cardCvc').focus(function(){
		cardCvc();
	});

	console.log("카드번호는", $("#cardNum").val() == null);
	if($("#cardNum").val() == '') {
		$("#deleteBtn").attr('disabled', true);
	} else  {
		$("#deleteBtn").attr('disabled', false);
	}
});
function checkCardNum(){
	if($('#cardNum').val() == ''){
		$('#cardNum_check').text('카드번호를 입력해주세요');
		$('#cardNum_check').css('color', 'red');
	} else if(cardNumR.test($('#cardNum').val()) != true) {
		$('#cardNum_check').text('숫자만 입력해주세요(공백 사용 불가)');
		$('#cardNum_check').css('color', 'red');
	} else {
		$('#cardNum_check').text('✔' );
		$('#cardNum_check').css('color', 'black');
		console.log($("#cardNum").val());
	}
}

function checkMM(){
	if($("#expMM").val() == ''){
		$('#cardExp_check').text('유효기간 월 을 입력해주세요');
		$('#cardExp_check').css('color', 'red');
	} else if (expR.test($("#expMM").val()) != true) {
		$('#cardExp_check').text('MM형식에 맞게 입력 해주세요(ex.3월->03)');
		$('#cardExp_check').css('color', 'red');
	} else {
		$('#cardExp_check').text('✔' );
		$('#cardExp_check').css('color', 'black');
	}
}

function cardCvc(){
	if($('#cardCvc').val () == ''){
		$('#cardCvc_check').text('카드 뒷면의 CVC번호 3자리를 입력해주세요');
		$('#cardCvc_check').css('color', 'red');
	} else if(cvcR.test($('#cardCvc').val() != true)){
		$('#cardCvc_check').text('CVC번호는 3자리 입니다.');
		$('#cardCvc_check').css('color', 'black');
	} else {
		$('#cardCvc_check').text('✔' );
		$('#cardCvc_check').css('color', 'black');
	}
}


// if(${ret}==1){
// 	alert("등록된 카드정보가 삭제되었습니다.")
// }
</script>
</head>
<body>
	<div id="container">
		<div id="content" class="brd-wr">
			<div class="tit-area">
				<h2>카드정보 수정</h2>
			</div>
			<div class="brd-bx">
				<div class="inner">
					<h3 class="h3-tit fir">카드정보 수정</h3>
					<span class="help-tx" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*카드 등록은 하나만 가능합니다.카드 정보를 변경하실 경우 기존 등록된 카드 정보는 삭제된 후 새로 등록됩니다.</p></span>
					<div class="write-bx">
						<form action="payUpdate" name="rform" id="rform" method="post">
							<input type="hidden" name="cardCheck" value="Y">
							<div class="rows">
								<span class="tit-tx m-4">
								<b>아이디</b>
								</span>
								<div class="con-tx m-8">
									<span class="input p-4 m-12">${loginMember.id }</span>
									<input type="hidden" name="id" id="id" value="${loginMember.id }"><br>
								</div>
							</div>
							<div class="rows">
								<span class="tit-tx m-4">
								<b>카드회사</b>
								</span>
								<div class="con-tx m-12">
									<select class="select m-3" id="cardCom" name="cardCom" form="rform">
										<option value="">카드사를 선택해주세요</option>
										<option value="KB카드">KB국민카드</option>
										<option value="신한카드">신한카드</option>
										<option value="하나카드">하나카드</option>
										<option value="롯데카드">롯데카드</option>
										<option value="BC카드">BC카드</option>
										<option value="농협카드">NH농협카드</option>
										<option value="삼성카드">삼성카드</option>
										<option value="현대카드">현대카드</option>
									</select><br>
								</div>
							</div>
							<div class="rows">
								<span class="tit-tx m-4">
								<b>카드번호</b>
								</span>
								<div class="con-tx m-8">
									<input type='text' id="cardNum" class="input p-5 m-12" name='cardNum' maxlength="12" value="${pay.cardNum }" oninput="checkCardNum()">
									<div class="validation" id="cardNum_check"></div>
								</div>
							</div>
							<div class="rows">
								<span class="tit-tx m-4">
								<b>유효기간</b>
								</span>
								<div class="con-tx m-8">
									<input type="hidden" id="cardExp"  name="cardExp" value="${pay.cardExp }">
									<b>월</b>
										<input type="text" id="expMM" class="input m-9" maxlength="2" size="20" oninput="checkMM()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>년</b>
										<input type="text" id="expYY" class="input m-9" maxlength="2" size="20"><br>
										<div class="validation" id="cardExp_check"></div>
								</div>
							</div>
							<div class="rows">
								<span class="tit-tx m-4">
								<b>CVC</b>
								</span>
								<div class="con-tx m-8">
									<input type="text" id="cardCvc" name="cardCvc" value="${pay.cardCvc }"><br>
									<div class="validation" id="cardCvc_check"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="btn-box">
						<a href="javascript:void(0);" class="btn btn-blue btn-lg" onclick="submitCheck()">등록</a>
						<a href="/" class="btn btn-default1 btn-lg">취소</a>
						<a href="javascript:void(0);" class="btn btn-default1 btn-lg" id="deleteBtn">삭제</a>
 					</div>
				</div>
			</div>
		</div>
	</div>
<script>


//--------셀렉트값을 디비에서 가져와서 표현
var str1 = "${pay.cardCom}";
console.log(str1);
$("#cardCom").val(str1);

	var str = $("#cardExp").val();
	console.log("str", str);
	var expMM = str.substr(0, 2);
	console.log("expMM:", expMM);
	$("#expMM").val(expMM);
	var expYY = str.substr(2,2);
	$("#expYY").val(expYY);

	function submitCheck(){
		var str = ($("#expMM").val()+$("#expYY").val());
		$("#cardExp").val(str);
		console.log($("#cardExp").val());
		if(expR.test($("#expMM").val()) != true){
			alert('카드 유효기간을 다시 확인해주세요');
			document.getElementById('expMM').focus();
			return false;
			//$("#btn").prop('disabled', false);
		} else if($("#expYY").val() == ''){
			document.getElementById('expYY').focus();
			return false;
		} else if($("#expMM").val() == ''){
			document.getElementById('expMM').focus();
			return false;
		} else if($('#cardCvc').val() == ''){
			document.getElementById('cardCvc').focus();
			return false;
		} else if(cvcR.test($('#cardCvc').val()) != true){
			alert('카드 CVC번호는 숫자3자리 입니다.');
			document.getElementById('cardCvc').focus();
		} else if($('select[name=cardCom] option:selected').val() == ''){

			alert('카드회사를 선택해주세요');
			return false;
		} else if($("#cardNum").val() == ''){
			//$("#btn").prop('disabled', true);
			alert('카드번호를 입력해주세요');
			document.getElementById('cardNum').focus();
			return false;
		} else if(cardNumR.test($('#cardNum').val()) != true) {
			document.getElementById('cardNum').focus();
			return false;
		} else {
			document.rform.submit();
			alert('카드정보가 수정되었습니다.');
		}
	}

</script>
</body>
</html>