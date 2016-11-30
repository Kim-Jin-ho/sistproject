<%@ page contentType="text/html; charset=UTF-8"%>
 <%
	int sum = 0;
	int num = 1;
	
	while(num <=100)
	{
		sum+= num;
		num++;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample004</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<!-- 
	○문제 (스크립트 릿 / 표현식 테스트)
	- 1부터 100까지의 합을 계산하여 출력하는 JSP 페이지를 작성한다.
	- while 반복문을 활용한다.
	- 요청 주소는 『http://localhost:8090/webApp101/Sample004.jsp』
	- 09:40
 -->
 <div>
 	<h2> JSP 기초</h2>
 	<hr>
 </div>
 <div>
	1부터 100까지의 합: <%=sum %> 
</div>
</body>
</html>