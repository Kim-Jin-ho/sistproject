<%@page import="class3.com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터 베이스 연결
		dao.Connection();
		int result = dao.delete(sid);
		
		if(result == 0)
		{
			dao.remove(sid);				
			response.sendRedirect("MemberSelect.jsp");
		}else
		{
			response.sendRedirect("Notice.jsp");
		}
		
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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>