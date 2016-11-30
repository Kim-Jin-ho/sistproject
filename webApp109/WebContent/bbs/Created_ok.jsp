<%@page import="com.util.DBConn"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%	
	
	try
	{
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAO(conn);	
		
		int maxNum = dao.getMaxNum();
		
		dto.setNum(maxNum+1);		//-- 게시물 번호의 최대값에다 + 1을 해서 setter 함
		dto.setIpAddr(request.getRemoteAddr());
		
		dao.insertDate(dto);
		
	}catch(Exception e)
	{
		System.out.print(e.toString());	
	}finally
	{
		try
		{
			DBConn.close();	
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
	
	response.sendRedirect(cp+"/bbs/List.jsp");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created_ok.jsp</title>
</head>
<body>
<h4><%=dto.getSubject() %></h4>
<h4><%=dto.getName() %></h4>
</body>
</html>