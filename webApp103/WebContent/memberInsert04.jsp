<%@page import="class3.com.test.MemberVO"%>
<%@page import="class3.com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//memberInsert04.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
			
	try
	{
		dao = new MemberDAO();
		
		MemberVO member = new MemberVO();
		
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출(insert 쿼리문 구성)
		dao.add(member);
			
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
	//사용자의 손에 쪽지 쥐어 주기 (URL 주소가 기록되어 있는 쪽지)
	response.sendRedirect("DBTest04.jsp");
%>
