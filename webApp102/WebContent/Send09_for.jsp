<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	
	request.setAttribute("msg", "안녕하세요.");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이름 : <%=name %></h3>
<jsp:forward page="Receive09.jsp"></jsp:forward>
</body>
</html>