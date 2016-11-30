<%@page import="class3.com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreDelete.jsp
	
	String sid = request.getParameter("sid");

	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		//데이터 베이스 연결
		dao.Connection();
		
		// delete 쿼리문을 수행하는 메소드 호출 remove(String sid)
		
		dao.remove(sid);
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
	response.sendRedirect("MemberScoreSelect.jsp");
%>