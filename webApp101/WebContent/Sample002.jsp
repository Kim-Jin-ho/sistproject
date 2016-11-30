<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuilder str = new StringBuilder();
	
	//방법 1
	int a = 5;
	for (int i=1; i<=9; i++ )
	{
		str.append(String.format("%d * %d = %d<br>",a,i,(a*i)));
	}
	str.append("<br>");
	
	//방법 2
	String st = "";
	int f = 5;
	for (int i=1; i<=9; i++)
	{
		st += f + " * " + i + " = " + (f*i) +"<br>";
	}
	st+= "<br>";
	
	//방법 3
	int[] ta = new int[9];
 	int g = 5;
 	for (int i = 1 ; i<= 9; i++)
 	{
 		ta[i-1] = g*i;
 		out.print(g+" * " + i + " = " + ta[i-1] + "<br>");
 	}
 	out.print("<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<!-- 
	○ 문제(스크립트릿 / 표현식 테스트)
	- 구구단 중에서 5단을 출력하는 JSP 페이지를 작성한다.
	- 요청 주소는 『http://localhost:8090/webApp101/Sample002.jsp』로 한다.
	- 반복문을 활용한다.
	- (~ 17:40) 까지
	
	   
 -->
 <%=str %>
 <%=st%>
</body>
</html>