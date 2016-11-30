<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 추가/구성/삭제 페이지에서 소분류 불러오는 jsp 페이지
	
	String region = request.getParameter("region");
	String dj="g2";
	out.println("<select name='sel1' id='sel1'size='5' onclick='insertValue2(this.value)'>");
	if (region.equals("1"))
	{
		out.println("<option value='1'>"+dj+"</option> ");
		out.println("<option value='2'>오라클</option> ");
		out.println("<option value='3'>C++</option> ");
	}else if(region.equals("2"))
	{
		out.println("<option value='4'>영어</option> ");
		out.println("<option value='5'>일본어</option> ");
		out.println("<option value='6'>중국어</option> ");
	}else if(region.equals("3"))
	{
		out.println("<option value='5'>일본어</option> ");
		out.println("<option value='5'>일본어</option> ");
		out.println("<option value='5'>일본어</option> ");
	}
	out.println("</select>");
%>