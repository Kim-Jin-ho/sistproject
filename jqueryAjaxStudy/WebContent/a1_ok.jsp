<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContentType();
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
<%= name%>님 환영합니다.