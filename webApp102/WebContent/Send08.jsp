<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = "";
    for(int i=1; i<=9; i++)
    {
    	result += String.format("<a href='Receive08.jsp?gugudan=%1$d'>%1$d단</a><br>", i);
    	//result += String.format("<a href='Receive08.jsp?gugudan=%d'>%d단</a><br>", i, i);
    }
	/*--------------------------------------------------------------
	  ○ POST 방식은 편지를 보내는 방식과 유사한 전송 / 요청 방식
	   - 주소만 노출/ 데이터는 숨김
	   - <form> 태그에서 method 속성을 『"post"』로 설정해서 요청
	  
	  ○ GET 방식은 엽서를 보내는 방식과 유사한 전송 / 요청 방식
	   - 주소 + 데이터 (모두 노출)
	   - <form> 태그에서 method 속성을 『"get"』로 설정해서 요청
	     뿐만 아니라
	     URL 을 사용자가 작성하는 경우 다양한 처리 가능
	     <a href="htt://URL?키=값&키=값&...">
	     <form action="href="htt://URL?키=값&키=값&..."">
	     window.open("href="htt://URL?키=값&키=값&..."");
	     window.location.href="htt://URL?키=값&키=값&...";
	     window.location.replace("htt://URL?키=값&키=값&...");
	     						:
	----------------------------------------------------------------*/	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send08.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<!-- 
	○ 데이터 송수신 실습
	 - a 태그에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	 - 구구단 리스트를 동적으로 구성하여
	   선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	 - submit 버튼 없이 이벤트 처리를 한다.
	
	   구구단 선택
	   
	    1단  ←<a> 태그로 반복 구성된 리스트
	    2단
	    3단
	     :
	    9단 
-->



<div>
	<h2>구구단 선택</h2>
	<hr>
</div>

<div>
<%=result %>	

</div>
</body>
</html>