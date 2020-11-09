<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/headerReal.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- daum 도로명주소 찾기 api --> 
<script type="text/javascript">
//모든 공백 체크 정규식
var emptyR = /\s/g;
//아이디 정규식-8~12자의 영문 소문자, 숫자만 사용 가능합니다.
var idR=/^[a-z0-9]{8,12}$/;
//비밀번호 정규식-7~15자의 영문 대소문자, 숫자와 특수기호~!@\#$%<>^&*로만 사용 가능합니다.
var pwdR=/.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*/;
//이름 정규식-한글 2~4자 이내로 입력해주세요(특수문자, 공백 사용 불가)
var nameR=/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
//이메일 검사 정규식-이메일 양식을 확인해주세요
var emailR=/^[a-zA-Z0-9!#$%^&*_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+){1,2}$/;
//휴대폰 번호 정규식-'-'없이 번호만 입력해주세요
var phoneR=/^01([0|1|?)?([0-9]{8,9})$/;
//카드 번호 정규식 
var cardNumR = /([0-9]{12})/;
//업체 연락처 정규식
var scontactR = /^(0(2|))(\d{3,4})(\d{4})$/;

//중복검사 할건데 유효성 검사도 하고 그게 true되면 중복 검사까지!!
function checkId() {
	var regexIdResult = regexId();
	console.log('regexIdResult:',regexIdResult)
	if(regexIdResult == true){
		console.log("checkId");
		var inputed=$('#id').val();
		$.ajax({
			data: {
				id:inputed
			},
			url:"/auth1/addCustomer1",
			dataType:'text',
			method:'get',
			success:function(data){
				if(data=="0"){
					$("#id_check").text("사용 가능한 아이디 입니다..");
				} else {
					$("#id_check").text("이미 사용중인 아이디 입니다. 다시 입력해주세요");
					$("#id_check").css('color', 'red');
					$("#id").focus();
				}
			},
			error: function() {
				$("#id_check").text("url을 호출중 에러입니다.")}
		});
	}
}

 function regexId(){
 	//아이디 유효성 검사(정규식)
 	if($('#id').val() == ''){
 		$('#id_check').text('아이디를 입력해주세요');
 		$('#id_check').css('color', 'red');
	} else if(idR.test( $('#id').val() ) != true){
		$('#id_check').text('8~12자의 영문 소문자, 숫자만 사용 가능합니다.');
		$('#id_check').css('color', 'red');
		return false;
	} else {
 		return true;
	}
 }

 //----------------------------------------------------------------------------------
 //비번 유효성 검사
$(document).ready(function(){
	$('#pwd').focus(function() {
		checkPwd();
	});
});

function checkPwd() {
	console.log("result",pwdR.test( $('#pwd').val ()))
	if(pwdR.test( $('#pwd').val ()) == true){
		$('#pwd_check').text('사용가능한 비밀번호 입니다.');
		$('#pwd_check').css('color', 'black');
		return true;
	} else {
		$('#pwd_check').text('특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식로만 사용 가능합니다.');
		$('#pwd_check').css('color', 'red');
		return false;
	} 
}
//-----------------------------------------------------------------------------------------
//비번 재입력 일치 확인
$(document).ready(function(){
	$('#re-pwd').focus(function(){
		reCheckPwd();
	});
});

function reCheckPwd() {
	if($('#re-pwd').val() == ''){
		$('#pwd_re_check').text('비밀번호를 재입력 해주세요');
	} else if($('#pwd').val() != $('#re-pwd').val()) {
		$('#pwd_re_check').text('비밀번호가 일치하지 않습니다.');
		$('#pwd_re_check').css('color', 'red');
	} else {
		$('#pwd_re_check').text('비밀번호가 일치합니다.');
		$('#pwd_re_check').css('color', 'black');
	}
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//이름에 특수문자 들어가지 않도록 설정
$(document).ready(function(){
	$('#name').focus(function(){
		checkName();
	});
});

function checkName(){
	if(nameR.test($('#name').val()) != true){
		$('#name_check').text('한글 2~4자 이내로 입력해주세요.(특수기호, 공백 사용 불가)');
		$('#name_check').css('color', 'red');
	} else {
		$('#name_check').text('✔' );
		$('#name_check').css('color', 'black');
	}
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//이메일 양식 검사
//이메일 양식 검사
$(document).ready(function(){
	$('#email').focus(function(){
		checkEmail();
	});
});

function checkEmail() {
	var regExEmailResult = regExEmail();
	console.log('regExEmailResult:',regExEmailResult);
	if(regExEmailResult == true){
		console.log("이메일 중복체크");
		var inputed=$('#email').val();
		$.ajax({
			data: {
				email:inputed
			},
			url:"/auth1/emailCheck",
			dataType:'text',
			method:'get',
			success:function(data){
				if(data=="0"){
					$("#email_check").text("사용 가능한 이메일 입니다.");
					$("#email_check").css('color', 'black');
				} else {
					$("#email_check").text("이미 가입된 이메일 입니다. 이메일을 확인해주세요");
					$("#email_check").css('color', 'red');
					$("#email").focus();
				}
			},
			error: function() {
				$("#email_check").text("url을 호출중 에러입니다.")}
		});
	}
}

function regExEmail(){
	if($('#email').val() == ''){
		console.log("타니1");
		$('#email_check').text('이메일을 입력해주세요');
		$('#email_check').css('color', 'black');
		
	} else if(emailR.test($('#email').val()) != true){
		console.log("타니2");
		$('#email_check').text('이메일 양식을 확인해주세요');
		$('#email_check').css('color', 'red');
		return false;
	} else {
		console.log("타니3");
		$('#email_check').text('✔' );
		$('#email_check').css('color', 'black');
		return true;
	}
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//이메일 인증


	$(document).on("click", "#emailBtn", function(){
		var userEmail = $("#email").val();
		$.ajax({
			data:{email:userEmail},
			dataType:"json",
			method: "post",
			url: "/createEmailCheck",
			success : function(data){
				if(data==null){
					alert("이메일을 입력해주세요");
				}else{
					alert("이메일이 발송되었습니다. 인증번호 확인 후 입력해주세요");
				}
					
			},
			error: function(data){
					alert("에러가 발생했습니다.");
					return false;
			}
		});
	});

	$(document).on("click", "#codeBtn", function(){
		var email = $("#email").val();
		var userCode = $("#checkCode").val();
		console.log('userCode:',userCode)
		$.ajax({
			//data:{code:userCode},
			data:{
				email:email,				
				checkCode:userCode
			},
			method: "post",
			dataType: "json",
			//dataType: "json",
			url:"/checkCode11",
			success:function(data){
				console.log("data는",data);
				if(data==0){
					alert("인증이 완려되었습니다.");
					isComfirm = true; // 인증완료값
				} else {
					alert("인증번호를 잘못 입력하셨습니다. 인증번호를 ");
				}
			},
			error:function(error){
				alert("에러가 발생했습니다.");
				console.log('error - email check:', error)
			}
		});
	});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//핸드폰 번호 검사
$(document).ready(function(){
	$('#pnum').focus(function(){
		checkPnum();
	});
});

function checkPnum(){
	console.log("result",phoneR.test($('#pnum').val()));
	if($('#pnum').val() == ''){
		$('#pnum_check').text('휴대폰번호를 입력해주세요');
		$('#pnum_check').css('color', 'black');
	} else if(phoneR.test($('#pnum').val()) != true){
		$('#pnum_check').text('휴대폰번호를 확인해주세요("-"없이 입력)');
		$('#pnum_check').css('color', 'red');
	} else {
		$('#pnum_check').text('✔' );
		$('#pnum_check').css('color', 'black');
	}
}
//-----------------------------------------------------------------
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

//-----------------------------------------------------------------
function sample6_execDaumPostcode1() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress1").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode1').value = data.zonecode;
                document.getElementById("sample6_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress1").focus();
            }
        }).open();
    }
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//업체 연락처 유효성 검사
$(document).ready(function(){
	$('#scontact').focus(function(){
		checkScontact();
	});
});

function checkScontact(){
	if($('#scontact').val() == ''){
		$('#scontact_check').text('업체 연락처를 입력해주세요(02 포함 숫자만 입력)');
		$('#scontact_check').css('color', 'black');
	} else if (scontactR.test($('#scontact').val()) != true){
		$('#scontact_check').text('업체 연락처를 확인해주세요(02 포함 숫자만 입력)');
		$('#scontact_check').css('color', 'red');
	} else {
		$('#scontact_check').text('✔' );
		$('#scontact_check').css('color', 'black');
	}
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//파일 업로드 갯수제한 스크립트 추가
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//--------품목이 체크되면 Value값을 1로 변경해주는 함수
// $(document).ready(function(){
// 	$("input[type='checkbox']").click(function() {
// 		console.log(typeof ($('#list')));
// 		console.log($("input[type='checkbox']:checked").length);
// 		if ($(this).is(':checked')) {
// 			$(this).val('Y');       //체크된 체크박스는 value값을 1로 바꿈
			
// 		} else {
// 			$(this).val('N');			//체크되지 않은 체크박스는 value값을 0으로 바꿈
// 		}
// 	});
// });

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//submit not null chekc
function submitCheck() {
	if($('#id').val() == '') {
		alert('아이디를 입력해주세요.');
		return false;
	} else if($('#pwd').val() == '') {
		document.getElementById('pwd').focus();
		return false;
	} else if($('#re-pwd').val() == '') {
		document.getElementById('re-pwd').focus();
		return false;
	} else if($('#name').val() == '') {
		document.getElementById('name').focus();
		return false;
	} else if($('#email').val() == '') {
		document.getElementById('email').focus();
		return false;
	} else if($('#pnum').val() == '') {
		document.getElementById('pnum').focus();
		return false;
	} else if($('#sample6_postcode').val() == '') {
		document.getElementById('sample6_postcode').focus();
		return false;
	} else if($('#sample6_address').val() == '') {
		document.getElementById('sample6_address').focus();
		return false;
	} else if($('#sample6_extraAddress').val() == '') {
		document.getElementById('sample6_extraAddress').focus();
		return false;
	} else if($('#sample6_detailAddress').val() == '') {
		document.getElementById('sample6_detailAddress').focus();
		return false;
	} else if($('#sname').val() == '') {
		document.getElementById('sname').focus();
		return false;
	}else if($('#scontact').val() == '') {
		document.getElementById('scontact').focus();
		return false;
	}else if($('#snum').val() == '') {
		document.getElementById('snum').focus();
		return false;
	}else if($('#banks').val() == '') {
		document.getElementById('banks').focus();
		return false;
	}else if($('#bnum').val() == '') {
		document.getElementById('bnum').focus();
		return false;
	}else {
		var items="";
		$("input[type='checkbox']").each(function(){
			if($(this).is(":checked")==true){
				items += $(this).attr('id')+"!@#";
			} 
		});
		$("#items").val(items);

		var saddress = ($("#sample6_address1").val()+$("#sample6_extraAddress1").val());
		console.log($("#sample6_address1").val());
		console.log($("#sample6_extraAddress1").val());
		$("#saddress").val(saddress);
		console.log($("#saddress").val());

		
		var a = document.getElementsByName("storeFirstAddr")[0];
		aval = a.value;
		if(aval.indexOf("강남구")!=-1){
			$("[name='area_num']").val('1');
		} else if (aval.indexOf("강동구")!=-1){
			$("[name='area_num']").val('2');
		} else if (aval.indexOf("강북구")!=-1){
			$("[name='area_num']").val('3');
		} else if (aval.indexOf("강서구")!=-1){
			$("[name='area_num']").val('4');
		} else if (aval.indexOf("관악구")!=-1){
			$("[name='area_num']").val('5');
		} else if (aval.indexOf("광진구")!=-1){
			$("[name='area_num']").val('6');
		} else if (aval.indexOf("구로구")!=-1){
			$("[name='area_num']").val('7');
		} else if (aval.indexOf("금천구")!=-1){
			$("[name='area_num']").val('8');
		} else if (aval.indexOf("노원구")!=-1){
			$("[name='area_num']").val('9');
		} else if (aval.indexOf("도봉구")!=-1){
			$("[name='area_num']").val('10');
		} else if (aval.indexOf("동대문구")!=-1){
			$("[name='area_num']").val('11');
		} else if (aval.indexOf("동작구")!=-1){
			$("[name='area_num']").val('12');
		} else if (aval.indexOf("마포구")!=-1){
			$("[name='area_num']").val('13');
		} else if (aval.indexOf("서대문구")!=-1){
			$("[name='area_num']").val('14');
		} else if (aval.indexOf("서초구")!=-1){
			$("[name='area_num']").val('15');
		} else if (aval.indexOf("성동구")!=-1){
			$("[name='area_num']").val('16');
		} else if (aval.indexOf("성북구")!=-1){
			$("[name='area_num']").val('17');
		} else if (aval.indexOf("송파구")!=-1){
			$("[name='area_num']").val('18');
		} else if (aval.indexOf("양천구")!=-1){
			$("[name='area_num']").val('19');
		} else if (aval.indexOf("영등포구")!=-1){
			$("[name='area_num']").val('20');
		} else if (aval.indexOf("용산구")!=-1){
			$("[name='area_num']").val('21');
		} else if (aval.indexOf("은평구")!=-1){
			$("[name='area_num']").val('22');
		} else if (aval.indexOf("종로구")!=-1){
			$("[name='area_num']").val('23');
		} else if (aval.indexOf("중구")!=-1){
			$("[name='area_num']").val('24');
		} else {
			$("[name='area_num']").val('25');  //중랑구
		}
	}
		document.rform.submit();
}

</script>
</head>
<body>
	<div class="brd-bx">
		<div class="inner">
			<h3 class="h3-tit fir">업주 회원정보입력</h3>
			<div class="write-bx">
			<form name="rform" action="addOwner" method="post" enctype="multipart/form-data">
				<input type="hidden" name="grade" value="2">
				<input type="hidden" name="permit" value="N">
				<input type="hidden" name="sdcheck" value="N">
				<input type="hidden" id="cardCheck" name="cardCheck" value="N" >
				<div class="rows">
					<span class="tit-tx m-12">
					<b>아이디</b>
					</span>
					<div class="con-tx m-12">
						<input type="text" id="id" placeholder="ID" name="id" oninput="checkId()">
						<span class="help-tx">*8~12자의 영문 소문자, 숫자만 사용 가능합니다.</span>
						<div class="validation" id="id_check" ></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>비밀번호</b>
					</span> 
					<div class="con-tx me-12">
						<input type="password" id="pwd" placeholder="PASSWORD" name="pwd" oninput="checkPwd()">
						<span class="help-tx">*7~15자의 영문 대소문자, 숫자와 특수기호~!@\#$%<>^&*로만 사용 가능합니다.</span>
						<div class="validation" id="pwd_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>비밀번호 재확인</b>
					</span>
					<div class="con-tx me-12">
						<input type="password" id="re-pwd" placeholder="Confirm Password" name="re-pwd" oninput="reCheckPwd()">
						<span class="help-tx">*동일한 비밀번호를 다시 입력 해주세요.</span>
						<div class="validation" id="pwd_re_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>이름</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="name" placeholder="Name" name="name" oninput="checkName()">
						<span class="help-tx">*공백불가, 한글만 입력해주세요.</span>
						<div class="validation" id="name_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>이메일</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="email" placeholder="E-mail" name="email" oninput="checkEmail()"><button type="button" id="emailBtn" class="btn btn-gray m-3 call-poppwset" onclick="">이메일 발송</button><br>
						<input type="text" id="checkCode" placeholder="인증번호 입력" name="checkCode"><button type="button" id="codeBtn" class="btn btn-gray m-3 call-poppwset" >인증확인</button><br>
						<div class="validation" id="email_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>휴대전화</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="pnum" placeholder="Phone Number" name="pnum" oninput="checkPnum()">
						<span class="help-tx">*'-'없이 번호만 입력해주세요</span>
						<div class="validation" id="pnum_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>자택주소</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="sample6_postcode" placeholder="우편번호" name="userZipCode">
						<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-gray m-3 call-poppwset" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소" name="userFirstAddr">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="userExtraAddr"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="userSecondAddr">
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>상호명</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" name="sname"><br>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="tit-tx m-12">
						<b>사업자 등록 번호</b>
					</span>
					<div class="con-tx me-12">
						<input type='text' name='snum' id="snum"><br>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>상호 주소</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="sample6_postcode1" placeholder="우편번호" name="storeZipCode">
						<input type="button" onclick="sample6_execDaumPostcode1()" class="btn btn-gray m-3 call-poppwset" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address1" placeholder="주소"  name="storeFirstAddr">
						<input type="text" id="sample6_extraAddress1" placeholder="참고항목" name="storeExtraAddr"><br>
						<input type="text" id="sample6_detailAddress1" placeholder="상세주소" name="storeSecondAddr">				
						<input type='hidden' name='area_num' value='0'>
						<input type="hidden" id="saddress" name="saddress" value="">
					</div>
					<span class="tit-tx m-12">
					<b>상호 연락처</b>
					</span>
					<div class="con-tx me-12">
						<input type="text" id="scontact" placeholder="Store Contact Number" name="scontact" oninput="checkScontact()">
						<div class="validation" id="scontact_check"></div>
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
						<label for="banks"><b>은행명</b></label>
					</span> 
					<div class="con-tx me-12">
						<select id="banks" name="bank" >
				  			<option value="" selected>-은행을 선택해 주세요-</option>
				  			<option value="국민">국민</option>
				  			<option value="기업">기업</option>
				  			<option value="농협">농협</option>
				  			<option value="신한">신한</option>
				  			<option value="우체국">우체국</option>
				  			<option value="스탠다드차타드">스탠다드차타드</option>
				  			<option value="하나">하나</option>
				  			<option value="우리">우리</option>
				  			<option value="산업">산업</option>
				  			<option value="수협">수협</option>
				  			<option value="새마을금고">새마을금고</option>
				  			<option value="신용협동조합">신용협동조합</option>
				  			<option value="저축은행">저축은행</option>
				  			<option value="케이뱅크">케이뱅크</option>
				  			<option value="카카오뱅크">카카오뱅크</option>
		  				</select>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="tit-tx m-12">
					<b>계좌번호</b>
					</span>
					<div class="con-tx me-12">
						<input type='text' id="bnum" name='bnum' >
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>취급품목</b>
					</span>
					<div class="con-tx me-12">
						<c:forEach var="product" items="${product}" varStatus="status">
							<input type='checkbox' id='${product.pname }' name='items' value='${product.pname}'>${product.pname}&nbsp;&nbsp;&nbsp;
							<c:if test="${status.count%5==0}"><br></c:if>
						</c:forEach>
						<input type="hidden" id ="items" name="items" value="">
					</div>
				</div>
				<div class="rows">
					<span class="tit-tx m-12">
					<b>업장사진</b>
					</span>
					<div class="con-tx">
						<span class="file-inp">
						<input type="file" id="file" value="파일 선택" class="input" multiple="multiple" name="uploadFile" maxlength="4"/><br>
						<p class="help-tx">*사진은 최대 4개까지 업로드 가능합니다.</p>
						</span>
					</div>
				</div>
				
			</form>
			</div>
			<div class="btn-box">
				<a href="javascript:void(0);" class="btn btn-blue btn-lg" onclick="submitCheck()" id="submintCheck">완료</a>
				<a href="/" class="btn btn-default1 btn-lg">취소</a>
			</div>
		</div>
	</div>	
</body>
</html>