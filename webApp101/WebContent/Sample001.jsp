<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	
	//JSP 코드 작성(자바 코드작성)
	// 1 부터 10까지의 수를 출력하는 구문 작성
	
	String str = "<h2>";
	for(int i =1; i<= 10; i++)
		str +="["+ i + "]";
	str += "</h2>";
	
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("<ul>");
	for(int i=1; i<=10; i++)
	{
		//sb.append("<li>" +i+ "</i>");
		sb.append(String.format("<li>%d</li>",i));	
	}
	sb.append("</ul");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
	○ 문제 (스크립트 / 표현식 테스트)
     - 1 부터 10까지의 수를 출력하는 JSP 페이지를 작성한다.
     - 요청 주소는 『http://localhost:8090/webApp101/Sample』
     - 반복문을 활용한다.
 -->
</head>
<body>
<div>
	<h2>JSP 기초</h2>
	<hr>
</div>
<!-- <ul><li>1</li><li>2</li> ... -->
<!--  JSP 실행 결과를 출력하는 영역 -->
<%=sb %>
<%=str %>
</body>
</html>