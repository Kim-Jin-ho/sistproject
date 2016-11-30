<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");

	String contentType = request.getContentType();
	Enumeration e = request.getHeaderNames();
	
	out.print(contentType+"<br>");
	out.print("전송 받은 헤더 정보...<br>");
	
	while(e.hasMoreElements())
	{
		String key =(String)e.nextElement();
		String value = request.getHeader(key);
		out.print(key+"→"+value+"<br>");
	}
	
	out.print("<br>전송받은 데이터...<br>");
	DataInputStream is = new DataInputStream(request.getInputStream());
	
	String str;
	while((str = is.readLine()) != null)
	{
		out.println(new String(str.getBytes("ISO-8859-1"),"EUC-KR")+"<br>");
	}
	
	// 일반적으로 "ISO_8895-1" 을 많이 사용한다.
	// ISO-8859-1 은 국제 표준화 기구(ISO) 가 정한
	// 현재 사용되는 대부분의 브라우저에 서아용하는 charctor-set 이다.
	// 기존의 ASCII 코드와 128 코드 이외에
	// 서유럽 국가의 문자와 몇몇의 잘 알려진 비영워건 문자까지 포함되어 있다.
	
%>