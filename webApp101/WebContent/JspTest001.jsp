<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Document 가 실행 되기 전 인 이 위치가 가장 많이
	 사용될 위치     
-->
<%
	// 스크립트 릿
	int a = 10, b= 5, c;
	c= a+b;
	
	//-- 자바 코드의 실행 결과는 표현식에 의해 HTML 영역에 출력
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- 표현식 -->
	<h2>합 : <%=a %> + <%=b %> = <%=c %> </h2>
</div>
<%
	// 스크립트 릿
	
	// 『out』은 내장 객체로서 출력 스트림이다.
	// 자바 언어를 사용할 수 있기는 하나, 계행을 하려면 
	// html 에서 계행을 시켜야 하므로 <br> 태그를 활용 해야 한다.
	out.print("합 :" +  a  + "+"  + b + "=" + c + "<br>");
	out.print("합 :" +  a  + "+"  + b + "=" + c + "<br>");
	out.println("합 :" +  a  + "+"  + b + "=" + c + "<br>");
	out.println("합 :" +  a  + "+"  + b + "=" + c + "<br>");
	
	String str = String.format("합 : %d + %d = %d<br>", a,b,c);
	out.print(str);
%>

</body>
</html>