<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 『Calc』 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="class3.com.test.Calc" scope="page"/>

<!-- 속성 이름과 동일한 파라미터인 경우 getParameter() 메소드 없이 바로 받을 수 있다. -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="oper" name="ob"/>

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
	<h4><%=ob.result() %></h4>
</div>
</body>
</html>