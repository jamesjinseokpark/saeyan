<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>업체 추가</title>
</head>
<body>
	<h1>업체 등록</h1>
	<form action='add' method='post' id='storeform'>
		ID :<input type='text' name='id' value="test123" readonly><br>  <!--${loginMember.name }-->
		상호명 :<input type='text' name='sname'><br>
		주소 :<input type='text' name='saddress'><br>
		전화번호:<input type='text' name='scontact'><br>
		사업자 등록 번호:<input type='text' name='snum'><br>
		<label for="banks">은행명:</label>
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
  		</select>
		계좌번호:<input type='text' name='bnum'><br>
		취급 품목 : <input type='button' id='btn' value='펼치기'><br>
		<fieldset>
			<legend>취급 품목 리스트</legend>
				<input type='checkbox' id='list' name='Blouse' value='0'>블라우스&nbsp;&nbsp;&nbsp;
				<input type='text' name='Blouse' value=''>
				<input type='checkbox' id='list' name='Shirt' value='0'>셔츠&nbsp;&nbsp;&nbsp;
				<input type='checkbox' id='list' name='T_shirt' value='0'>티셔츠&nbsp;&nbsp;&nbsp;
		</fieldset>
	</form>
<script>
	window.onload = function() {
		$("input[type='checkbox']").click(function() {
			if ($(this).is(':checked')) {
				//console.log($(this));
    			//$(this).val('1');
    			$("input[name=$(this).name]").val('1');
			} else {
				$(this).val('0');
			}
		});
	}
</script>
</body>
</html>