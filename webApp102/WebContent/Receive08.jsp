<%@ page contentType="text/html; charset=UTF-8"%> 
<%
	String temp = request.getParameter("gugudan");
	int gugudan = Integer.parseInt(temp);
	
	String result = "";

	for(int i =1; i<= 9; i++)
	{
		result += String.format("%d x %d = %d<br>", gugudan,i , (gugudan*i));
	}
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
	<h2>Send08.jsp 페이지에 대한 내용</h2>
	<hr>
</div>
<div>
	<%=result %>
</div>
</body>
</html>