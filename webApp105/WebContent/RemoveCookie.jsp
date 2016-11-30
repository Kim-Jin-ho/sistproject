<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie killCookie = new Cookie("cookie_test",null);
	killCookie.setMaxAge(0);
	response.addCookie(killCookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>쿠키삭제</h2>
	<hr>
</div>

<div>
	<h4>성공적으로 쿠키를 지웠습니다!!</h4>
</div>
</body>
</html>