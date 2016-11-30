<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 구성 화면에서 소분류 불러오는 jsp 페이지
	
	String region = request.getParameter("searchKey");
	out.println("<select name='searchKey' style='width: 120px;' id='searchKey'size='5' onchange='sendIt()'>");
	if (region.equals("SRID"))
	{
		out.println("<option value='java'>자바</option> ");
		out.println("<option value='oracle'>오라클</option> ");
		out.println("<option value='c++'>C++</option> ");
	}else if(region.equals("CONSENT"))
	{
		out.println("<option value='1'>0개</option> ");
		out.println("<option value='2'>1개</option> ");
		out.println("<option value='3'>2개</option> ");
		out.println("<option value='4'>3개</option> ");
		out.println("<option value='5'>4개</option> ");
		out.println("<option value='6'>5개</option> ");
		out.println("<option value='7'>6개</option> ");
		out.println("<option value='8'>7개</option> ");
		out.println("<option value='9'>8개</option> ");
		
	}else if(region.equals("MINTIME"))
	{
		out.println("<option value='1'>1시간</option> ");
		out.println("<option value='2'>2시간</option> ");
		out.println("<option value='3'>3시간</option> ");
	}else if(region.equals("YESNO"))
	{
		out.println("<option value='1'>1시간</option> ");
		out.println("<option value='2'>2시간</option> ");
		out.println("<option value='3'>3시간</option> ");
	}else if(region.equals(""))
	{
		out.println("<option>검색종류를 선택하세요.</option>");
		RequestDispatcher rd = request.getRequestDispatcher("http://localhost:8090/StudyProject/StudyRoomMain.room");
		rd.forward(request, response); 	 	
	}
	out.println("</select>");
%>