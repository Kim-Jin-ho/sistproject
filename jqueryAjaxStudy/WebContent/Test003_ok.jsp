<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>

<%
	request.setCharacterEncoding("UTF-8");

	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	
	int s=0;
	
	if(oper.equals("hap"))
		s = su1 + su2;
	else if(oper.equals("sub"))
		s = su1 - su2;
	else if(oper.equals("mul"))
		s = su1 * su2;
	else if(oper.equals("div"))
		s = su1 / su2;

	StringBuffer sb = new StringBuffer();
	sb.append("<?xml version='1.0' encoding='UTF-8'?>");
	sb.append("<root>");
	sb.append(s);
	sb.append("</root>");
	
	System.out.println(sb.toString());
	
	response.setContentType("text/xml; charset=utf-8");
	response.getWriter().write(sb.toString());

%>










