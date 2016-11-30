<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="class3.com.test.GuestVO"/>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<div>
	<h2>작성 내용</h2>
	<hr>
</div>
<div>
	<h4>이름 : <%=vo.getUserName() %></h4>
	<h4>제목 : <%=vo.getSubject() %></h4>
	<h4>내용 : <%=vo.getContent().replace("\n", "<br>") %></h4>
	<h4>날짜 : <%=vo.getCreated() %></h4>
</div>
</body>
</html>