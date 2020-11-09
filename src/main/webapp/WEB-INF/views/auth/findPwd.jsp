<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on("click", "#randomPwd", function(){
		var email =$("#email").val();
		var id = $("#id").val();
		var name = $("#name").val();
		$.ajax({
			data:{
				id:id,
				name:name,
				email:email,
			},
			method:"post",
			dataType:"json",
			url:"/creatRandomPwd",
			success:function(data){
				if(data==null){
					alert("이메일을 입력해주세요");
				} else {
					alert("임시 비밀번호가 입력하신 이메일로 전송되었습니다.")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
</script>
</head>
<body>
		이름:	 <input type="text" name="name" id="name"><br>
		아이디: <input type="text" name="id" id="id"><br>
		이메일: <input type="text" name="email" id="email"><br>
		<button type="button" id="randomPwd">비밀번호 찾기</button>
		<input type="button" onclick="location.href='/auth/login'" value="로그인">	
</body>
</html>