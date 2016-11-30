<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 입력받은 제목
	String subject = request.getParameter("subject");
	// 입력받은 내용
	String content = request.getParameter("content");
%>
<h3>제목 : <%=subject%></h3>
<h2>내용 : <%=content%></h2>