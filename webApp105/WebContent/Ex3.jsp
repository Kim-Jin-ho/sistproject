<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String userName= (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	String userId = request.getParameter("userId");
	String userPwd= request.getParameter("userPwd");
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
	<h2>입력 받은 정보 출력</h2>
	<hr>
</div>
<div>
	<form>
		<table class="hi">
			<tr>
				<td>이름 : <%=userName %></td>
			</tr>
			<tr>
				<td>생일 : <%=userBirth %></td>
			</tr>
			<tr>
				<td>아이디 : <%=userId %></td>
			</tr>
			<tr>
				<td>비밀번호 : <%=userPwd %></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>