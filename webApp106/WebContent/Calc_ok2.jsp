<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	
	String oper = request.getParameter("oper");
	
	
	
%>
<!-- 『Calc』 클래스의 객체를 현재 페이지에서 사용할 수 있또록 지정 -->
<jsp:useBean id="ob" class="class3.com.test.Calc" scope="page"/>
<!-- class3.com.test.Calc ob = new class3.com.test.Calc(); -->

<!-- getParameter() 메소드를 이용해서 전달 받은 데이터를 
     『Calc』 객체에 넘겨주기 위해 속성 지정  -->
     
<jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/>
<jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/>
<jsp:setProperty property="oper" name="ob" value="<%=oper %>"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>계산 결과</h2>
	<hr>
</div>
<div>
	<h2><%=ob.result() %></h2>
</div>
</body>
</html>