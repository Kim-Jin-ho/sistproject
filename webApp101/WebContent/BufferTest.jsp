<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ page buffer="8kb" autoFlush="true"%> 
<%-- <%@ page buffer="1kb" autoFlush="false" %> 일 경우 에러 발생--%>
<%-- <%@ page buffer="20kb" autoFlush="false" %> 일 경우 정상 처리--%>
<%-- <%@ page buffer="1kb" autoFlush="true"%>일 경우 정상 처리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>page 디렉티브 buffer 속성 및 autoFlush 속성 실습</h2>
</div>

<div>
	<%
	for(int i=1; i<=1000; i++)
	{%>
	1234
	<%
	}%>
</div>
</body>
</html>