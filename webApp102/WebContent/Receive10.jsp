<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 인코딩 객체
	request.setCharacterEncoding("UTF-8");
	// Forward10.jsp 로부터
	// 결과값 넘겨받은 것 result 에 담아내기
	String result = (String)request.getAttribute("result"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>연산 결과 화면</h2>
	<hr>
</div>
<%=result %>
</body>
</html>