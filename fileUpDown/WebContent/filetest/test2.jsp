<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2.jsp</title>
</head>
<body>
	이름 : <%=name %><br>
	파일 : <%=upload %><br>
</body>
</html>