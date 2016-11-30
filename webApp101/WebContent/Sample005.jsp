<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int sum = 0;
	int cnt = 1;
	
	StringBuilder stb = new StringBuilder();
	for (int i=1; i<=100; i++)
	{
		
		if( i%4==0)
		{
			stb.append("<td>");
			// HTML에서는 %3d , %5d 같은 공백은 1칸으로밖에 인식 못한다.
			stb.append( String.format("%d ",i));
			if(cnt % 5 == 0)
			{
				stb.append("<tr></tr>");
			}
			cnt++;
			stb.append("</td>");
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample004</title>
</head>
<body>
<!-- 
	○ 문제 (스크립트 릿 / 표현식 테스트)
	- 1부터 100까지의 수 중에서 4의 배수만 출력하는 JSP 페이지를 작성한다.
	- 한 줄에 5개씩만 출력하도록 한다.
	- 빈 줄 바꿈은 『<br>』 태그를 활용한다.
	- for 반복문을 활용한다.
	- 요청 주소는 『http:localhost:8090/webApp101/Sample005.jsp』
	- 
 -->
<div>
	<h2></h2>
</div>
<div>
	<table border="1">
	 <%=stb %>
	</table>
</div>
</body>
</html>