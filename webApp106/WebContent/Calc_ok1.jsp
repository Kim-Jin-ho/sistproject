<%@page import="class3.com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	
	// 클래스를 사용하기 위해 객체 생성
	Calc ob = new Calc();
	
	ob.setSu1(su1);
	ob.setSu2(su2);
	ob.setOper(oper);
	
	String str = ob.result();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok1.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>계산 결과</h2>
	<hr>
</div>

<div>
	<h4><%=str %></h4>
</div>
</body>
</html>