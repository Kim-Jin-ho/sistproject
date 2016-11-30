<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	String op = request.getParameter("op");
	String str = request.getParameter("str");
	
	if(op.equals("1"))
		op = "+";
	if(op.equals("2"))
		op = "-";
	if(op.equals("3"))
		op = "*";
	if(op.equals("4"))
		op = "/";
	
	String result = String.format("%s %s %s = %s", num1, op, num2, str);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>포워딩 및 리다이렉트 실습</h2>
	<hr>
</div>
<%=result %>
</body>
</html>