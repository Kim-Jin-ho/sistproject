<%@page import="class3.com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";

	try
	{
		Connection conn = DBConn.getConnection();
		if(conn!= null)
			str = "데이터베이스 연결 성공!";
	}catch(Exception e)
	{
		str = e.toString();
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
	<h2>데이터베이스 연결 실습</h2>
	<hr>
</div>
<div>
	<h3><%=str %></h3>
</div>

</body>
</html>