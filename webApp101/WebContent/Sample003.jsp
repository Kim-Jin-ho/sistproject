<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int a = 990;
	
	int obek = (a/500);
	int bek = (a%500)/100;
	int osib = ((a%500)%100)/50;
	int sib = (((a%500)%100)%50)/10;
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
	○ 문제(스크립트 릿/ 표현식 테스트)
	 - 임의의 금액(990원) 을 화폐 단위로 구분하여 출력하는 JSP 페이지를 작성한다.
	 - 화폐 단위는 계산 편의상 1천웜 미만 10원 이상만 가능하다고 가정한다.
	 - 요청 주소는 『http://lacalhost:8090/webApp101/Sample003.jsp』로한다
	 - ~ 09:20 까지
-->
<div>
	<h2>JSP 기초</h2>
	<hr>
</div>

<div>
		금액입력  : <%=a %>
		화폐 단위 : 오백원 <%=obek %> , 백원<%=bek %>, 오십원 <%=osib %>, 십원<%=sib %><br>
</div>
</body>
</html>