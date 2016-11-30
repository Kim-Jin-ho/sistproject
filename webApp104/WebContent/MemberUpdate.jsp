<%@page import="class3.com.test.MemberVO"%>
<%@page import="class3.com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("tel");
	
	MemberDAO dao = new MemberDAO();
	try
	{
		// 데이터베이스 연결
		dao.Connection();
		
		MemberVO member = new MemberVO();
		
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}finally
	{
		try
		{
			dao.close();
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
	response.sendRedirect("MemberSelect.jsp");
%>