<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JspTest003</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>HttpServlet 실습</h2>
	<hr>
</div>
<div>
	<!-- 『action』 속성에는 요청 주소가 들어간다. 
		 지금은 서버에서 실행될 서블릿 이름을 기재한다.-->
	<!-- 『method』 속성에는 요청 방식(전달 방식) 이 기재된다.
	      지금은 get 또는 post를 선택한다.-->
	<form action="/webApp101/login" method="get">
		아이디 <input type="text" name="userId" size="10" maxlength="10"><br>
		패스워드 <input type="text" name="userPwd" size="10"><br>
		
		<input type="submit" value="로그인"> 
		<button type="submit">로그인</button>
		<button type="reset">다시입력</button>
	</form>
</div>

</body>
</html>