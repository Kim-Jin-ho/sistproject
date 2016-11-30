<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userId= (String)session.getAttribute("userId");

	if(userId==null)
	{
		response.sendRedirect("Test1.jsp");
	}
	String sid = session.getId();
	int t = session.getMaxInactiveInterval();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>세션 처리 - 로그인 성공 및 세션처리 내용 확인 </h2>
	<hr>
</div>

<div>
	<h4>일정관리</h4>
	
	세션 아이디 : <%=sid %><br>
	세션 유지시간 : <%=t %><br>
	
</div>
</body>
</html>