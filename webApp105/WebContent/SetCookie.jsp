<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie c = new Cookie("cookie_test","test");
 	c.setMaxAge(3600);
 	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetCookie.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>쿠키 설정 및 추가</h2>
	<hr>
</div>
<div>
	<h4>성공적으로 쿠키를 추가하였습니다.</h4>
</div>
</body>
</html>
