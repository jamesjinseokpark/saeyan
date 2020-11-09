<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- daum 도로명주소 찾기 api -->
<title>업체 추가</title>
</head>
<body>
	<h1>업체 등록</h1>
	<form action='add' name='form1' method='post' id='storeform' enctype="multipart/form-data">
		ID :<input type='text' name='id' value=${loginMember.id } readonly><br>
		상호명 :<input type='text' name='sname'><br>
		<label>점포주소</label> 
		<input type="text" id="sample6_postcode" placeholder="우편번호" name="storeZipCode" value="${storeInfo.storeZipCode}">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="storeFirstAddr" value="${storeInfo.storeFirstAddr}"><br>
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="storeExtraAddr" value="${storeInfo.storeExtraAddr}"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="storeSecondAddr" value="${storeInfo.storeSecondAddr}">
		<input type="hidden" id="saddress" name="saddress" value="">
		전화번호:<input type='number' name='scontact'><br> 
		사업자 등록 번호:<input type='number' name='snum'><br> <label for="banks">은행명:</label>
		<select id="banks" name="bank" form="storeform">
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
		</select> 계좌번호:<input type='number' name='bnum'><br> 취급 품목 : <input type='button' id='btn' value='펼치기'><br>
		<fieldset>
			<legend>취급 품목 리스트</legend>
			<c:forEach var="tt" items="${product}" varStatus="status">
				<input type='checkbox' id='${tt.pname }' name='item' value='${tt.pname}'>${tt.pname}&nbsp;&nbsp;&nbsp;
				<c:if test="${status.count%5==0}"><br></c:if>
			</c:forEach>
<!-- 			<input type='checkbox' id='와이셔츠' name='Y1' value="">와이셔츠&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='블라우스' name='B1' value="">블라우스&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='티셔츠' name='T1' value="">티셔츠&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='맨투맨,후드' name='M1' value="">맨투맨,후드&nbsp;&nbsp;&nbsp;  -->
<!-- 			<input type='checkbox' id='바지' name='P1' value="">바지&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='니트류' name='K1' value="">니트류&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='자켓' name='J1' value="">자켓&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='코트' name='C1' value="">코트&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='패딩' name='P2' value="">패딩&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='슈즈(신발류)' name='D1' value="">슈즈(신발류)&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='셔츠' name='S1' value="">셔츠&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='커튼' name='C2' value="">커튼&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type='checkbox' id='가방류' name='B2' value="">가방류&nbsp;&nbsp;&nbsp; -->
		</fieldset>
		<input type='hidden' id='items' name='items' value=""> 
		<input type='hidden' name='area_num' value='0'>
		<input type="file" id="file" value="파일 선택" multiple="multiple" name="uploadFile" maxlength="4"/><br>
		<button onclick="abcd();">추가</button>
	</form>
	<script>
	
		//--------품목이 체크되면 Value값을 1로 변경해주는 함수
// 		$("input[type='checkbox']").click(function() {
// 			if ($(this).is(':checked')) {
// 				$(this).val('Y');         //체크된 체크박스는 value값을 1로 바꿈
// 			} else {
// 				$(this).val('N');			//체크되지 않은 체크박스는 value값을 0으로 바꿈
// 			}
// 		});
// 	}

	



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
	//--------서브밋 할때 현재 체크 상태 확인해서 체크된건 스트링형태로 items에 저장
	
	function abcd(){
	//--------------------saddress합치는거
		var saddress = ($("#sample6_address").val()+$("#sample6_extraAddress").val());
		console.log($("#sample6_address").val());
		console.log($("#sample6_extraAddress").val());
		$("#saddress").val(saddress);
		console.log($("#saddress").val());
		
		
		var items="";
		$("input[type='checkbox']").each(function(){
			if($(this).is(":checked")==true){
				items += $(this).attr('id')+"!@#";
				$(this).val('Y');
			} 
		});
		$("#items").val(items);

		
		//-----------area_num값을 자동으로 입력해주는 함수
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
   		document.storeform.submit();
	}
</script>
</body>
</html>