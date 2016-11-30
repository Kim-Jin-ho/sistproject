<%-- 한글 인코딩 지정을 위한 클래스 --%>
<%@page import="java.net.URLEncoder"%>
<%-- 달력 클래스 --%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//JSP 액션 태그 실습(jsp:forward)
	//f1.jsp
	
	String value = "test";	
	
	// param 내부 처리(데이터 전송 및 페이지 요청 방식)는
	// get 방식이기 때문에 한글은 기본적으로 깨진다.
	// 한글 데이터를 넘기는 부분에 있어서는 신경을 써야 한다.
	String h = "테스트";
	
	// 주소 형태로 넘겨지는 인토딩 방식을
	// 지정(번역) 하는 작업
	String hh = URLEncoder.encode(h,"UTF-8");
	
	// now 라는 이름으로 현재 시간을 전송
	request.setAttribute("now", Calendar.getInstance());	
%>
<%--
	- f2.jsp 로 포워딩
	- value 값 "test" 를 전송 (data라는 이름으로)
	- h 값 "테스트"를 hh로 인코딩 방식을 지정하여 전송	(hangul 이라는 이름으로)
	- 날짜 정보 전송 (now 라는 이름으로)
	※ 주의 : <jsp:forward> 액션 태그 내부에는 주석을 넣지 말 것! 
 --%>
<jsp:forward page="f2.jsp">
	<jsp:param value="<%=value %>" name="data"/>
	<jsp:param value="<%=hh %>" name="hangul"/>
</jsp:forward>