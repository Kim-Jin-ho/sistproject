<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//데이터 수신
	request.setCharacterEncoding("UTF-8");

	//param 을 통해 전송한 데이터는 getPrameter()를 통해 수신한다.
	String v = request.getParameter("data");
	
	// setAttribute() 를 통해 전송한 데이터는 getAttribute() 를 통해 수신한다.
	// setAttribute() 의 now 로 수신된 현재시간dmf Calendar 로 캐스팅
	
	
	Calendar cal = (Calendar)request.getAttribute("now");
	String str = String.format("%tT", cal);
	
	//한글 수신하는 부분
	String h = request.getParameter("hangul");
	String hh =URLDecoder.decode(h, "UTF-8");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>f2.jsp</title>
</head>
<body>
<div>
	<h2>JSP 액션 태그 실습(jsp:forward)</h2>
	<hr>
</div>
<div>
	포워딩 된 페이지<br>
	수신데이터 1: <%=v %><br>
	수신데이터 2: <%=str %><br>
	수신데이터 3: <%=hh %><br>
</div>
</body>
</html>