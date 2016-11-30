<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] ck = request.getCookies();
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
	<h2>쿠키 얻어내기</h2>
	<hr>
</div>

<div>
	<table>
		<tr>
			<th> 쿠키 이름</th><th>쿠키 값</th>
		</tr>
		<%
			for(Cookie c : ck)
			{
		%>
		<tr>
			<td><%=c.getName() %></td>
			<td><%=c.getValue() %></td>
		</tr>
		  <%} %>
	</table>
</div>
</body>
</html>